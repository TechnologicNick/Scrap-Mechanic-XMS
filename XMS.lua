--------------------------------------
--Copyright (c) 2019 TechnologicNick--
--------------------------------------

--[[
    Can I use this in my mod?

    Yes! You do not have to ask for my permission. It's free of charge.
]]

--[[
    >>> How it works <<<

    All Userdata objects in lua have a bug where their items are shared:
        > Userdata_A.foo = "foo"
        > Userdata_B.foo = "bar"
        > print(Userdata_A.foo)
        "bar"

    This works for every Userdata object and the items are only accessable for
    the mod the script is running. However, a <Widget> Userdata is special. For
    some reason the items of the <Widget> Userdata are shared between all mods.

    This script uses that bug to allow other mods to use shared variables.
]]

function XMS_Manager(modName)
    local object = {}

    object.version = "0.2"
    object.modName = modName
    object.prefix = "xms_channel_"
    object.isInitialised = false
    object.layout = nil

    function object.client_onSetupGui(self)
        self.layout = sm.gui.load("Logotype.layout", true)
        self.isInitialised = true

        -- Saves versions for backwards compatibility in the future
        local tmpPrefix = self.prefix
        self.prefix = ""

        local modList = self:getXMS("modList")
        if not modList then
            modList = {}
        end

        modList[self.modName] = {modName = self.modName, version = self.version}

        self:setXMS("modList", modList)
        self.prefix = tmpPrefix
    end

    function object.setXMS(self, channel, value)
        assert(self.isInitialised, "The XMS_Manager is not initialised yet!")
        self.layout[self.prefix .. tostring(channel)] = value
    end

    function object.getXMS(self, channel)
        assert(self.isInitialised, "The XMS_Manager is not initialised yet!")
        return self.layout[self.prefix .. tostring(channel)]
    end

    return object
end

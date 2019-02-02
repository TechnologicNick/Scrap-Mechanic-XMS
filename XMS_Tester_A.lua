-- XMS_Tester_A.lua --
dofile( "XMS.lua" )

XMS_Tester_A = class( nil )
XMS_Tester_A.maxChildCount = 0
XMS_Tester_A.maxParentCount = 1
XMS_Tester_A.connectionInput = sm.interactable.connectionType.logic
XMS_Tester_A.connectionOutput = sm.interactable.connectionType.none
XMS_Tester_A.colorNormal = sm.color.new( 0x404040ff )
XMS_Tester_A.colorHighlight = sm.color.new( 0x606060ff )

function XMS_Tester_A.client_onCreate( self )
    self.xmsManager = XMS_Manager("XMS_Tester_A")
end

function XMS_Tester_A.client_onSetupGui( self )
    self.xmsManager:client_onSetupGui()
end

function XMS_Tester_A.client_onInteract( self )
    self.xmsManager:setXMS(0, math.pi)
    self.xmsManager:setXMS(1, true)
    self.xmsManager:setXMS(2, "Lorem ipsum dolor")
    self.xmsManager:setXMS(3, testfunction)
end

function testfunction()
    print("This is a function printing the secret value: " .. secret_value) -- This will print "I don't like MLP" even if it's sent to a different mod.
end

secret_value = "I don't like MLP"

-- XMS_Tester_B.lua --
dofile( "XMS.lua" )

XMS_Tester_B = class( nil )
XMS_Tester_B.maxChildCount = 0
XMS_Tester_B.maxParentCount = 1
XMS_Tester_B.connectionInput = sm.interactable.connectionType.logic
XMS_Tester_B.connectionOutput = sm.interactable.connectionType.none
XMS_Tester_B.colorNormal = sm.color.new( 0x404040ff )
XMS_Tester_B.colorHighlight = sm.color.new( 0x606060ff )

function XMS_Tester_B.client_onCreate( self )
    self.xmsManager = XMS_Manager("XMS_Tester_B")
end

function XMS_Tester_B.client_onSetupGui( self )
    self.xmsManager:client_onSetupGui()
end

function XMS_Tester_B.client_onInteract( self )
    print(self.xmsManager:getXMS(0))
    print(self.xmsManager:getXMS(1))
    print(self.xmsManager:getXMS(2))
    self.xmsManager:getXMS(3)()
end

secret_value = "I like MLP"

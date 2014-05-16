local clickOffset = {x = 0, y = 0}
local dtest_Placement = {x = UIParent:GetRight()-(64 + 512), y = 285}
local lastFrameTime = 0
local context = UI.CreateContext("SLEInfo")

local window = UI.CreateFrame("RiftWindow", "MainWindow", context)
window:SetTitle("SLE Info")
window:SetWidth(200)
window:SetHeight(330)

window.dragActive = false

local dtestDrag = UI.CreateFrame("Frame", "drag frame", window)
dtestDrag:SetAllPoints()

function dtestDrag.Event:LeftDown()
	window.dragActive = true
	local mouseStatus = Inspect.Mouse()
	clickOffset["x"] = mouseStatus.x - dtest_Placement["x"]
	clickOffset["y"] = mouseStatus.y - dtest_Placement["y"]
end

function dtestDrag.Event:LeftUp()
	window.dragActive = false
end

function dtestDrag.Event:LeftUpoutside()
	window.dragActive = false
end

function dtestDrag.Event:MouseMove(x,y)
	if window.dragActive == true then
		dtest_Placement["x"] = x - clickOffset["x"]
		dtest_Placement["y"] = y - clickOffset["y"]	
		window:SetPoint("CENTER", context, "TOPCENTER", dtest_Placement["x"], dtest_Placement["y"])
	end
end

local AOF = UI.CreateFrame("RiftButton", "ArchieveofFlesh", window)
AOF:SetText("Archieve of Flesh")
AOF:SetPoint("CENTER", window, "TOPCENTER", 0, 60 )
AOF:SetLayer(2)

local GF = UI.CreateFrame("RiftButton", "GolemFoundry", window)
GF:SetText("Golem Foundry")
GF:SetPoint("CENTER", window, "TOPCENTER", 0, 90)
GF:SetLayer(2)

local EC = UI.CreateFrame("RiftButton", "EmpryeanCore", window)
EC:SetText("Empryean Core")
EC:SetPoint("CENTER", window, "TOPCENTER", 0, 120)
EC:SetLayer(2)

local EOTSQ = UI.CreateFrame("RiftButton", "ExodusoftheStormQueen", window)
EOTSQ:SetText("Exodus of the Storm Queen")
EOTSQ:SetPoint("CENTER", window, "TOPCENTER", 0, 150)
EOTSQ:SetLayer(2)

local RTD = UI.CreateFrame("RiftButton", "ReturntoDeepstrike", window)
RTD:SetText("Return to Deepstrike")
RTD:SetPoint("CENTER", window, "TOPCENTER", 0, 180)
RTD:SetLayer(2)

local ROTD = UI.CreateFrame("RiftButton", "RealmofTwistedDreams", window)
ROTD:SetText("Realm of Twisted Dreams")
ROTD:SetPoint("CENTER", window, "TOPCENTER", 0, 210)
ROTD:SetLayer(2)

local SBP = UI.CreateFrame("RiftButton", "StormBreakerProtocol", window)
SBP:SetText("Storm Breaker Protocol")
SBP:SetPoint("CENTER", window, "TOPCENTER", 0, 240)
SBP:SetLayer(2)

local TOTS = UI.CreateFrame("RiftButton", "ToweroftheShattered", window)
TOTS:SetText("Tower of the Shattered")
TOTS:SetPoint("CENTER", window, "TOPCENTER", 0, 270)
TOTS:SetLayer(2)

local UBF = UI.CreateFrame("RiftButton", "UnhollowedBoneForge", window)
UBF:SetText("Unhollowed Bone Forge")
UBF:SetPoint("CENTER", window, "TOPCENTER", 0, 300)
UBF:SetLayer(2)

function AddOnLoadComplete(handle, addOnName)
	if addOnName == "SLEInfo" then
		window:SetPoint("CENTER", context, "TOPCENTER", dtest_Placement["x"], dtest_Placement["y"])  
		window:SetVisible(true)
	end
end

Command.Event.Attach(Event.Addon.Load.End, AddOnLoadComplete, "LoadComplete")
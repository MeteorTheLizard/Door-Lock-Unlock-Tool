TOOL.Category		= "Construction"
TOOL.Name			= "#Tool.doorlockunlock.name"

if CLIENT then
	language.Add("Tool.doorlockunlock.name","Door Lock/Unlock")
	language.Add("Tool.doorlockunlock.desc","Lock or Unlock Doors.")
	language.Add("Tool.doorlockunlock.0","Primary: Lock, Secondary: Unlock")
end

local function ProperValid(trace)
	if not trace.Entity:IsValid() then return false end
	if trace.Entity:IsPlayer() then return false end
	if SERVER and not trace.Entity:GetPhysicsObject():IsValid() then return false end
	return true
end

function TOOL:LeftClick(trace)
	if CLIENT and ProperValid(trace) then return true end
	if not ProperValid(trace) then return false end
	
	if SERVER then
		trace.Entity:Fire("lock")
		trace.Entity:EmitSound("doors/latchlocked2.wav",75,100,1,CHAN_AUTO)
	end
	
	return true
end

function TOOL:RightClick(trace)
	if CLIENT and ProperValid(trace) then return true end
	if not ProperValid(trace) then return false end
	
	if SERVER then
		trace.Entity:Fire("unlock")
		trace.Entity:EmitSound("doors/latchunlocked1.wav",75,100,1,CHAN_AUTO)
	end
	
	return true
end

function TOOL:Reload()
	return false
end

function TOOL:Think()
	if CLIENT then return end
	local pl = self:GetOwner()
	local wep = pl:GetActiveWeapon()
	if not wep:IsValid() or wep:GetClass() != "gmod_tool" or pl:GetInfo("gmod_toolmode") != "doorlockunlock" then return end
	local trace = pl:GetEyeTrace()
	if not ProperValid(trace) then return end
end

function TOOL.BuildCPanel(cp)
	cp:AddControl("Header",{Text = "#Tool.doorlockunlock.name",Description = "#Tool.doorlockunlock.desc"})
end
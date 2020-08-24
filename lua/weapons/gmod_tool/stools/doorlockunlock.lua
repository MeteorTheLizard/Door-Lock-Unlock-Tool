TOOL.Category = "Construction"
TOOL.Name = "#Tool.doorlockunlock.name"

if CLIENT then
	function TOOL.BuildCPanel(CPanel)
		CPanel:AddControl("Header",{
			Description = "#tool.doorlockunlock.desc"
		})
	end

	language.Add("Tool.doorlockunlock.name","Door Lock/Unlock")
	language.Add("Tool.doorlockunlock.desc","Lock or Unlock Doors.")
	language.Add("Tool.doorlockunlock.left","Primary: Lock")
	language.Add("Tool.doorlockunlock.right","Secondary: Unlock")
end

TOOL.Information = {
	{
		name = "left"
	},
	{
		name = "right"
	}
}

function TOOL:LeftClick(trace)
	local Ent = trace.Entity
	if not IsValid(Ent) then return end

	if SERVER then
		Ent:Fire("lock")
		Ent:EmitSound("doors/latchlocked2.wav")
	end

	return false
end

function TOOL:RightClick(trace)
	local Ent = trace.Entity
	if not IsValid(Ent) then return end

	if SERVER then
		Ent:Fire("unlock")
		Ent:EmitSound("doors/latchunlocked1.wav")
	end

	return false
end

function TOOL:Reload()

end
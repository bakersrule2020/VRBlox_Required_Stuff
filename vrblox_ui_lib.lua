local GetAsset = getsynasset or getcustomasset

local function LoadCustomInstance(url)
	if url == "" then
		return ""
	elseif string.find(url, "rbxassetid://") or string.find(url, "roblox.com") or tonumber(url) then
		local numberId = string.gsub(url, "%D", "")
		return game:GetObjects("rbxassetid://".. numberId)[1]
	else
		local fileName = "customInstance_".. tick().. ".txt"
		local instance = nil
		writefile(fileName, game:HttpGet(url))
		instance = game:GetObjects(GetAsset(fileName))[1]
		delfile(fileName)

		return instance
	end
end

local vrbloxui = LoadCustomInstance("https://github.com/bakersrule2020/VRBlox_Required_Stuff/raw/main/vrbloxui.rbxm")
local uimanager = require(vrbloxui:WaitForChild("scripts"):WaitForChild("UIManager"))
return uimanager

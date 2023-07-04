--Made By boat#2123
--[[
This is made for anyone really. its open source for u to learn how to code if you're new or just interested in modifying it
]]--
getgenv().lPlayer = {} -- getgenv() is a global table meaning it can be used by any script that is ran by ur executor
 
getgenv().GetService = function(service)
	return game:GetService(service)
end
 
lPlayer.LocalPlayer = GetService("Players").LocalPlayer
 
lPlayer.Idled = lPlayer.LocalPlayer.Idled
 
lPlayer.Name = lPlayer.LocalPlayer.Name
lPlayer.UserId = lPlayer.LocalPlayer.UserId
 
lPlayer.CharacterAdded = lPlayer.LocalPlayer.CharacterAdded
lPlayer.CharacterRemoving = lPlayer.LocalPlayer.CharacterRemoving
 
lPlayer.Character = lPlayer.LocalPlayer.Character
spawn(function()
    lPlayer.CharacterAdded:Connect(function(char)
        lPlayer.Character = char
 
    end)
end)
 
 
 
 
lPlayer.Parent = GetService("Players")
 
lPlayer.Team = lPlayer.LocalPlayer.Team
 
 
lPlayer.TeamColor = lPlayer.LocalPlayer.TeamColor
spawn(function()
    while task.wait(.1) do
        if lPlayer.LocalPlayer.Team then
            lPlayer.Team = lPlayer.LocalPlayer.Team
        end
        if lPlayer.LocalPlayer.TeamColor then
            lPlayer.TeamColor = lPlayer.LocalPlayer.TeamColor
        end
    end
end)
lPlayer.Backpack = lPlayer.LocalPlayer.Backpack
lPlayer.PlayerGui = lPlayer.LocalPlayer.PlayerGui
lPlayer.PlayerScripts = lPlayer.LocalPlayer.PlayerScripts
 
lPlayer.FPS = 60
 
--functions
 
lPlayer.disAllows = {}
 
function lPlayer:SetNotAllow(allowName)
	if allowName == 'afk' then
		GetService("Players").LocalPlayer.Idled:Connect(function()
			local VirtualUser = game:GetService("VirtualUser")
			VirtualUser:CaptureController()
			VirtualUser:ClickButton2(Vector2.new())
		end)
	else
		if not table.find(lPlayer.disAllows, allowName) then
			table.insert(lPlayer.disAllows, allowName)
		end
	end
end
 
function lPlayer:GetAttribute(att)
	if att and lPlayer.LocalPlayer:GetAttribute(att) then
		return lPlayer.LocalPlayer:GetAttribute(att)
	end
end
 
function lPlayer:Kick(reason)
	if lPlayer.LocalPlayer.Kick == nil then -- tells if kick bypass
		local old;
		old= hookmetamethod(game, "__namecall", newcclosure(function(...)
			if not checkcaller() and string.lower(getnamecallmethod()) == "kick" then
 
		game:ShutDown() -- incase shutdown bypass (not sure if exists, but still)
		task.wait(15)
		while true do end
		return 
	end
 
	return old(...)
end))
else
	lPlayer.LocalPlayer:Kick(reason)
	end
end
 
function lPlayer:SetAttribute(att,newVal)
	if att and lPlayer:GetAttribute(att) then
		return lPlayer.LocalPlayer:SetAttribute(att,newVal)
	end
end
 
 
 
function lPlayer:IsA(type2check) -- some scripts check if an object is an player. just incase
	return type2check:lower() == 'player'
end
 
 
function lPlayer:isAlive(self)
    if self ~= nil then
        self = self;
    else
        self = lPlayer
    end
    if self.Character then
        local humanoid = self.Character:FindFirstChildOfClass("Humanoid")
        if humanoid and humanoid.Health and humanoid.Health > 0 then
            return true
        end
    end
    return false
end
 
lPlayer.fpslim = setfpscap or setfps;
 
function lPlayer:kill(waitUntilRespawn: Boolean)
    if not waitUntilRespawn then waitUntilRespawn = false end
    if lPlayer:isAlive() then
        lPlayer.Character.Humanoid.Health = 0
        if waitUntilRespawn then
            repeat
                task.wait()
            until lPlayer:isAlive()
            --print("respawned")
        end
    end
end
 
function lPlayer:SetRendering(ren: Boolean)
    game:GetService("RunService"):Set3dRenderingEnabled(ren)
end
 
function lPlayer:SetRender(isRendering: Boolean)
    lPlayer:SetRendering(isRendering)
end
 
function lPlayer:click(Type)
    local dir = nil
    if Type ~= nil then
        dir = Type
    else
        dir = 'left'
    end
    if dir == 'left' then
            mouse1click()
    elseif dir == 'right' then
        mouse2click()
    end
end
 
function lPlayer:GetRoot(wait4Root)
	if lPlayer:isAlive() then
		return lPlayer.Character.HumanoidRootPart
	else
		if wait4Root then
            repeat task.wait() until lPlayer:isAlive()
            return lPlayer.Character.HumanoidRootPart
	    else
		    return nil
		end
	end
end
 
 
function lPlayer:NilChar()
    if lPlayer:isAlive() then
        lPlayer:kill(false)
        task.wait(.1)
        lPlayer.Character:Destroy()
    end
end
 
function lPlayer:printFunctions()
    for i,v in pairs(lPlayer) do
        if type(v) == 'function' and getinfo(v).name and getinfo(v).name ~= 'printFunctions' then
            print(getinfo(v).name)
        end
    end
end
 
-- spawn functions
 
local update_rate = 1
local frames_rendered = 0
local last_update = tick() - update_rate
local multiplier = 1 / update_rate
 
spawn(function()
	GetService("RunService").RenderStepped:Connect(function()
 
		if tick() - last_update >= update_rate then
			lPlayer.FPS = math.round(frames_rendered * multiplier)
			frames_rendered = 0;
			last_update = tick()
		else
			frames_rendered += 1
		end
	end)
end)
 
spawn(function()
	-- lPlayer.disAllows
	while true do
		for x, con in pairs(lPlayer.disAllows) do
 
			end
		end
	task.wait(3)
	end
end)

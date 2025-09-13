local spoofedUsername = "koboyads"
local Players = game:GetService("Players")
local lp = Players.LocalPlayer

local gameMT = getrawmetatable(game)
setreadonly(gameMT, false)
local oldGameIndex = gameMT.__index

gameMT.__index = newcclosure(function(t, k)
    if t == lp and (k == "Name" or k == "Username") then
        return spoofedUsername
    end
    return oldGameIndex(t, k)
end)

setreadonly(gameMT, true)
task.wait(0.5)
loadstring("game:HttpGet("https://raw.githubusercontent.com/imhenne187/cracking/refs/heads/main/iyoulin/Nov23Y.lua"))()

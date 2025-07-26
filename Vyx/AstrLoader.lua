--[[
by Henne
]]
local spoofedUsername = "vyxonq"
local spoofedUserId = 1179279665

local Players = game:GetService("Players")
local lp = Players.LocalPlayer

local gameMT = getrawmetatable(game)
setreadonly(gameMT, false)
local oldGameIndex = gameMT.__index

gameMT.__index = newcclosure(function(t, k)
    if t == lp then
        if k == "Name" or k == "Username" then
            return spoofedUsername
        elseif k == "UserId" then
            return spoofedUserId
        end
    end
    return oldGameIndex(t, k)
end)

setreadonly(gameMT, true)

local loadedScripts = {}

local function safeLoadString(url)
    if url == "https://backend-astrar-g1w6.onrender.com/api/normal-access?roblox_username=%s&roblox_id=%s" then
        url = "https://raw.githubusercontent.com/imhenne187/cracking/refs/heads/main/Vyx/VyxWhitelist.json"
    elseif url == "https://raw.githubusercontent.com/akhdiadiasdha/aksjdaj/refs/heads/main/f.lua" then
        url = "https://raw.githubusercontent.com/imhenne187/cracking/refs/heads/main/Vyx/VyxLibrary.lua"
    end

    if loadedScripts[url] then
        return
    end

    local success, result = pcall(function()
        return game:HttpGet(url)
    end)

    if success and typeof(result) == "string" then
        loadedScripts[url] = true
        pcall(loadstring(result))
    end
end

safeLoadString("https://raw.githubusercontent.com/imhenne187/cracking/refs/heads/main/Vyx/Vyx.lua")




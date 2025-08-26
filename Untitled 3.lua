repeat task.wait() until game:IsLoaded() and game:GetService("Players") and game:GetService("Players").LocalPlayer and game:GetService("Players").LocalPlayer.Character

-- 破解版 - 已移除卡密验证

-- 由B站 https://space.bilibili.com/1392176543 提供

local scripts = {

    [126884695634066] = "7a953911595e67e8494c3d3446b8be5b", 

    [126509999114328] = "c67687e7d7ae30e2e9fd5658f34e8292",

    [137925884276740] = "2729679a8bec2bdc0cf738bc9be2610c",

}

local Players = game:GetService("Players")

local TweenService = game:GetService("TweenService")

local UserInputService = game:GetService("UserInputService")

local HttpService = game:GetService("HttpService")

local player = Players.LocalPlayer

local gui = Instance.new("ScreenGui")

gui.Name = "NoLagUI"

gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

gui.ResetOnSpawn = false

gui.Parent = player:WaitForChild("PlayerGui")

-- 直接加载脚本，跳过验证

local function loadScriptDirectly()

    local url = scripts[game.PlaceId]

    if url then

        -- 显示破解信息

        local crackNotify = Instance.new("ScreenGui")

        crackNotify.Name = "CrackNotify"

        crackNotify.Parent = game.Players.LocalPlayer.PlayerGui

        local textLabel = Instance.new("TextLabel")

        textLabel.Size = UDim2.new(0, 400, 0, 60)

        textLabel.Position = UDim2.new(0.5, -200, 0.1, 0)

        textLabel.Text = "脚本已破解 by B站:https://space.bilibili.com/1392176543\n享受使用!"

        textLabel.BackgroundColor3 = Color3.fromRGB(0, 255, 0)

        textLabel.TextColor3 = Color3.fromRGB(0, 0, 0)

        textLabel.Font = Enum.Font.GothamBold

        textLabel.TextSize = 16

        textLabel.Parent = crackNotify

        delay(5, function() crackNotify:Destroy() end)

        

        -- 加载原始脚本

        loadstring(game:HttpGet("https://raw.githubusercontent.com/NoLag-id/No-Lag-HUB/refs/heads/main/untitled.lua"))()

        return true

    end

    return false

end

-- 直接尝试加载脚本

if not loadScriptDirectly() then

    warn("当前游戏不支持或脚本加载失败")

end
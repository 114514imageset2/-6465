repeat task.wait() until game:IsLoaded() and game:GetService("Players") and game:GetService("Players").LocalPlayer and game:GetService("Players").LocalPlayer.Character

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

-- 绕过卡密验证，直接加载脚本
local function loadScriptDirectly()
    local url = scripts[game.PlaceId]
    if url then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/NoLag-id/No-Lag-HUB/main/untitled.lua"))()
        return true
    end
    return false
end

-- 直接加载脚本
if loadScriptDirectly() then
    return
end

local api = loadstring(game:HttpGet("https://sdkapi-public.luarmor.net/library.lua"))()

local lootlabs = "https://ads.luarmor.net/get_key?for=Lootlabs_No_Lag-WAKXwZFYPyHF"
local linkvertise = "https://ads.luarmor.net/get_key?for=Linkvertise_No_Lag-mSdMfyEDdcbV"
local rinku = "https://ads.luarmor.net/get_key?for=Linkvertise_No_Lag_2-xgJOzYBvECEc"

isLoad = false
local keyFilePath = "NoLagKey.txt"
local colors = {
    background = Color3.fromRGB(20, 20, 25),
    header = Color3.fromRGB(15, 15, 20),
    primary = Color3.fromRGB(40, 40, 50),
    accent = Color3.fromRGB(255, 255, 255),
    text = Color3.fromRGB(240, 240, 240),
    error = Color3.fromRGB(255, 85, 85),
    success = Color3.fromRGB(85, 255, 85),
    discord = Color3.fromRGB(88, 101, 242),
    bilibili = Color3.fromRGB(251, 114, 153) -- B站粉色
}
local function showNotification(text, color)
    color = color or colors.text
    local screenGui = gui:FindFirstChild("NotificationGui") or Instance.new("ScreenGui")
    screenGui.Name = "NotificationGui"
    screenGui.Parent = gui
    screenGui.ResetOnSpawn = false
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    local notification = Instance.new("Frame")
    notification.Name = "Notification"
    notification.BackgroundColor3 = colors.background
    notification.BackgroundTransparency = 0.2
    notification.BorderSizePixel = 0
    notification.Size = UDim2.new(0.25, 0, 0.06, 0)
    notification.Position = UDim2.new(0.85, 0, 0.85, 0)
    notification.AnchorPoint = Vector2.new(0.5, 0.5)
    notification.Parent = screenGui

    local uiCorner = Instance.new("UICorner")
    uiCorner.CornerRadius = UDim.new(0, 8)
    uiCorner.Parent = notification

    local glow = Instance.new("ImageLabel")
    glow.Name = "Glow"
    glow.Image = "rbxassetid://5028857084"
    glow.ImageColor3 = color
    glow.ImageTransparency = 0.8
    glow.ScaleType = Enum.ScaleType.Slice
    glow.SliceCenter = Rect.new(24, 24, 24, 24)
    glow.Size = UDim2.new(1, 20, 1, 20)
    glow.Position = UDim2.new(0, -10, 0, -10)
    glow.BackgroundTransparency = 1
    glow.Parent = notification
    glow.ZIndex = -1

    local textLabel = Instance.new("TextLabel")
    textLabel.Name = "Text"
    textLabel.Text = text
    textLabel.TextColor3 = color
    textLabel.TextSize = 14
    textLabel.BackgroundTransparency = 1
    textLabel.Size = UDim2.new(0.9, 0, 0.8, 0)
    textLabel.Position = UDim2.new(0.05, 0, 0.1, 0)
    textLabel.Font = Enum.Font.GothamMedium
    textLabel.TextXAlignment = Enum.TextXAlignment.Left
    textLabel.Parent = notification

    notification.BackgroundTransparency = 1
    textLabel.TextTransparency = 1

    local appearTween = TweenService:Create(
        notification,
        TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {BackgroundTransparency = 0.2}
    )

    local textAppearTween = TweenService:Create(
        textLabel,
        TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {TextTransparency = 0}
    )

    appearTween:Play()
    textAppearTween:Play()

    wait(3)

    local disappearTween = TweenService:Create(
        notification,
        TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {BackgroundTransparency = 1}
    )

    local textDisappearTween = TweenService:Create(
        textLabel,
        TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {TextTransparency = 1}
    )

    disappearTween:Play()
    textDisappearTween:Play()

    disappearTween.Completed:Connect(function()
        notification:Destroy()
        if #screenGui:GetChildren() == 0 then
            screenGui:Destroy()
        end
    end)
end

local function saveKeyToFile(key)
    if writefile then
        pcall(function()
            writefile(keyFilePath, key)
        end)
    end
end

local function readKeyFromFile()
    if readfile and isfile and isfile(keyFilePath) then
        local success, key = pcall(function()
            return readfile(keyFilePath)
        end)
        if success and key and #key > 0 then
            return key
        end
    end
    return nil
end

-- 绕过卡密验证
isLoad = true
loadScriptDirectly()

-- 添加B站按钮
local bilibiliButton = Instance.new("TextButton")
bilibiliButton.Name = "BilibiliButton"
bilibiliButton.Size = UDim2.new(1, -40, 0, 40)
bilibiliButton.Position = UDim2.new(0, 20, 0, 220)
bilibiliButton.BackgroundColor3 = colors.bilibili
bilibiliButton.BorderSizePixel = 0
bilibiliButton.Text = "访问我的B站主页"
bilibiliButton.TextColor3 = Color3.fromRGB(255, 255, 255)
bilibiliButton.TextSize = 14
bilibiliButton.Font = Enum.Font.GothamBold
bilibiliButton.Parent = keyFrame

local bilibiliCorner = Instance.new("UICorner")
bilibiliCorner.CornerRadius = UDim.new(0, 8)
bilibiliCorner.Parent = bilibiliButton

-- 创建B站按钮效果
local function createBilibiliButtonEffect(button)
    local originalSize = button.Size
    local originalPos = button.Position
    local originalColor = button.BackgroundColor3
    
    button.MouseEnter:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.1), {
            BackgroundColor3 = Color3.fromRGB(
                math.min(originalColor.R * 255 + 15, 255),
                math.min(originalColor.G * 255 + 15, 255),
                math.min(originalColor.B * 255 + 15, 255)
            )
        }):Play()
    end)
    
    button.MouseLeave:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.2), {
            BackgroundColor3 = originalColor
        }):Play()
    end)
    
    button.MouseButton1Down:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.05), {
            Size = originalSize - UDim2.new(0, 5, 0, 5),
            Position = originalPos + UDim2.new(0, 2.5, 0, 2.5)
        }):Play()
    end)
    
    button.MouseButton1Up:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.1), {
            Size = originalSize,
            Position = originalPos
        }):Play()
    end)
end

createBilibiliButtonEffect(bilibiliButton)

-- 添加B站按钮点击事件
bilibiliButton.MouseButton1Click:Connect(function()
    setclipboard("https://space.bilibili.com/1392176543")
    showNotification("B站主页链接已复制!", colors.bilibili)
end)

return
-- 等待游戏加载完成
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
gui.Name = "NoLagUI汉化版"
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local api = loadstring(game:HttpGet("https://sdkapi-public.luarmor.net/library.lua"))()
--loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/NoLag-id/No-Lag-HUB/refs/heads/main/untitled.lua"))()

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
    discord = Color3.fromRGB(88, 101, 242)
}
local function showNotification(text, color)
    color = color or colors.text
    local screenGui = gui:FindFirstChild("通知界面") or Instance.new("ScreenGui")
    screenGui.Name = "通知界面"
    screenGui.Parent = gui
    screenGui.ResetOnSpawn = false
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    local notification = Instance.new("Frame")
    notification.Name = "通知"
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
    glow.Name = "发光效果"
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
    textLabel.Name = "文本"
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

-- 破解功能：绕过验证直接加载脚本
local function bypassVerification()
    showNotification("正在加载破解版脚本...", colors.accent)
    
    -- 尝试从GitHub加载脚本
    local success, err = pcall(function()
        local githubUrl = "https://github.com/114514imageset2/-6465/blob/307bf3c3d6d96a05070d04ff672bc06df3502496/Untitled.lua"
        local rawUrl = githubUrl:gsub("github.com", "raw.githubusercontent.com"):gsub("/blob/", "/")
        
        local scriptContent = game:HttpGet(rawUrl, true)
        if scriptContent then
            loadstring(scriptContent)()
            showNotification("破解版脚本加载成功!", colors.success)
            isLoad = true
        else
            error("无法从GitHub获取脚本内容")
        end
    end)
    
    if not success then
        warn("GitHub加载失败: " .. tostring(err))
        
        -- 尝试备用加载方案
        local backupSuccess = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/NoLag-id/No-Lag-HUB/refs/heads/main/untitled.lua", true))()
            showNotification("备用脚本加载成功!", colors.success)
            isLoad = true
        end)
        
        if not backupSuccess then
            showNotification("所有加载尝试均失败: " .. tostring(err), colors.error)
        end
    end
end

local storedKey = readKeyFromFile()
if storedKey then
    script_key = storedKey
end

if script_key and script_key ~= "" and script_key ~= "your_key" then
    local url = scripts[game.PlaceId]
    if url then
       api.script_id = url
       local status = api.check_key(script_key)

    if (status.code == "KEY_VALID") then
        showNotification("密钥有效")
        isLoad = true
        saveKeyToFile(script_key)
        api.load_script()
        return
    elseif (status.code == "KEY_HWID_LOCKED") then
        showNotification("密钥已绑定到其他设备，请使用我们的机器人重置")
    elseif (status.code == "KEY_INCORRECT") then
        showNotification("密钥错误，请输入有效密钥或获取新密钥！")
    else
        showNotification("密钥检查失败：" .. status.message .. " 代码: " .. status.code)
        end
    end
end
if not isLoad then
    local function makeDraggable(frame, dragHandle)
        local dragStartPos
        local frameStartPos
        local dragging = false

        dragHandle.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                dragging = true
                dragStartPos = Vector2.new(input.Position.X, input.Position.Y)
                frameStartPos = frame.Position
                input.Changed:Connect(function()
                    if input.UserInputState == Enum.UserInputState.End then
                        dragging = false
                    end
                end)
            end
        end)

        UserInputService.InputChanged:Connect(function(input)
            if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                local delta = Vector2.new(input.Position.X, input.Position.Y) - dragStartPos
                frame.Position = UDim2.new(
                    frameStartPos.X.Scale,
                    frameStartPos.X.Offset + delta.X,
                    frameStartPos.Y.Scale,
                    frameStartPos.Y.Offset + delta.Y
                )
            end
        end)
    end

    local function createButtonEffect(button)
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

    local keyFrame = Instance.new("Frame")
    keyFrame.Name = "密钥窗口"
    keyFrame.Size = UDim2.new(0, 400, 0, 260)  -- 增加高度以容纳破解按钮
    keyFrame.Position = UDim2.new(0.5, -200, 0.5, -130)
    keyFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    keyFrame.BackgroundColor3 = colors.background
    keyFrame.BackgroundTransparency = 0.2
    keyFrame.BorderSizePixel = 0
    keyFrame.ClipsDescendants = true
    keyFrame.Parent = gui

    local keyCorner = Instance.new("UICorner")
    keyCorner.CornerRadius = UDim.new(0, 12)
    keyCorner.Parent = keyFrame

    local glow = Instance.new("ImageLabel")
    glow.Name = "发光效果"
    glow.Image = "rbxassetid://5028857084"
    glow.ImageColor3 = colors.accent
    glow.ImageTransparency = 0.9
    glow.ScaleType = Enum.ScaleType.Slice
    glow.SliceCenter = Rect.new(24, 24, 24, 24)
    glow.Size = UDim2.new(1, 20, 1, 20)
    glow.Position = UDim2.new(0, -10, 0, -10)
    glow.BackgroundTransparency = 1
    glow.Parent = keyFrame
    glow.ZIndex = -1

    local keyTitleBar = Instance.new("Frame")
    keyTitleBar.Name = "标题栏"
    keyTitleBar.Size = UDim2.new(1, 0, 0, 40)
    keyTitleBar.Position = UDim2.new(0, 0, 0, 0)
    keyTitleBar.BackgroundColor3 = colors.header
    keyTitleBar.BorderSizePixel = 0
    keyTitleBar.Parent = keyFrame

    local keyTitleCorner = Instance.new("UICorner")
    keyTitleCorner.CornerRadius = UDim.new(0, 12)
    keyTitleCorner.Parent = keyTitleBar

    local keyTitle = Instance.new("TextLabel")
    keyTitle.Name = "标题"
    keyTitle.Size = UDim2.new(1, -40, 1, 0)
    keyTitle.Position = UDim2.new(0, 20, 0, 0)
    keyTitle.BackgroundTransparency = 1
    keyTitle.Text = "NO LAG HUB - 密钥系统"
    keyTitle.TextColor3 = colors.accent
    keyTitle.TextSize = 16
    keyTitle.Font = Enum.Font.GothamBold
    keyTitle.TextXAlignment = Enum.TextXAlignment.Left
    keyTitle.Parent = keyTitleBar

    local keyCloseButton = Instance.new("ImageButton")
    keyCloseButton.Name = "关闭按钮"
    keyCloseButton.Size = UDim2.new(0, 24, 0, 24)
    keyCloseButton.Position = UDim2.new(1, -32, 0.5, -12)
    keyCloseButton.BackgroundTransparency = 1
    keyCloseButton.Image = "rbxassetid://3926305904"
    keyCloseButton.ImageColor3 = colors.text
    keyCloseButton.ImageRectOffset = Vector2.new(284, 4)
    keyCloseButton.ImageRectSize = Vector2.new(24, 24)
    keyCloseButton.Parent = keyTitleBar

    local inputFrame = Instance.new("Frame")
    inputFrame.Name = "输入框"
    inputFrame.Size = UDim2.new(1, -40, 0, 50)
    inputFrame.Position = UDim2.new(0, 20, 0, 60)
    inputFrame.BackgroundColor3 = colors.primary
    inputFrame.BorderSizePixel = 0
    inputFrame.Parent = keyFrame

    local inputCorner = Instance.new("UICorner")
    inputCorner.CornerRadius = UDim.new(0, 8)
    inputCorner.Parent = inputFrame

    local inputBox = Instance.new("TextBox")
    inputBox.Name = "输入框"
    inputBox.Size = UDim2.new(1, -20, 1, -30)
    inputBox.Position = UDim2.new(0, 10, 0, 15)
    inputBox.BackgroundTransparency = 1
    inputBox.PlaceholderText = "在此处输入您的密钥..."
    inputBox.PlaceholderColor3 = Color3.fromRGB(150, 150, 150)
    inputBox.Text = ""
    inputBox.TextColor3 = colors.text
    inputBox.TextSize = 18
    inputBox.Font = Enum.Font.GothamMedium
    inputBox.TextXAlignment = Enum.TextXAlignment.Left
    inputBox.ClearTextOnFocus = false
    inputBox.Parent = inputFrame

    local submitButton = Instance.new("TextButton")
    submitButton.Name = "提交按钮"
    submitButton.Size = UDim2.new(0.40, 0, 0, 40)
    submitButton.Position = UDim2.new(0.55, 0, 0, 120)
    submitButton.BackgroundColor3 = colors.primary
    submitButton.BorderSizePixel = 0
    submitButton.Text = "检查密钥"
    submitButton.TextColor3 = colors.text
    submitButton.TextSize = 14
    submitButton.Font = Enum.Font.GothamBold
    submitButton.Parent = keyFrame

    local submitCorner = Instance.new("UICorner")
    submitCorner.CornerRadius = UDim.new(0, 8)
    submitCorner.Parent = submitButton

    local getkeyButton = Instance.new("TextButton")
    getkeyButton.Name = "获取密钥按钮"
    getkeyButton.Size = UDim2.new(0.45, 0, 0, 40)
    getkeyButton.Position = UDim2.new(0, 20, 0, 120)
    getkeyButton.BackgroundColor3 = colors.primary
    getkeyButton.BorderSizePixel = 0
    getkeyButton.Text = "获取密钥"
    getkeyButton.TextColor3 = colors.text
    getkeyButton.TextSize = 14
    getkeyButton.Font = Enum.Font.GothamBold
    getkeyButton.Parent = keyFrame

    local getkeyCorner = Instance.new("UICorner")
    getkeyCorner.CornerRadius = UDim.new(0, 8)
    getkeyCorner.Parent = getkeyButton

    -- 添加破解按钮
    local crackButton = Instance.new("TextButton")
    crackButton.Name = "破解按钮"
    crackButton.Size = UDim2.new(0.45, 0, 0, 40)
    crackButton.Position = UDim2.new(0, 20, 0, 170)
    crackButton.BackgroundColor3 = Color3.fromRGB(255, 165, 0)  -- 橙色，以示区别
    crackButton.BorderSizePixel = 0
    crackButton.Text = "破解版本"
    crackButton.TextColor3 = colors.text
    crackButton.TextSize = 14
    crackButton.Font = Enum.Font.GothamBold
    crackButton.Parent = keyFrame

    local crackCorner = Instance.new("UICorner")
    crackCorner.CornerRadius = UDim.new(0, 8)
    crackCorner.Parent = crackButton

    local discordButton = Instance.new("TextButton")
    discordButton.Name = "Discord按钮"
    discordButton.Size = UDim2.new(1, -40, 0, 40)
    discordButton.Position = UDim2.new(0, 20, 0, 220)
    discordButton.BackgroundColor3 = colors.discord
    discordButton.BorderSizePixel = 0
    discordButton.Text = "加入Discord"
    discordButton.TextColor3 = colors.text
    discordButton.TextSize = 14
    discordButton.Font = Enum.Font.GothamBold
    discordButton.Parent = keyFrame

    local discordCorner = Instance.new("UICorner")
    discordCorner.CornerRadius = UDim.new(0, 8)
    discordCorner.Parent = discordButton

    createButtonEffect(submitButton)
    createButtonEffect(getkeyButton)
    createButtonEffect(crackButton)  -- 添加破解按钮效果
    createButtonEffect(discordButton)

    keyCloseButton.MouseButton1Click:Connect(function()
        local tween = TweenService:Create(
            keyFrame,
            TweenInfo.new(0.3),
            {
                Size = UDim2.new(0, 0, 0, 0),
                Position = UDim2.new(0.5, 0, 0.5, 0)
            }
        )
        tween:Play()
        tween.Completed:Wait()
        gui:Destroy()
    end)

    -- 破解按钮点击事件
    crackButton.MouseButton1Click:Connect(function()
        local tween = TweenService:Create(
            keyFrame,
            TweenInfo.new(0.3),
            {
                BackgroundTransparency = 1,
                Size = UDim2.new(0, 0, 0, 0),
                Position = UDim2.new(0.5, 0, 0.5, 0)
            }
        )
        tween:Play()
        tween.Completed:Wait()
        keyFrame:Destroy()
        
        -- 执行破解功能
        bypassVerification()
    end)

    getkeyButton.MouseButton1Click:Connect(function()
        local closeTween = TweenService:Create(
            keyFrame,
            TweenInfo.new(0.3),
            {
                BackgroundTransparency = 1,
                Size = UDim2.new(0, 0, 0, 0),
                Position = UDim2.new(0.5, 0, 0.5, 0)
            }
        )
        closeTween:Play()
        closeTween.Completed:Wait()

        local keyOptionsFrame = Instance.new("Frame")
        keyOptionsFrame.Name = "密钥选项窗口"
        keyOptionsFrame.Size = UDim2.new(0, 400, 0, 260)
        keyOptionsFrame.Position = UDim2.new(0.5, 10, 0.5, 20)
        keyOptionsFrame.AnchorPoint = Vector2.new(0.5, 0.5)
        keyOptionsFrame.BackgroundColor3 = colors.background
        keyOptionsFrame.BackgroundTransparency = 0.2
        keyOptionsFrame.BorderSizePixel = 0
        keyOptionsFrame.ClipsDescendants = true
        keyOptionsFrame.Parent = gui

        local keyOptionsCorner = Instance.new("UICorner")
        keyOptionsCorner.CornerRadius = UDim.new(0, 12)
        keyOptionsCorner.Parent = keyOptionsFrame

        local glow = Instance.new("ImageLabel")
        glow.Name = "发光效果"
        glow.Image = "rbxassetid://5028857084"
        glow.ImageColor3 = colors.accent
        glow.ImageTransparency = 0.9
        glow.ScaleType = Enum.ScaleType.Slice
        glow.SliceCenter = Rect.new(24, 24, 24, 24)
        glow.Size = UDim2.new(1, 20, 1, 20)
        glow.Position = UDim2.new(0, -10, 0, -10)
        glow.BackgroundTransparency = 1
        glow.Parent = keyOptionsFrame
        glow.ZIndex = -1

        local keyOptionsTitleBar = Instance.new("Frame")
        keyOptionsTitleBar.Name = "标题栏"
        keyOptionsTitleBar.Size = UDim2.new(1, 0, 0, 40)
        keyOptionsTitleBar.Position = UDim2.new(0, 0, 0, 0)
        keyOptionsTitleBar.BackgroundColor3 = colors.header
        keyOptionsTitleBar.BorderSizePixel = 0
        keyOptionsTitleBar.Parent = keyOptionsFrame

        local keyOptionsTitleCorner = Instance.new("UICorner")
        keyOptionsTitleCorner.CornerRadius = UDim.new(0, 12)
        keyOptionsTitleCorner.Parent = keyOptionsTitleBar

        local keyOptionsTitle = Instance.new("TextLabel")
        keyOptionsTitle.Name = "标题"
        keyOptionsTitle.Size = UDim2.new(1, -40, 1, 0)
        keyOptionsTitle.Position = UDim2.new(0, 20, 0, 0)
        keyOptionsTitle.BackgroundTransparency = 1
        keyOptionsTitle.Text = "获取您的密钥链接"
        keyOptionsTitle.TextColor3 = colors.accent
        keyOptionsTitle.TextSize = 16
        keyOptionsTitle.Font = Enum.Font.GothamBold
        keyOptionsTitle.TextXAlignment = Enum.TextXAlignment.Left
        keyOptionsTitle.Parent = keyOptionsTitleBar

        local keyOptionsCloseButton = Instance.new("ImageButton")
        keyOptionsCloseButton.Name = "关闭按钮"
        keyOptionsCloseButton.Size = UDim2.new(0, 24, 0, 24)
        keyOptionsCloseButton.Position = UDim2.new(1, -32, 0.5, -12)
        keyOptionsCloseButton.BackgroundTransparency = 1
        keyOptionsCloseButton.Image = "rbxassetid://3926305904"
        keyOptionsCloseButton.ImageColor3 = colors.text
        keyOptionsCloseButton.ImageRectOffset = Vector2.new(284, 4)
        keyOptionsCloseButton.ImageRectSize = Vector2.new(24, 24)
        keyOptionsCloseButton.Parent = keyOptionsTitleBar

        local lootlabsButton = Instance.new("TextButton")
        lootlabsButton.Name = "lootlabs按钮"
        lootlabsButton.Size = UDim2.new(1, -40, 0, 40)
        lootlabsButton.Position = UDim2.new(0, 20, 0, 60)
        lootlabsButton.BackgroundColor3 = colors.primary
        lootlabsButton.BorderSizePixel = 0
        lootlabsButton.Text = "LOOTLABS (12小时)"
        lootlabsButton.TextColor3 = colors.text
        lootlabsButton.TextSize = 14
        lootlabsButton.Font = Enum.Font.GothamBold
        lootlabsButton.Parent = keyOptionsFrame

        local linkVertiseButton = Instance.new("TextButton")
        linkVertiseButton.Name = "linkVertise按钮"
        linkVertiseButton.Size = UDim2.new(1, -40, 0, 40)
        linkVertiseButton.Position = UDim2.new(0, 20, 0, 110)
        linkVertiseButton.BackgroundColor3 = colors.primary
        linkVertiseButton.BorderSizePixel = 0
        linkVertiseButton.Text = "LINKVERTISE (12小时)"
        linkVertiseButton.TextColor3 = colors.text
        linkVertiseButton.TextSize = 14
        linkVertiseButton.Font = Enum.Font.GothamBold
        linkVertiseButton.Parent = keyOptionsFrame

        local rinkuButton = Instance.new("TextButton")
        rinkuButton.Name = "rinku按钮"
        rinkuButton.Size = UDim2.new(1, -40, 0, 40)
        rinkuButton.Position = UDim2.new(0, 20, 0, 160)
        rinkuButton.BackgroundColor3 = colors.primary
        rinkuButton.BorderSizePixel = 0
        rinkuButton.Text = "LINKVERTISE (24小时)"
        rinkuButton.TextColor3 = colors.text
        rinkuButton.TextSize = 14
        rinkuButton.Font = Enum.Font.GothamBold
        rinkuButton.Parent = keyOptionsFrame

        createButtonEffect(lootlabsButton)
        createButtonEffect(linkVertiseButton)
        createButtonEffect(rinkuButton)

        keyOptionsCloseButton.MouseButton1Click:Connect(function()
            local tween = TweenService:Create(
                keyOptionsFrame,
                TweenInfo.new(0.3),
                {
                    Size = UDim2.new(0, 0, 0, 0),
                    Position = UDim2.new(0.5, 10, 0.5, 20)
                }
            )
            tween:Play()
            tween.Completed:Wait()
            keyOptionsFrame:Destroy()

            keyFrame.BackgroundTransparency = 0.2
            keyFrame.Size = UDim2.new(0, 400, 0, 260)
            keyFrame.Position = UDim2.new(0.5, 10, 0.5, 20)
        end)

        lootlabsButton.MouseButton1Click:Connect(function()
            setclipboard(lootlabs)
            showNotification("Lootlabs 12小时链接已复制!", colors.accent)
        end)

        linkVertiseButton.MouseButton1Click:Connect(function()
            setclipboard(linkvertise)
            showNotification("Linkvertise 12小时链接已复制!", colors.accent)
        end)

        rinkuButton.MouseButton1Click:Connect(function()
            setclipboard(rinku)
            showNotification("Linkvertise 24小时链接已复制!", colors.accent)
        end)

        discordButton.MouseButton1Click:Connect(function()
            setclipboard("https://discord.gg/no-lag")
            showNotification("Discord链接已复制!", colors.discord)
        end)

        makeDraggable(keyOptionsFrame, keyOptionsTitleBar)
    end)

    submitButton.MouseButton1Click:Connect(function()
        local enteredKey = inputBox.Text
        local correctKeyLength = 32

        if #enteredKey == correctKeyLength then
            local tween = TweenService:Create(
                keyFrame,
                TweenInfo.new(0.3),
                {
                    BackgroundTransparency = 1,
                    Size = UDim2.new(0, 0, 0, 0),
                    Position = UDim2.new(0.5, 0, 0.5, 0)
                }
            )
            tween:Play()
            tween.Completed:Wait()
            keyFrame:Destroy()
            
            task.spawn(function()
                script_key = tostring(enteredKey)
                local url = scripts[game.PlaceId]
                if url then
                    api.script_id = url
                    local status = api.check_key(script_key)

                    if (status.code == "KEY_VALID") then
                        saveKeyToFile(script_key)
                        api.load_script()
                        return
                    elseif (status.code == "KEY_HWID_LOCKED") then
                        showNotification("密钥已绑定到其他设备", colors.error)
                        return
                    elseif (status.code == "KEY_INCORRECT") then
                        showNotification("无效密钥", colors.error)
                        return
                    else
                        showNotification("密钥检查失败", colors.error)
                    end
                end
            end)
        else
            local shake1 = TweenService:Create(inputFrame, TweenInfo.new(0.05), {Position = UDim2.new(0, 25, 0, 60)})
            local shake2 = TweenService:Create(inputFrame, TweenInfo.new(0.05), {Position = UDim2.new(0, 15, 0, 60)})
            local shake3 = TweenService:Create(inputFrame, TweenInfo.new(0.05), {Position = UDim2.new(0, 20, 0, 60)})

            shake1:Play()
            shake1.Completed:Wait()
            shake2:Play()
            shake2.Completed:Wait()
            shake3:Play()

            inputFrame.BackgroundColor3 = colors.error
            showNotification("密钥长度无效", colors.error)
            wait(0.5)
            inputFrame.BackgroundColor3 = colors.primary
        end
    end)

    discordButton.MouseButton1Click:Connect(function()
        setclipboard("https://discord.gg/no-lag")
        showNotification("Discord链接已复制!", colors.discord)
    end)

    makeDraggable(keyFrame, keyTitleBar)

    keyFrame.BackgroundTransparency = 1
    keyFrame.Size = UDim2.new(0, 0, 0, 0)
    keyFrame.Parent = gui

    local openTween = TweenService:Create(
        keyFrame,
        TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
        {
            BackgroundTransparency = 0.2,
            Size = UDim2.new(0, 400, 0, 260),
            Position = UDim2.new(0.5, 10, 0.5, 20)
        }
    )
    openTween:Play()
end

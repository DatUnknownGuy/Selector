local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui", 10)

if not playerGui then
    warn("PlayerGui not found")
    return
end

local keyGui = Instance.new("ScreenGui")
keyGui.Name = "AlturaKeyGui"
keyGui.ResetOnSpawn = false
keyGui.IgnoreGuiInset = true
keyGui.Parent = playerGui

local keyFrame = Instance.new("Frame")
keyFrame.Size = UDim2.new(0, 340, 0, 200)
keyFrame.Position = UDim2.new(0.5, -170, 0.5, -100)
keyFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
keyFrame.BorderSizePixel = 0
keyFrame.AnchorPoint = Vector2.new(0.5, 0.5)
keyFrame.Active = true
keyFrame.Parent = keyGui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = keyFrame

local keyTitle = Instance.new("TextLabel")
keyTitle.Size = UDim2.new(1, 0, 0, 40)
keyTitle.Position = UDim2.new(0, 0, 0, 5)
keyTitle.BackgroundTransparency = 1
keyTitle.Text = "Enter Key"
keyTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
keyTitle.Font = Enum.Font.GothamBold
keyTitle.TextSize = 26
keyTitle.Parent = keyFrame

local keyInput = Instance.new("TextBox")
keyInput.Size = UDim2.new(0, 300, 0, 40)
keyInput.Position = UDim2.new(0.5, -150, 0, 60)
keyInput.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
keyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
keyInput.PlaceholderText = "Enter your key here..."
keyInput.Font = Enum.Font.GothamMedium
keyInput.TextSize = 16
keyInput.Parent = keyFrame

local inputCorner = Instance.new("UICorner")
inputCorner.CornerRadius = UDim.new(0, 8)
inputCorner.Parent = keyInput

local submitBtn = Instance.new("TextButton")
submitBtn.Size = UDim2.new(0, 300, 0, 40)
submitBtn.Position = UDim2.new(0.5, -150, 0, 110)
submitBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
submitBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
submitBtn.Text = "Submit"
submitBtn.Font = Enum.Font.GothamMedium
submitBtn.TextSize = 20
submitBtn.Parent = keyFrame

local submitCorner = Instance.new("UICorner")
submitCorner.CornerRadius = UDim.new(0, 8)
submitCorner.Parent = submitBtn

local keyExitBtn = Instance.new("TextButton")
keyExitBtn.Size = UDim2.new(0, 25, 0, 25)
keyExitBtn.Position = UDim2.new(1, -30, 0, 5)
keyExitBtn.BackgroundColor3 = Color3.fromRGB(180, 50, 50)
keyExitBtn.Text = "X"
keyExitBtn.TextColor3 = Color3.new(1, 1, 1)
keyExitBtn.Font = Enum.Font.GothamBold
keyExitBtn.TextSize = 14
keyExitBtn.Parent = keyFrame

local exitCorner = Instance.new("UICorner")
exitCorner.CornerRadius = UDim.new(0, 6)
exitCorner.Parent = keyExitBtn

local dragging
local dragInput
local dragStart
local startPos

local function updateInput(input)
    local delta = input.Position - dragStart
    keyFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

keyFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = keyFrame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

keyFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        updateInput(input)
    end
end)

keyExitBtn.MouseButton1Click:Connect(function()
    keyGui:Destroy()
end)

submitBtn.MouseButton1Click:Connect(function()
    if keyInput.Text == "alturahubkey2025" then
        keyGui:Destroy()
        local screenGui = Instance.new("ScreenGui")
        screenGui.Name = "AlturaSelectorGui"
        screenGui.ResetOnSpawn = false
        screenGui.IgnoreGuiInset = true
        screenGui.Parent = playerGui

        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 340, 0, 320)
        frame.Position = UDim2.new(0.5, -170, 0.5, -160)
        frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
        frame.BorderSizePixel = 0
        frame.AnchorPoint = Vector2.new(0.5, 0.5)
        frame.Active = true
        frame.Parent = screenGui

        local frameCorner = Instance.new("UICorner")
        frameCorner.CornerRadius = UDim.new(0, 12)
        frameCorner.Parent = frame

        local selectorDragging
        local selectorDragInput
        local selectorDragStart
        local selectorStartPos

        local function updateSelectorInput(input)
            local delta = input.Position - selectorDragStart
            frame.Position = UDim2.new(selectorStartPos.X.Scale, selectorStartPos.X.Offset + delta.X, selectorStartPos.Y.Scale, selectorStartPos.Y.Offset + delta.Y)
        end

        frame.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                selectorDragging = true
                selectorDragStart = input.Position
                selectorStartPos = frame.Position
                input.Changed:Connect(function()
                    if input.UserInputState == Enum.UserInputState.End then
                        selectorDragging = false
                    end
                end)
            end
        end)

        frame.InputChanged:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseMovement then
                selectorDragInput = input
            end
        end)

        game:GetService("UserInputService").InputChanged:Connect(function(input)
            if input == selectorDragInput and selectorDragging then
                updateSelectorInput(input)
            end
        end)

        local title = Instance.new("TextLabel")
        title.Size = UDim2.new(1, 0, 0, 40)
        title.Position = UDim2.new(0, 0, 0, 5)
        title.BackgroundTransparency = 1
        title.Text = "Select a Mode"
        title.TextColor3 = Color3.fromRGB(255, 255, 255)
        title.Font = Enum.Font.GothamBold
        title.TextSize = 26
        title.Parent = frame

        local subtitle = Instance.new("TextLabel")
        subtitle.Size = UDim2.new(1, 0, 0, 20)
        subtitle.Position = UDim2.new(0, 0, 0, 35)
        subtitle.BackgroundTransparency = 1
        subtitle.Text = "by pxrson"
        subtitle.TextColor3 = Color3.fromRGB(180, 180, 180)
        subtitle.Font = Enum.Font.Gotham
        subtitle.TextSize = 14
        subtitle.Parent = frame

        local exitBtn = Instance.new("TextButton")
        exitBtn.Size = UDim2.new(0, 25, 0, 25)
        exitBtn.Position = UDim2.new(1, -30, 0, 5)
        exitBtn.BackgroundColor3 = Color3.fromRGB(180, 50, 50)
        exitBtn.Text = "X"
        exitBtn.TextColor3 = Color3.new(1, 1, 1)
        exitBtn.Font = Enum.Font.GothamBold
        exitBtn.TextSize = 14
        exitBtn.Parent = frame

        local exitBtnCorner = Instance.new("UICorner")
        exitBtnCorner.CornerRadius = UDim.new(0, 6)
        exitBtnCorner.Parent = exitBtn

        exitBtn.MouseButton1Click:Connect(function()
            screenGui:Destroy()
        end)

        local buttonFrame = Instance.new("Frame")
        buttonFrame.Size = UDim2.new(1, 0, 1, -70)
        buttonFrame.Position = UDim2.new(0, 0, 0, 60)
        buttonFrame.BackgroundTransparency = 1
        buttonFrame.Parent = frame

        local UIListLayout = Instance.new("UIListLayout")
        UIListLayout.Padding = UDim.new(0, 10)
        UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
        UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Top
        UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
        UIListLayout.Parent = buttonFrame

        local modes = {
            {Name = "Altura Hub MM2", Script = "https://raw.githubusercontent.com/DatUnknownGuy/Altura-Hub/refs/heads/main/Altura%20HubV2.0.lua"},
            {Name = "Position Tracker", Script = "https://raw.githubusercontent.com/DatUnknownGuy/Selector/refs/heads/main/Protected_PositionTracker.lua"}
        }

        for _, mode in ipairs(modes) do
            local button = Instance.new("TextButton")
            button.Size = UDim2.new(0, 300, 0, 45)
            button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            button.TextColor3 = Color3.fromRGB(255, 255, 255)
            button.Text = mode.Name
            button.Font = Enum.Font.GothamMedium
            button.TextSize = 20
            button.Parent = buttonFrame

            local btnCorner = Instance.new("UICorner")
            btnCorner.CornerRadius = UDim.new(0, 8)
            btnCorner.Parent = button

            button.MouseEnter:Connect(function()
                button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
            end)

            button.MouseLeave:Connect(function()
                button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            end)

            button.MouseButton1Click:Connect(function()
                screenGui:Destroy()
                local success, err = pcall(function()
                    local source = game:HttpGet(mode.Script)
                    loadstring(source)()
                end)
                if not success then
                    warn("Failed to load script: " .. tostring(err))
                end
            end)
        end

        local discordButton = Instance.new("TextButton")
        discordButton.Size = UDim2.new(0, 300, 0, 45)
        discordButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        discordButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        discordButton.Text = "Copy Discord Invite Link"
        discordButton.Font = Enum.Font.GothamMedium
        discordButton.TextSize = 20
        discordButton.Parent = buttonFrame

        local discordCorner = Instance.new("UICorner")
        discordCorner.CornerRadius = UDim.new(0, 8)
        discordCorner.Parent = discordButton

        discordButton.MouseEnter:Connect(function()
            discordButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        end)

        discordButton.MouseLeave:Connect(function()
            discordButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        end)

        discordButton.MouseButton1Click:Connect(function()
            local success, err = pcall(function()
                setclipboard("https://discord.gg/vFmU8pNcfU")
            end)
            if not success then
                warn("Failed to copy Discord link: " .. tostring(err))
            end
        end)
    else
        keyInput.Text = ""
        keyInput.PlaceholderText = "Invalid key!"
        keyInput.PlaceholderColor3 = Color3.fromRGB(255, 50, 50)
    end
end)

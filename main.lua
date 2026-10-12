# ZenClimbDumplingSquishyKeyboardTower
-- ===================================================================
-- ZENITH AUTO MONEY TP ($500 & $1,000) - ELEGANT 1:1 (FULL CODE)
-- Design: Compact 1:1 Style, Smooth Animations, Soft Sound & Fast Loop
-- ===================================================================

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")
local SoundService = game:GetService("SoundService")

local LocalPlayer = Players.LocalPlayer

-- -------------------------------------------------------------------
-- STATE MANAGEMENT
-- -------------------------------------------------------------------
local State = {
    AutoMoneyTP = false
}

-- -------------------------------------------------------------------
-- AUDIO SYSTEM (Calm & Soft Feedback)
-- -------------------------------------------------------------------
local function PlaySoftSound()
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://6895079853"
    sound.Volume = 0.3
    sound.Pitch = 1.2
    sound.Parent = SoundService
    sound:Play()
    sound.Ended:Connect(function()
        sound:Destroy()
    end)
end

-- -------------------------------------------------------------------
-- STABILIZED SAFE TELEPORT FUNCTION
-- -------------------------------------------------------------------
local function SafeTeleport(targetPosition)
    local char = LocalPlayer.Character
    if char then
        local root = char:FindFirstChild("HumanoidRootPart")
        if root then
            root.AssemblyLinearVelocity = Vector3.zero
            root.CFrame = CFrame.new(targetPosition + Vector3.new(0, 3.0, 0))
            
            root.Anchored = true
            task.delay(0.2, function()
                root.Anchored = false
            end)
        end
    end
end

-- -------------------------------------------------------------------
-- ULTRA FAST AUTO TELEPORT LOOP TASK ($500 & $1000)
-- -------------------------------------------------------------------
local moneyPositions = {
    Vector3.new(-764.5, 4.6, -38.8),   -- Pijakan $500 Spot 1
    Vector3.new(-756.5, 4.6, -128.5),  -- Pijakan $500 Spot 2
    Vector3.new(-9.5, 3.8, -480.7)     -- Pijakan $1,000 Spot
}

task.spawn(function()
    while true do
        if State.AutoMoneyTP then
            for _, pos in ipairs(moneyPositions) do
                if not State.AutoMoneyTP then break end
                SafeTeleport(pos)
                task.wait(0.5) -- Jeda kecepatan 0.5 detik
            end
        end
        task.wait(0.2)
    end
end)

-- -------------------------------------------------------------------
-- ELEGANT MINI UI (1:1 RATIO COMPACT FRAME)
-- -------------------------------------------------------------------
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ZenithAutoMoneyUI"
ScreenGui.ResetOnSpawn = false

if gethui then
    ScreenGui.Parent = gethui()
elseif syn and syn.protect_gui then
    syn.protect_gui(ScreenGui)
    ScreenGui.Parent = CoreGui
else
    ScreenGui.Parent = CoreGui
end

-- Main Box 1:1 Aspect Ratio (260x260 pixel)
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 260, 0, 260)
MainFrame.Position = UDim2.new(0.5, -130, 0.5, -130)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 17, 22)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.ClipsDescendants = true
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 12)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(45, 52, 70)
MainStroke.Thickness = 1
MainStroke.Parent = MainFrame

-- Floating Toggle Button ("T" untuk Teleport)
local FloatBtn = Instance.new("TextButton")
FloatBtn.Name = "FloatButton"
FloatBtn.Size = UDim2.new(0, 42, 0, 42)
FloatBtn.Position = UDim2.new(0, 15, 0.52, 0)
FloatBtn.BackgroundColor3 = Color3.fromRGB(20, 24, 33)
FloatBtn.Text = "T"
FloatBtn.TextColor3 = Color3.fromRGB(120, 140, 255)
FloatBtn.Font = Enum.Font.GothamBold
FloatBtn.TextSize = 16
FloatBtn.Visible = false
FloatBtn.Active = true
FloatBtn.Draggable = true
FloatBtn.Parent = ScreenGui

local FloatCorner = Instance.new("UICorner")
FloatCorner.CornerRadius = UDim.new(1, 0)
FloatCorner.Parent = FloatBtn

local FloatStroke = Instance.new("UIStroke")
FloatStroke.Color = Color3.fromRGB(60, 70, 95)
FloatStroke.Thickness = 1.5
FloatStroke.Parent = FloatBtn

-- Header Bar
local Header = Instance.new("Frame")
Header.Size = UDim2.new(1, 0, 0, 36)
Header.BackgroundTransparency = 1
Header.Parent = MainFrame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -40, 1, 0)
Title.Position = UDim2.new(0, 12, 0, 0)
Title.Text = "AUTO MONEY (0.5s) • MINI"
Title.TextColor3 = Color3.fromRGB(220, 225, 240)
Title.TextSize = 11
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.BackgroundTransparency = 1
Title.Parent = Header

local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 24, 0, 24)
CloseBtn.Position = UDim2.new(1, -30, 0, 6)
CloseBtn.Text = "-"
CloseBtn.TextColor3 = Color3.fromRGB(160, 165, 180)
CloseBtn.BackgroundColor3 = Color3.fromRGB(25, 28, 38)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 14
CloseBtn.Parent = Header

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 6)
CloseCorner.Parent = CloseBtn

CloseBtn.MouseButton1Click:Connect(function()
    PlaySoftSound()
    MainFrame.Visible = false
    FloatBtn.Visible = true
end)

FloatBtn.MouseButton1Click:Connect(function()
    PlaySoftSound()
    FloatBtn.Visible = false
    MainFrame.Visible = true
end)

-- Scrolling Container
local Scroll = Instance.new("ScrollingFrame")
Scroll.Size = UDim2.new(1, -16, 1, -42)
Scroll.Position = UDim2.new(0, 8, 0, 38)
Scroll.BackgroundTransparency = 1
Scroll.ScrollBarThickness = 2
Scroll.ScrollBarImageColor3 = Color3.fromRGB(60, 70, 95)
Scroll.Parent = MainFrame

local Layout = Instance.new("UIListLayout")
Layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
Layout.SortOrder = Enum.SortOrder.LayoutOrder
Layout.Padding = UDim.new(0, 5)
Layout.Parent = Scroll

Layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    Scroll.CanvasSize = UDim2.new(0, 0, 0, Layout.AbsoluteContentSize.Y + 10)
end)

-- UI Helpers
local function AddCategory(name)
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -6, 0, 20)
    label.Text = name
    label.TextColor3 = Color3.fromRGB(90, 105, 140)
    label.TextSize = 10
    label.Font = Enum.Font.GothamBold
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.BackgroundTransparency = 1
    label.Parent = Scroll
end

local function AddToggle(text, defaultState, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -6, 0, 32)
    btn.BackgroundColor3 = Color3.fromRGB(22, 25, 34)
    btn.Font = Enum.Font.GothamMedium
    btn.TextSize = 11
    btn.Parent = Scroll

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = btn

    local currentState = defaultState
    local function Render()
        btn.Text = text .. " -> " .. (currentState and "ON" or "OFF")
        btn.TextColor3 = currentState and Color3.fromRGB(120, 220, 160) or Color3.fromRGB(160, 165, 180)
    end
    Render()

    btn.MouseButton1Click:Connect(function()
        PlaySoftSound()
        currentState = not currentState
        Render()
        TweenService:Create(btn, TweenInfo.new(0.15), {BackgroundColor3 = currentState and Color3.fromRGB(28, 35, 48) or Color3.fromRGB(22, 25, 34)}):Play()
        pcall(callback, currentState)
    end)
end

local function AddButton(text, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -6, 0, 32)
    btn.BackgroundColor3 = Color3.fromRGB(28, 32, 44)
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(200, 205, 220)
    btn.Font = Enum.Font.GothamMedium
    btn.TextSize = 11
    btn.Parent = Scroll

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = btn

    btn.MouseButton1Click:Connect(function()
        PlaySoftSound()
        TweenService:Create(btn, TweenInfo.new(0.1), {BackgroundColor3 = Color3.fromRGB(40, 48, 65)}):Play()
        task.delay(0.1, function()
            TweenService:Create(btn, TweenInfo.new(0.1), {BackgroundColor3 = Color3.fromRGB(28, 32, 44)}):Play()
        end)
        pcall(callback)
    end)
end

-- -------------------------------------------------------------------
-- BUILD UI ITEMS
-- -------------------------------------------------------------------

AddCategory("FITUR UTAMA AUTO")
AddToggle("Auto TP Money (0.5s)", State.AutoMoneyTP, function(v)
    State.AutoMoneyTP = v
end)

AddCategory("TELEPORT MANUAL SPOT")
AddButton("TP Pijakan $1,000 ->", function()
    SafeTeleport(Vector3.new(-9.5, 3.8, -480.7))
end)

AddButton("TP Pijakan $500 (Spot 1) ->", function()
    SafeTeleport(Vector3.new(-764.5, 4.6, -38.8))
end)

AddButton("TP Pijakan $500 (Spot 2) ->", function()
    SafeTeleport(Vector3.new(-756.5, 4.6, -128.5))
end)

print("Zenith Auto Money TP ($500 & $1000 Only) Loaded Successfully!")

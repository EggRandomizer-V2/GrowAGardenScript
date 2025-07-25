-- Roblox Egg Re
-- Roblox Egg Refresher Script (Fully Movable, Green-Black Gradient, Title Label)

local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local TweenService = game:GetService("TweenService")

-- === ScreenGui ===
local screenGui = Instance.new("ScreenGui", playerGui)
screenGui.ResetOnSpawn = false

-- === Easier Drag Function ===
local function makeDraggable(frame)
    frame.Active = true
    frame.Draggable = true
end

-- === Start Frame ===
local startFrame = Instance.new("Frame", screenGui)
startFrame.Size = UDim2.new(0, 250, 0, 120)
startFrame.Position = UDim2.new(0.4, 0, 0.4, 0)
startFrame.BackgroundColor3 = Color3.fromRGB(34, 70, 34)
Instance.new("UICorner", startFrame)
makeDraggable(startFrame)

local startGradient = Instance.new("UIGradient", startFrame)
startGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(34, 70, 34)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))
}

local startButton = Instance.new("TextButton", startFrame)
startButton.Size = UDim2.new(0.7, 0, 0.5, 0)
startButton.Position = UDim2.new(0.15, 0, 0.25, 0)
startButton.Text = "Start"
startButton.Font = Enum.Font.SourceSans
startButton.TextSize = 22
startButton.TextColor3 = Color3.new(1, 1, 1)
startButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Instance.new("UICorner", startButton)
local startTextStroke = Instance.new("UIStroke", startButton)
startTextStroke.Color = Color3.fromRGB(255, 255, 255)
startTextStroke.Thickness = 0.8

-- === Main Square ===
local mainSquare = Instance.new("Frame", screenGui)
mainSquare.Size = UDim2.new(0, 280, 0, 250)
mainSquare.Position = UDim2.new(0.4, 0, 0.35, 0)
mainSquare.BackgroundColor3 = Color3.fromRGB(34, 70, 34)
mainSquare.Visible = false
Instance.new("UICorner", mainSquare)
makeDraggable(mainSquare)

local mainGradient = Instance.new("UIGradient", mainSquare)
mainGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(34, 70, 34)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))
}

-- === Egg Button ===
local eggButton = Instance.new("TextButton", mainSquare)
eggButton.Size = UDim2.new(0.8, 0, 0.15, 0)
eggButton.Position = UDim2.new(0.1, 0, 0.05, 0)
eggButton.Text = "Choose Egg"
eggButton.Font = Enum.Font.SourceSans
eggButton.TextSize = 18
eggButton.TextColor3 = Color3.new(1, 1, 1)
eggButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
Instance.new("UICorner", eggButton)
local eggStroke = Instance.new("UIStroke", eggButton)
eggStroke.Color = Color3.fromRGB(255, 255, 255)

-- === Refresh Button ===
local refreshButton = Instance.new("TextButton", mainSquare)
refreshButton.Size = UDim2.new(0.8, 0, 0.15, 0)
refreshButton.Position = UDim2.new(0.1, 0, 0.25, 0)
refreshButton.Text = "Refresh"
refreshButton.Font = Enum.Font.SourceSans
refreshButton.TextSize = 18
refreshButton.TextColor3 = Color3.new(1, 1, 1)
refreshButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
Instance.new("UICorner", refreshButton)
local refreshStroke = Instance.new("UIStroke", refreshButton)
refreshStroke.Color = Color3.fromRGB(255, 255, 255)

-- === Detect Egg Button ===
local detectButton = Instance.new("TextButton", mainSquare)
detectButton.Size = UDim2.new(0.8, 0, 0.15, 0)
detectButton.Position = UDim2.new(0.1, 0, 0.45, 0)
detectButton.Text = "Detect Egg"
detectButton.Font = Enum.Font.SourceSans
detectButton.TextSize = 18
detectButton.TextColor3 = Color3.new(1, 1, 1)
detectButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
Instance.new("UICorner", detectButton)
local detectStroke = Instance.new("UIStroke", detectButton)
detectStroke.Color = Color3.fromRGB(255, 255, 255)

-- === Title Label ===
local titleLabel = Instance.new("TextLabel", mainSquare)
titleLabel.Size = UDim2.new(1, 0, 0.15, 0)
titleLabel.Position = UDim2.new(0, 0, 0.65, 0)
titleLabel.Text = "Egg Refresher - Modified by No-Lag Script"
titleLabel.Font = Enum.Font.SourceSansSemibold
titleLabel.TextSize = 14
titleLabel.TextColor3 = Color3.new(1, 1, 1)
titleLabel.BackgroundTransparency = 1

-- === Egg List ===
local eggListFrame = Instance.new("Frame", mainSquare)
eggListFrame.Size = UDim2.new(0.6, 0, 0.6, 0)
eggListFrame.Position = UDim2.new(1.05, 0, 0.05, 0)
eggListFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
eggListFrame.Visible = false
Instance.new("UICorner", eggListFrame)

local eggs = {"Bug Egg", "Night Egg", "Anti-Bee Egg", "Oasis Egg", "Paradise Egg"}
local eggColors = {
    ["Bug Egg"] = Color3.fromRGB(102, 204, 0),
    ["Night Egg"] = Color3.fromRGB(51, 51, 102),
    ["Anti-Bee Egg"] = Color3.fromRGB(204, 51, 0),
    ["Oasis Egg"] = Color3.fromRGB(51, 153, 204),
    ["Paradise Egg"] = Color3.fromRGB(255, 223, 0),
}

for i, eggName in ipairs(eggs) do
    local eggOption = Instance.new("TextButton", eggListFrame)
    eggOption.Size = UDim2.new(1, 0, 0.2, 0)
    eggOption.Position = UDim2.new(0, 0, (i - 1) * 0.22, 0)
    eggOption.Text = eggName
    eggOption.Font = Enum.Font.SourceSans
    eggOption.TextSize = 16

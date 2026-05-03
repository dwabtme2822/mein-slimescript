-- Anti-AFK
local VirtualUser = game:GetService("VirtualUser")
game.Players.LocalPlayer.Idled:Connect(function()
    VirtualUser:ClickButton2(Vector2.new())
end)

-- GUI
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "MeinMenü"
screenGui.Parent = playerGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 200, 0, 120)
frame.Position = UDim2.new(0.05, 0, 0.1, 0)
frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
frame.BorderColor3 = Color3.fromRGB(255, 255, 255)
frame.Parent = screenGui

local title = Instance.new("TextLabel")
title.Text = "Mein Menü"
title.Size = UDim2.new(1, 0, 0, 30)
title.BackgroundTransparency = 1
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.GothamBold
title.Parent = frame

-- Auto Farm Toggle
local autoFarm = false
local button = Instance.new("TextButton")
button.Text = "Auto Farm: AUS"
button.Size = UDim2.new(1, 0, 0, 30)
button.Position = UDim2.new(0, 0, 0, 40)
button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
button.TextColor3 = Color3.fromRGB(255, 255, 255)
button.Parent = frame

button.MouseButton1Click:Connect(function()
    autoFarm = not autoFarm
    button.Text = "Auto Farm: " .. (autoFarm and "AN" or "AUS")
end)

-- Hauptloop
while true do
    if autoFarm then
        pcall(function()
            game:GetService("ReplicatedStorage").RemoteEvents.FarmMobs:FireServer()
        end)
    end
    wait(0.5)
end   
-- Steal a Brainrot - Server Finder
-- Painel de troca de servidor

local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")

local player = Players.LocalPlayer
local placeId = game.PlaceId

local gui = Instance.new("ScreenGui")
gui.Name = "BrainrotServerFinder"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.fromOffset(240, 150)
frame.Position = UDim2.new(0.5, -120, 0.5, -75)
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
frame.Parent = gui

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 35)
title.Text = "BRAINROT SERVER FINDER"
title.TextColor3 = Color3.new(1, 1, 1)
title.BackgroundTransparency = 1
title.TextScaled = true
title.Parent = frame

local function createButton(text, y, callback)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, -20, 0, 40)
    button.Position = UDim2.fromOffset(10, y)
    button.Text = text
    button.TextScaled = true
    button.TextColor3 = Color3.new(1, 1, 1)
    button.BackgroundColor3 = Color3.fromRGB(40, 120, 255)
    button.Parent = frame
    button.Activated:Connect(callback)
end

createButton("NEXT SERVER", 45, function()
    warn("A busca automática por Brainrots 20M+ ainda não está implementada.")
end)

createButton("REJOIN", 95, function()
    TeleportService:Teleport(placeId, player)
end)

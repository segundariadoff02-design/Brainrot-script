
    return button
end

local minimize = makeButton("—", UDim2.new(1, -55, 0, 5), UDim2.fromOffset(22, 25))
local close = makeButton("X", UDim2.new(1, -29, 0, 5), UDim2.fromOffset(22, 25))

local saveButton = makeButton(
    "SALVE POSIÇÃO",
    UDim2.fromOffset(15, 55),
    UDim2.new(1, -30, 0, 40)
)

local tpButton = makeButton(
    "TP SAVE",
    UDim2.fromOffset(15, 105),
    UDim2.new(1, -30, 0, 40)
)

local status = Instance.new("TextLabel")
status.Size = UDim2.new(1, -20, 0, 18)
status.Position = UDim2.fromOffset(10, 148)
status.BackgroundTransparency = 1
status.Text = "Nenhuma posição salva"
status.TextColor3 = Color3.fromRGB(200, 200, 200)
status.TextSize = 11
status.Font = Enum.Font.Gotham
status.Parent = frame

saveButton.MouseButton1Click:Connect(function()
    local character = player.Character
    local root = character and character:FindFirstChild("HumanoidRootPart")

    if root then
        savedPosition = root.CFrame
        status.Text = "Posição salva!"
        saveButton.BackgroundColor3 = Color3.fromRGB(20, 120, 55)
    else
        status.Text = "Personagem não encontrado"
    end
end)

tpButton.MouseButton1Click:Connect(function()
    if not savedPosition then
        status.Text = "Salve uma posição primeiro!"
        return
    end

    local character = player.Character
    local root = character and character:FindFirstChild("HumanoidRootPart")

    if root then
        root.CFrame = savedPosition
        status.Text = "TP solicitado!"
    else
        status.Text = "Personagem não encontrado"
    end
end)

local minimized = false

minimize.MouseButton1Click:Connect(function()
    minimized = not minimized
    saveButton.Visible = not minimized
    tpButton.Visible = not minimized
    status.Visible = not minimized
    frame.Size = minimized
        and UDim2.fromOffset(230, 40)
        or UDim2.fromOffset(230, 170)
end)

close.MouseButton1Click:Connect(function()
    gui:Destroy()
end)

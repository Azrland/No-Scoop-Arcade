local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/uwuware"))()
local Window = Library:CreateWindow("Azland XIT")


Window:AddButton({
    text = "VIP Mode",
    callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ExploiterGuy/Aqua-Hub/refs/heads/main/No-Scope%20Arcade.txt"))()
    end
})


Window:AddButton({
    text = "Enable Infinite Jump",
    callback = function()
        _G.InfiniteJump = true
        game:GetService("UserInputService").JumpRequest:Connect(function()
            if _G.InfiniteJump then
                game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
            end
        end)
    end
})
Window:AddButton({ text = "Disable Infinite Jump", callback = function() _G.InfiniteJump = false end })


Window:AddSlider({
    text = "Set WalkSpeed",
    min = 16, max = 300, default = 50,
    callback = function(value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
    end
})


Window:AddButton({
    text = "Enable Hitbox Expander",
    callback = function()
        _G.HeadSize = 20
        _G.Disabled = false
        game:GetService('RunService').RenderStepped:Connect(function()
            if not _G.Disabled then
                for i, v in next, game:GetService('Players'):GetPlayers() do
                    if v.Name ~= game:GetService('Players').LocalPlayer.Name then
                        pcall(function()
                            v.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize, _G.HeadSize, _G.HeadSize)
                            v.Character.HumanoidRootPart.Transparency = 0.7
                            v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really blue")
                            v.Character.HumanoidRootPart.Material = "Neon"
                            v.Character.HumanoidRootPart.CanCollide = false
                        end)
                    end
                end
            end
        end)
    end
})
Window:AddButton({ text = "Disable Hitbox Expander", callback = function() _G.Disabled = true end })

-- Aimbot
Window:AddButton({
    text = "Enable Aimbot (Head)",
    callback = function()
        _G.Aimbot = "Head"
        game:GetService('RunService').RenderStepped:Connect(function()
            if _G.Aimbot then
                local cam = game:GetService("Workspace").CurrentCamera
                local localPlayer = game.Players.LocalPlayer
                local target, distance = nil, math.huge

                for _, v in pairs(game.Players:GetPlayers()) do
                    if v ~= localPlayer and v.Character and v.Character:FindFirstChild("Head") then
                        local pos, onScreen = cam:WorldToViewportPoint(v.Character.Head.Position)
                        if onScreen then
                            local d = (Vector2.new(pos.X, pos.Y) - Vector2.new(cam.ViewportSize.X / 2, cam.ViewportSize.Y / 2)).magnitude
                            if d < distance then
                                target, distance = v, d
                            end
                        end
                    end
                end
                if target then
                    cam.CFrame = CFrame.new(cam.CFrame.Position, target.Character.Head.Position)
                end
            end
        end)
    end
})
Window:AddButton({
    text = "Enable Aimbot (Body)",
    callback = function()
        _G.Aimbot = "Body"
        game:GetService('RunService').RenderStepped:Connect(function()
            if _G.Aimbot then
                local cam = game:GetService("Workspace").CurrentCamera
                local localPlayer = game.Players.LocalPlayer
                local target, distance = nil, math.huge

                for _, v in pairs(game.Players:GetPlayers()) do
                    if v ~= localPlayer and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                        local pos, onScreen = cam:WorldToViewportPoint(v.Character.HumanoidRootPart.Position)
                        if onScreen then
                            local d = (Vector2.new(pos.X, pos.Y) - Vector2.new(cam.ViewportSize.X / 2, cam.ViewportSize.Y / 2)).magnitude
                            if d < distance then
                                target, distance = v, d
                            end
                        end
                    end
                end
                if target then
                    cam.CFrame = CFrame.new(cam.CFrame.Position, target.Character.HumanoidRootPart.Position)
                end
            end
        end)
    end
})
Window:AddButton({ text = "Disable Aimbot", callback = function() _G.Aimbot = false end })


Window:AddButton({
    text = "Enable ESP Wallhack",
    callback = function()
        _G.ESP = true
        while _G.ESP do
            wait(0.1)
            for _, player in pairs(game:GetService("Players"):GetPlayers()) do
                if player ~= game.Players.LocalPlayer and player.Character then
                    if not player.Character:FindFirstChild("ESP") then
                        local highlight = Instance.new("Highlight", player.Character)
                        highlight.Name = "ESP"
                        highlight.FillColor = Color3.fromRGB(255, 0, 0)
                        highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                        highlight.FillTransparency = 0.5
                    end
                end
            end
        end
    end
})
Window:AddButton({ text = "Disable ESP Wallhack", callback = function() _G.ESP = false end })


Window:AddButton({
    text = "Enable Silent Aim",
    callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/2JRybWjU"))()
    end
})


Window:AddButton({
    text = "Teleport to Safe Zone",
    callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 100, 0) -- Ganti dengan koordinat yang diinginkan
    end
})

Window:AddButton({
    text = "Teleport to Enemy",
    callback = function()
        for _, v in pairs(game.Players:GetPlayers()) do
            if v ~= game.Players.LocalPlayer and v.Character then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame
                break
            end
        end
    end
})

Library:Init()

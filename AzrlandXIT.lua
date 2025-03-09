local correctKey = "azrlandteam"
local inputKey = nil

repeat
    inputKey = tostring(game:HttpGet("https://sfl.gl/i8g9Ut"))
    if inputKey ~= correctKey then
        game.Players.LocalPlayer:Kick("Wrong key! Please check on YouTube @Azrland")
    end
until inputKey == correctKey

-- [[ UI LIBRARY ]] --
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/uwuware"))()
local Window = Library:CreateWindow("AzR Bypass VIP Menu")

-- [[ VIP MODE ]] --
Window:AddButton({
    text = "Activate VIP Mode",
    callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ExploiterGuy/Aqua-Hub/refs/heads/main/No-Scope%20Arcade.txt"))()
    end
})

-- [[ Aimbot ]] --
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

-- [[ Silent Aim ]] --
Window:AddButton({
    text = "Enable Silent Aim",
    callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/2JRybWjU"))()
    end
})

-- [[ Teleport ]] --
Window:AddButton({
    text = "Teleport to Safe Zone",
    callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 100, 0)
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

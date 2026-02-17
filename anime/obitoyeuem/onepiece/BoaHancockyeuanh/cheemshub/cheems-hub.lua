-- [[ 1. ĐỢI GAME TẢI XONG ]] --
repeat task.wait() until game:IsLoaded()

-- [[ 2. TẢI GIAO DIỆN MIKASA TRƯỚC ]] --
-- Chúng ta tải UI trước để hệ thống 'Notifications' của nó khởi tạo bình thường
local success, result = pcall(function()
    return loadstring(game:HttpGet("https://raw.githubusercontent.com/fhfuf-commits/mikasa-hub/refs/heads/main/AOT/anime/obitoyeuem/onepiece/BoaHancockyeuanh/cheemshub/eren/mikasahub.lua"))()
end)

-- Đợi 3 giây để UI hiện lên hoàn tất rồi mới chạy Anti-ban
task.wait(3)

-- [[ 3. BẬT ANTI-BAN SAU KHI ĐÃ CÓ MENU ]] --
if success then
    pcall(function()
        local mt = getrawmetatable(game)
        local oldNamecall = mt.__namecall
        setreadonly(mt, false)

        mt.__namecall = newcclosure(function(self, ...)
            local method = getnamecallmethod()
            
            -- CHỈ CHẶN: Các gói tin Admin/Report để bảo vệ bạn
            if method == "FireServer" and (self.Name == "AdminPanel" or self.Name == "Report" or self.Name == "CombatFrameworkCheck") then
                return nil
            end

            return oldNamecall(self, ...)
        end)
        setreadonly(mt, true)
    end)
end

-- Tự thoát khi thấy Admin
game:GetService("Players").PlayerAdded:Connect(function(player)
    if player:GetRankInGroup(2850137) >= 100 then 
        game.Players.LocalPlayer:Kick("TBoy Roblox: Phát hiện Admin!")
    end
end)

-- [[ 4. CÁC HÀM HỖ TRỢ ]] --
local function Notify(text)
    pcall(function()
        local v0 = require(game:GetService("ReplicatedStorage").Notification)
        v0.new("<Color=Cyan> " .. text .. " <Color=/>"):Display()
    end)
end

_G.AutoFarm = false
_G.SelectWeapon = "Melee"

function Tween(Pos)
    pcall(function()
        local char = game.Players.LocalPlayer.Character
        if char and char:FindFirstChild("HumanoidRootPart") then
            local dist = (Pos.Position - char.HumanoidRootPart.Position).Magnitude
            game:GetService("TweenService"):Create(char.HumanoidRootPart, TweenInfo.new(dist/300, Enum.EasingStyle.Linear), {CFrame = Pos}):Play()
        end
    end)
end

local function FastAttack()
    pcall(function()
        local cf = require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework)
        local controller = getupvalues(cf)[2]
        if controller and controller.activeController then
            controller.activeController.hitboxMagnitude = 55
            controller.activeController.timeToNextAttack = 0
            controller.activeController:attack()
        end
    end)
end

local function GetQuestData(level)
    if level >= 1 and level <= 9 then return "BanditQuest1", "Bandit Recruiter", "Bandit"
    elseif level >= 10 and level <= 14 then return "MonkeyQuest1", "Monkey Affiliate", "Monkey"
    elseif level >= 15 and level <= 29 then return "GorillaQuest1", "Monkey Affiliate", "Gorilla"
    elseif level >= 30 and level <= 39 then return "PirateQuest1", "Pirate Affiliate", "Pirate"
    elseif level >= 40 and level <= 59 then return "BruteQuest1", "Pirate Affiliate", "Brute"
    elseif level >= 60 and level <= 74 then return "DesertQuest1", "Desert Adventurer", "Desert Bandit"
    elseif level >= 75 and level <= 89 then return "DesertQuest2", "Desert Adventurer", "Desert Officer"
    elseif level >= 90 and level <= 119 then return "SnowQuest1", "Snow Adventurer", "Snow Bandit"
    elseif level >= 120 and level <= 149 then return "SnowQuest2", "Snow Adventurer", "Snowman"
    end
    return nil
end

-- [[ 5. SETUP WINDOW (DÙNG LẠI CODE CŨ CỦA BẠN) ]] --
local Window = MakeWindow({
    Hub = { Title = "TBoy Roblox", Animation = "Youtube: TBoy Roblox" },
    Key = { KeySystem = false, Keys = {"1234"} }
})

MinimizeButton({
    Image = "rbxassetid://75707650621490",
    Size = {60, 60},
    Color = Color3.fromRGB(10, 10, 10),
    Corner = true
})

local Tab1 = MakeTab({Name = "Auto Farm Level"})

AddButton(Tab1, {
    Name = "Bật Auto Farm (Tự Động Nhận Quest & Bay)",
    Callback = function()
        _G.AutoFarm = not _G.AutoFarm
        if _G.AutoFarm then
            Notify("Auto Farm: ĐÃ BẬT")
            spawn(function()
                while _G.AutoFarm do
                    task.wait(0.1)
                    pcall(function()
                        local lp = game.Players.LocalPlayer
                        local q, n, m = GetQuestData(lp.Data.Level.Value)
                        
                        -- Tự cầm vũ khí
                        local tool = lp.Backpack:FindFirstChild(_G.SelectWeapon) or lp.Character:FindFirstChild(_G.SelectWeapon)
                        if tool and not lp.Character:FindFirstChild(_G.SelectWeapon) then
                            lp.Character.Humanoid:EquipTool(tool)
                        end

                        if not lp.PlayerGui.Main.Quest.Visible then
                            local npc = game:GetService("Workspace").NPCs:FindFirstChild(n) or game:GetService("Workspace"):FindFirstChild(n, true)
                            if npc then
                                if (npc:GetModelCFrame().Position - lp.Character.HumanoidRootPart.Position).Magnitude > 15 then
                                    Tween(npc:GetModelCFrame())
                                else
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", q, 1)
                                end
                            end
                        else
                            local enemy = nil
                            for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v.Name == m and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then 
                                    enemy = v 
                                    break 
                                end
                            end

                            if enemy then
                                if (enemy.HumanoidRootPart.Position - lp.Character.HumanoidRootPart.Position).Magnitude > 300 then
                                    Tween(enemy.HumanoidRootPart.CFrame * CFrame.new(0, 40, 0))
                                else
                                    lp.Character.HumanoidRootPart.CFrame = enemy.HumanoidRootPart.CFrame * CFrame.new(0, 10, 0)
                                    enemy.HumanoidRootPart.CanCollide = false
                                    FastAttack()
                                    game:GetService("VirtualUser"):Button1Down(Vector2.new(50, 50))
                                end
                            end
                        end
                    end)
                end
            end)
        else
            Notify("Auto Farm: ĐÃ TẮT")
        end
    end
})

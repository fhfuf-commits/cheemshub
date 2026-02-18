-- [[ 1. ĐỢI GAME TẢI XONG ]] --
repeat task.wait() until game:IsLoaded()
task.wait(1)

-- [[ 2. TẢI THƯ VIỆN UI MIKASA ]] --
local success, result = pcall(function()
    return loadstring(game:HttpGet("https://raw.githubusercontent.com/fhfuf-commits/mikasa-hub/refs/heads/main/AOT/anime/obitoyeuem/onepiece/BoaHancockyeuanh/cheemshub/eren/mikasahub.lua"))()
end)

if not success then
    warn("Lỗi tải giao diện: " .. tostring(result))
    return
end

-- [[ 3. HÀM TỐI ƯU ĐÒN ĐÁNH (FAST ATTACK & HITBOX) ]] --
-- Đoạn này giúp đứng trên cao vẫn đánh trúng quái bên dưới
local function FastAttack()
    pcall(function()
        local cf = require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework)
        local controller = getupvalues(cf)[2]
        if controller and controller.activeController then
            -- Mở rộng tầm đánh để chạm tới quái khi đứng trên đầu
            controller.activeController.hitboxMagnitude = 60 
            -- Loại bỏ thời gian chờ giữa các đòn đánh
            controller.activeController.timeToNextAttack = 0
            controller.activeController:attack()
        end
    end)
end

-- [[ 4. CẤU HÌNH FARM ]] --
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

-- [[ 5. TẠO GIAO DIỆN ]] --
local Window = MakeWindow({
    Hub = { Title = "TBoy Roblox - FAST MODE", Animation = "Youtube: TBoy Roblox" },
    Key = { KeySystem = false, Keys = {"1234"} }
})

local Tab1 = MakeTab({Name = "Auto Farm"})

AddButton(Tab1, {
    Name = "BẬT AUTO FARM (FAST ATTACK + ABOVE)",
    Callback = function()
        _G.AutoFarm = not _G.AutoFarm
        if _G.AutoFarm then
            spawn(function()
                while _G.AutoFarm do
                    task.wait() -- Chạy nhanh nhất có thể
                    pcall(function()
                        local lp = game.Players.LocalPlayer
                        local char = lp.Character
                        local q, n, m = GetQuestData(lp.Data.Level.Value)
                        
                        -- Tự cầm vũ khí
                        local tool = lp.Backpack:FindFirstChild(_G.SelectWeapon) or char:FindFirstChild(_G.SelectWeapon)
                        if tool and not char:FindFirstChild(_G.SelectWeapon) then
                            char.Humanoid:EquipTool(tool)
                        end

                        if not lp.PlayerGui.Main.Quest.Visible then
                            -- Bay đi nhận Quest
                            local npc = game:GetService("Workspace").NPCs:FindFirstChild(n) or game:GetService("Workspace"):FindFirstChild(n, true)
                            if npc then
                                if (npc:GetModelCFrame().Position - char.HumanoidRootPart.Position).Magnitude > 15 then
                                    Tween(npc:GetModelCFrame())
                                else
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", q, 1)
                                end
                            end
                        else
                            -- Tìm quái
                            local enemy = nil
                            for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v.Name == m and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                                    enemy = v break
                                end
                            end

                            if enemy then
                                if (enemy.HumanoidRootPart.Position - char.HumanoidRootPart.Position).Magnitude > 300 then
                                    Tween(enemy.HumanoidRootPart.CFrame * CFrame.new(0, 40, 0))
                                else
                                    -- ĐỨNG TRÊN ĐẦU QUÁI 10 ĐƠN VỊ
                                    char.HumanoidRootPart.CFrame = enemy.HumanoidRootPart.CFrame * CFrame.new(0, 10, 0)
                                    enemy.HumanoidRootPart.CanCollide = false
                                    
                                    -- KÍCH HOẠT ĐÁNH NHANH VÀ TẦM XA
                                    FastAttack()
                                    game:GetService("VirtualUser"):Button1Down(Vector2.new(50, 50))
                                end
                            end
                        end
                    end)
                end
            end)
        end
    end
})

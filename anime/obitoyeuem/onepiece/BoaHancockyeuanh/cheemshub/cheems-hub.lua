-- [[ HỆ THỐNG BẢO MẬT ]] --
pcall(function()
    local mt = getrawmetatable(game)
    setreadonly(mt, false)
    local old = mt.__namecall
    mt.__namecall = newcclosure(function(self, ...)
        local method = getnamecallmethod()
        if method == "FireServer" and (self.Name == "AdminPanel" or self.Name == "Report") then
            return nil
        end
        return old(self, ...)
    end)
end)

-- [[ FIX LỖI NOTIFICATIONS CHO MIKASA HUB ]] --
-- Chúng ta sẽ giả lập (Mock) các hàm bị thiếu để giao diện không báo lỗi 'nil' nữa
if not shared.NotifFixed then
    local rStorage = game:GetService("ReplicatedStorage")
    if not rStorage:FindFirstChild("Notification") then
        local fakeNotif = Instance.new("ModuleScript", rStorage)
        fakeNotif.name = "Notification"
    end
    shared.NotifFixed = true
end

-- Tải lại giao diện Mikasa (Giao diện bạn thích)
local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/fhfuf-commits/mikasa-hub/refs/heads/main/AOT/anime/obitoyeuem/onepiece/BoaHancockyeuanh/cheemshub/eren/mikasahub.lua"))()

-- [[ LOGIC TỰ ĐỘNG HÓA CHÍNH ]] --
_G.AutoFarm = false
_G.SelectWeapon = "Melee"

function Tween(Pos)
    local char = game.Players.LocalPlayer.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        local dist = (Pos.Position - char.HumanoidRootPart.Position).Magnitude
        game:GetService("TweenService"):Create(char.HumanoidRootPart, TweenInfo.new(dist/300, Enum.EasingStyle.Linear), {CFrame = Pos}):Play()
    end
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
    end
    -- Bạn có thể copy thêm các mốc level từ file 11k dòng vào đây
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

-- [[ TẠO MENU MIKASA ]] --
local Window = MakeWindow({
    Hub = { Title = "cheems-hub PREMIUM", Animation = "cheems-hub: PREMIUM VIP" },
    Key = { KeySystem = false, Keys = {"1234"} }
})

local Tab1 = MakeTab({Name = "Script Farm"})

AddButton(Tab1, {
    Name = "BẬT AUTO FARM (FULL TỰ ĐỘNG)",
    Callback = function()
        _G.AutoFarm = not _G.AutoFarm
        if _G.AutoFarm then
            spawn(function()
                while _G.AutoFarm do
                    task.wait()
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
                            -- TỰ BAY ĐẾN NHẬN QUEST
                            local npc = game:GetService("Workspace").NPCs:FindFirstChild(n) or game:GetService("Workspace"):FindFirstChild(n, true)
                            if npc then
                                if (npc:GetModelCFrame().Position - char.HumanoidRootPart.Position).Magnitude > 15 then
                                    Tween(npc:GetModelCFrame())
                                else
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", q, 1)
                                end
                            end
                        else
                            -- TỰ BAY ĐẾN ĐÁNH QUÁI
                            local enemy = nil
                            for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v.Name == m and v.Humanoid.Health > 0 then enemy = v break end
                            end

                            if enemy then
                                if (enemy.HumanoidRootPart.Position - char.HumanoidRootPart.Position).Magnitude > 300 then
                                    Tween(enemy.HumanoidRootPart.CFrame * CFrame.new(0, 40, 0))
                                else
                                    char.HumanoidRootPart.CFrame = enemy.HumanoidRootPart.CFrame * CFrame.new(0, 10, 0)
                                    enemy.HumanoidRootPart.CanCollide = false
                                    FastAttack()
                                    game:GetService("VirtualUser"):Button1Down(Vector2.new(50, 50))
                                end
                            else
                                -- Đợi quái hồi sinh
                                local sp = game:GetService("Workspace").EnemySpawns:FindFirstChild(m)
                                if sp then Tween(sp.CFrame * CFrame.new(0, 40, 0)) end
                            end
                        end
                    end)
                end
            end)
        end
    end
})

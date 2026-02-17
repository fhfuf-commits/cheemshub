-- [[ HỆ THỐNG BẢO MẬT ANTI-BAN ]] --
pcall(function()
    local mt = getrawmetatable(game)
    local oldNamecall = mt.__namecall
    setreadonly(mt, false)
    mt.__namecall = newcclosure(function(self, ...)
        local method = getnamecallmethod()
        if method == "FireServer" and (self.Name == "AdminPanel" or self.Name == "Report" or self.Name == "CombatFrameworkCheck") then
            return nil
        end
        return oldNamecall(self, ...)
    end)
    setreadonly(mt, true)

    game:GetService("Players").PlayerAdded:Connect(function(player)
        if player:GetRankInGroup(2850137) >= 100 then 
            game.Players.LocalPlayer:Kick("PREMIUM VIP")
        end
    end)
end)

-- Tải thư viện UI
loadstring(game:HttpGet("https://raw.githubusercontent.com/fhfuf-commits/mikasa-hub/refs/heads/main/AOT/anime/obitoyeuem/onepiece/BoaHancockyeuanh/cheemshub/eren/mikasahub.lua"))()

local function Notify(text)
    pcall(function()
        local v0 = require(game:GetService("ReplicatedStorage").Notification)
        v0.new("<Color=Cyan> " .. text .. " <Color=/>"):Display()
    end)
end

-- [[ HÀM DI CHUYỂN (TWEEN) - GIÚP QUA ĐẢO ]] --
function Tween(Pos)
    local Distance = (Pos.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    local Speed = 300 
    local info = TweenInfo.new(Distance / Speed, Enum.EasingStyle.Linear)
    local tween = game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, info, {CFrame = Pos})
    tween:Play()
    return tween
end

local Window = MakeWindow({
    Hub = { Title = "cheems-hub PREMIUM", Animation = "cheems-hub PREMIUM VIP" },
    Key = { KeySystem = false, Keys = {"1234"} }
})

MinimizeButton({
    Image = "rbxassetid://75707650621490",
    Size = {60, 60},
    Color = Color3.fromRGB(10, 10, 10),
    Corner = true
})

local Tab1 = MakeTab({Name = "Script Farm"})
local Tab2 = MakeTab({Name = "Cài Đặt M1"})

_G.SelectWeapon = "Melee"
_G.AutoFarm = false

-- [ TAB CHỌN VŨ KHÍ ]
AddButton(Tab2, { Name = "Sử dụng Melee", Callback = function() _G.SelectWeapon = "Melee" Notify("Đã chọn: Melee") end })
AddButton(Tab2, { Name = "Sử dụng Sword", Callback = function() _G.SelectWeapon = "Sword" Notify("Đã chọn: Sword") end })
AddButton(Tab2, { Name = "Sử dụng Fruit", Callback = function() _G.SelectWeapon = "Blox Fruit" Notify("Đã chọn: Fruit") end })

-- [[ LOGIC NHẬN DIỆN NPC & QUÁI THEO LEVEL (FULL SEA 1) ]] --
local function GetQuestData(level)
    local q, n, m = "", "", ""
    if level >= 1 and level <= 9 then q = "BanditQuest1"; n = "Bandit Recruiter"; m = "Bandit"
    elseif level >= 10 and level <= 14 then q = "MonkeyQuest1"; n = "Monkey Affiliate"; m = "Monkey"
    elseif level >= 15 and level <= 29 then q = "GorillaQuest1"; n = "Monkey Affiliate"; m = "Gorilla"
    elseif level >= 30 and level <= 39 then q = "PirateQuest1"; n = "Pirate Affiliate"; m = "Pirate"
    elseif level >= 40 and level <= 59 then q = "BruteQuest1"; n = "Pirate Affiliate"; m = "Brute"
    elseif level >= 60 and level <= 74 then q = "DesertQuest1"; n = "Desert Adventurer"; m = "Desert Bandit"
    elseif level >= 75 and level <= 89 then q = "DesertQuest2"; n = "Desert Adventurer"; m = "Desert Officer"
    elseif level >= 90 and level <= 119 then q = "SnowQuest1"; n = "Snow Adventurer"; m = "Snow Bandit"
    elseif level >= 120 and level <= 149 then q = "SnowQuest2"; n = "Snow Adventurer"; m = "Snowman"
    elseif level >= 150 and level <= 174 then q = "MarineQuest1"; n = "Marine Officer"; m = "Chief Petty Officer"
    elseif level >= 175 and level <= 189 then q = "MarineQuest2"; n = "Marine Officer"; m = "Brute"
    elseif level >= 190 and level <= 209 then q = "SkyQuest1"; n = "Sky Adventurer"; m = "Sky Bandit"
    elseif level >= 210 and level <= 249 then q = "SkyQuest2"; n = "Sky Adventurer"; m = "Dark Master"
    elseif level >= 250 and level <= 299 then q = "PrisonQuest1"; n = "Prisoner Warden"; m = "Prisoner"
    elseif level >= 300 and level <= 324 then q = "MagmaQuest1"; n = "Magma Admiral"; m = "Military Soldier"
    elseif level >= 325 and level <= 374 then q = "MagmaQuest2"; n = "Magma Admiral"; m = "Military Spy"
    elseif level >= 375 and level <= 399 then q = "FishmanQuest1"; n = "Fishman Warrior"; m = "Fishman Warrior"
    elseif level >= 400 and level <= 449 then q = "FishmanQuest2"; n = "Fishman Warrior"; m = "Fishman Commando"
    end
    return q, n, m
end

-- [[ FAST ATTACK THÔNG MINH ]] --
local function FastAttack()
    pcall(function()
        local CombatFramework = require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework)
        local CurrentCCC = getupvalues(CombatFramework)[2]
        if CurrentCCC and CurrentCCC.activeController then
            CurrentCCC.activeController.hitboxMagnitude = 55
            CurrentCCC.activeController.timeToNextAttack = 0
            CurrentCCC.activeController.attacking = false
            CurrentCCC.activeController.increment = 3
            CurrentCCC.activeController:attack()
        end
    end)
end

-- [ NÚT AUTO FARM CHÍNH ]
AddButton(Tab1, {
    Name = "Auto Farm Level (Tự Qua Đảo)",
    Callback = function()
        _G.AutoFarm = not _G.AutoFarm
        if _G.AutoFarm then
            Notify("Auto Farm: ĐANG BẬT")
            spawn(function()
                while _G.AutoFarm do
                    task.wait()
                    pcall(function()
                        local lp = game.Players.LocalPlayer
                        local char = lp.Character
                        local qName, nName, mName = GetQuestData(lp.Data.Level.Value)
                        
                        -- Cầm vũ khí
                        local tool = lp.Backpack:FindFirstChild(_G.SelectWeapon) or char:FindFirstChild(_G.SelectWeapon)
                        if tool and not char:FindFirstChild(_G.SelectWeapon) then
                            char.Humanoid:EquipTool(tool)
                        end

                        -- Logic Nhận Quest & Di chuyển
                        if not lp.PlayerGui.Main.Quest.Visible then
                            local npc = game:GetService("Workspace").NPCs:FindFirstChild(nName) or game:GetService("Workspace"):FindFirstChild(nName, true)
                            if npc then
                                if (npc:GetModelCFrame().Position - char.HumanoidRootPart.Position).Magnitude > 20 then
                                    Tween(npc:GetModelCFrame())
                                else
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", qName, 1)
                                end
                            end
                        else
                            -- Tìm quái và Đánh
                            local enemy = nil
                            for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v.Name == mName and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                                    enemy = v break
                                end
                            end
                            
                            if enemy then
                                if (enemy.HumanoidRootPart.Position - char.HumanoidRootPart.Position).Magnitude > 300 then
                                    Tween(enemy.HumanoidRootPart.CFrame * CFrame.new(0, 50, 0))
                                else
                                    char.HumanoidRootPart.CFrame = enemy.HumanoidRootPart.CFrame * CFrame.new(0, 10, 0)
                                    enemy.HumanoidRootPart.CFrame = char.HumanoidRootPart.CFrame
                                    enemy.HumanoidRootPart.CanCollide = false
                                    FastAttack()
                                    game:GetService("VirtualUser"):CaptureController()
                                    game:GetService("VirtualUser"):Button1Down(Vector2.new(50, 50))
                                end
                            else
                                -- Nếu quái chưa hồi sinh, bay đến chỗ spawn đợi
                                local spawn = game:GetService("Workspace").EnemySpawns:FindFirstChild(mName)
                                if spawn then Tween(spawn.CFrame * CFrame.new(0, 50, 0)) end
                            end
                        end
                    end)
                end
            end)
        end
    end
})

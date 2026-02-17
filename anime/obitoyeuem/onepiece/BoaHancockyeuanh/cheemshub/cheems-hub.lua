-- [[ HỆ THỐNG BẢO MẬT ANTI-BAN & ADMIN ]] --
pcall(function()
    local mt = getrawmetatable(game)
    local oldNamecall = mt.__namecall
    setreadonly(mt, false)
    mt.__namecall = newcclosure(function(self, ...)
        local method = getnamecallmethod()
        if method == "FireServer" and (self.Name == "AdminPanel" or self.Name == "Report") then
            return nil
        end
        return oldNamecall(self, ...)
    end)
    setreadonly(mt, true)
end)

-- [[ TẢI THƯ VIỆN UI - PHIÊN BẢN FIX LỖI NOTIFICATIONS ]] --
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("TBoy Roblox - Auto Farm Sea 1", "Midnight")

-- [[ HÀM THÔNG BÁO AN TOÀN ]] --
local function Notify(txt)
    pcall(function()
        local notif = require(game:GetService("ReplicatedStorage").Notification)
        notif.new("<Color=Cyan> " .. txt .. " <Color=/>"):Display()
    end)
end

-- [[ HÀM DI CHUYỂN (TWEEN) ]] --
function Tween(Pos)
    local char = game.Players.LocalPlayer.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end
    local dist = (Pos.Position - char.HumanoidRootPart.Position).Magnitude
    local speed = 300
    local tween = game:GetService("TweenService"):Create(char.HumanoidRootPart, TweenInfo.new(dist/speed, Enum.EasingStyle.Linear), {CFrame = Pos})
    tween:Play()
    return tween
end

-- [[ HÀM FAST ATTACK ]] --
local function FastAttack()
    pcall(function()
        local cf = require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework)
        local controller = getupvalues(cf)[2]
        if controller and controller.activeController then
            controller.activeController.hitboxMagnitude = 55
            controller.activeController.attacking = false
            controller.activeController.timeToNextAttack = 0
            controller.activeController.increment = 3
            controller.activeController:attack()
        end
    end)
end

-- [[ DATA NHIỆM VỤ & NPC ]] --
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

-- [[ GIAO DIỆN ]] --
local Main = Window:NewTab("Main Farm")
local Section = Main:NewSection("Auto Farm Level")

_G.AutoFarm = false
_G.SelectWeapon = "Melee"

Section:NewDropdown("Chọn Vũ Khí", "Chọn thứ bạn muốn cầm", {"Melee", "Sword", "Blox Fruit"}, function(v)
    _G.SelectWeapon = v
end)

Section:NewToggle("Bật Auto Farm", "Tự động nhận quest và đánh quái", function(state)
    _G.AutoFarm = state
    if state then
        Notify("Auto Farm: Đã kích hoạt!")
        spawn(function()
            while _G.AutoFarm do
                task.wait()
                pcall(function()
                    local lp = game.Players.LocalPlayer
                    local char = lp.Character
                    local qName, nName, mName = GetQuestData(lp.Data.Level.Value)

                    -- Auto Tool
                    local tool = lp.Backpack:FindFirstChild(_G.SelectWeapon) or char:FindFirstChild(_G.SelectWeapon)
                    if tool and not char:FindFirstChild(_G.SelectWeapon) then
                        char.Humanoid:EquipTool(tool)
                    end

                    -- Check Quest
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
                        -- Đánh quái
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
                                game:GetService("VirtualUser"):Button1Down(Vector2.new(50, 50))
                            end
                        else
                            local spawnPos = game:GetService("Workspace").EnemySpawns:FindFirstChild(mName)
                            if spawnPos then Tween(spawnPos.CFrame * CFrame.new(0, 50, 0)) end
                        end
                    end
                end)
            end
        end)
    end
end)

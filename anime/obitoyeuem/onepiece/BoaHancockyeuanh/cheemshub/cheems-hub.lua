-- [[ 1. DỌN DẸP VÀ CHUẨN BỊ ]] --
repeat task.wait() until game:IsLoaded()

-- Fix lỗi 'Notifications' bằng cách giả lập hệ thống thông báo nếu thiếu
if not game:GetService("ReplicatedStorage"):FindFirstChild("Notification") then
    local fake = Instance.new("ModuleScript")
    fake.Name = "Notification"
    fake.Parent = game:GetService("ReplicatedStorage")
end

-- [[ 2. TẢI UI MIKASA HUB (GIAO DIỆN CŨ) ]] --
local success, result = pcall(function()
    return loadstring(game:HttpGet("https://raw.githubusercontent.com/fhfuf-commits/mikasa-hub/refs/heads/main/AOT/anime/obitoyeuem/onepiece/BoaHancockyeuanh/cheemshub/eren/mikasahub.lua"))()
end)

if not success then return end

-- [[ 3. LOGIC FAST ATTACK & TẦM ĐÁNH ]] --
local function FastAttack()
    pcall(function()
        local cf = require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework)
        local controller = getupvalues(cf)[2]
        if controller and controller.activeController then
            -- ĐỨNG TRÊN CAO VẪN ĐÁNH TRÚNG (TẦM ĐÁNH 60)
            controller.activeController.hitboxMagnitude = 60 
            controller.activeController.timeToNextAttack = 0
            controller.activeController:attack()
        end
    end)
end

-- [[ 4. CẤU HÌNH BAY VÀ NHẬN QUEST ]] --
_G.AutoFarm = false
_G.SelectWeapon = "Melee"

function Tween(Pos)
    pcall(function()
        local char = game.Players.LocalPlayer.Character
        local dist = (Pos.Position - char.HumanoidRootPart.Position).Magnitude
        game:GetService("TweenService"):Create(char.HumanoidRootPart, TweenInfo.new(dist/300, Enum.EasingStyle.Linear), {CFrame = Pos}):Play()
    end)
end

local function GetQuestData(level)
    if level >= 1 and level <= 9 then return "BanditQuest1", "Bandit Recruiter", "Bandit"
    -- (Các mốc level khác giữ nguyên như cũ)
    end
end

-- [[ 5. TẠO MENU ]] --
local Window = MakeWindow({
    Hub = { Title = "TBoy Roblox - FIXED", Animation = "Youtube: TBoy Roblox" },
    Key = { KeySystem = false, Keys = {"1234"} }
})

local Tab1 = MakeTab({Name = "Auto Farm"})

AddButton(Tab1, {
    Name = "BẬT AUTO FARM (ĐỨNG TRÊN ĐẦU QUÁI)",
    Callback = function()
        _G.AutoFarm = not _G.AutoFarm
        if _G.AutoFarm then
            spawn(function()
                while _G.AutoFarm do
                    task.wait()
                    pcall(function()
                        local lp = game.Players.LocalPlayer
                        local q, n, m = GetQuestData(lp.Data.Level.Value)
                        
                        -- Tự cầm vũ khí
                        local tool = lp.Backpack:FindFirstChild(_G.SelectWeapon) or lp.Character:FindFirstChild(_G.SelectWeapon)
                        if tool and not lp.Character:FindFirstChild(_G.SelectWeapon) then
                            lp.Character.Humanoid:EquipTool(tool)
                        end

                        if not lp.PlayerGui.Main.Quest.Visible then
                            -- Bay nhận Quest
                            local npc = game:GetService("Workspace").NPCs:FindFirstChild(n) or game:GetService("Workspace"):FindFirstChild(n, true)
                            if npc then
                                if (npc:GetModelCFrame().Position - lp.Character.HumanoidRootPart.Position).Magnitude > 15 then
                                    Tween(npc:GetModelCFrame())
                                else
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", q, 1)
                                end
                            end
                        else
                            -- Tìm và đánh quái
                            local enemy = nil
                            for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v.Name == m and v.Humanoid.Health > 0 then enemy = v break end
                            end

                            if enemy then
                                -- BAY ĐẾN TRÊN ĐẦU QUÁI (CAO 10 ĐƠN VỊ)
                                if (enemy.HumanoidRootPart.Position - lp.Character.HumanoidRootPart.Position).Magnitude > 300 then
                                    Tween(enemy.HumanoidRootPart.CFrame * CFrame.new(0, 40, 0))
                                else
                                    lp.Character.HumanoidRootPart.CFrame = enemy.HumanoidRootPart.CFrame * CFrame.new(0, 10, 0)
                                    enemy.HumanoidRootPart.CanCollide = false
                                    FastAttack() -- Đánh từ trên xuống
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

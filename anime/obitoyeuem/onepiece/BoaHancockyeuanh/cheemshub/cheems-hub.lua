-- Tải thư viện UI
loadstring(game:HttpGet("https://raw.githubusercontent.com/fhfuf-commits/mikasa-hub/refs/heads/main/AOT/anime/obitoyeuem/onepiece/BoaHancockyeuanh/cheemshub/eren/mikasahub.lua"))()

-- Cấu hình Window
local Window = MakeWindow({
    Hub = {
        Title = "cheems-hub PREMIUM",
        Animation = "cheems-hub VIP"
    },
    Key = {
        KeySystem = false,
        Title = "Key System",
        Description = "",
        KeyLink = "",
        Keys = {"1234"},
        Notifi = {
            Notifications = true,
            CorrectKey = "Running the Script...",
            Incorrectkey = "The key is incorrect",
            CopyKeyLink = "Copied to Clipboard"
        }
    }
})

-- Nút thu nhỏ
MinimizeButton({
    Image = "rbxassetid://75707650621490", 
    Size = {60, 60},
    Color = Color3.fromRGB(10, 10, 10),
    Corner = true,
    Stroke = false,
    StrokeColor = Color3.fromRGB(255, 0, 0)
})
-- [HÀM FAST ATTACK - MỔ XẺ TỪ SOURCESCRIPT.TXT]
local function FastAttack()
    pcall(function()
        local CombatFramework = require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework)
        local v1860 = getupvalues(CombatFramework)[2]
        
        if v1860 and v1860.activeController then
            -- Tăng tầm đánh (Hitbox)
            v1860.activeController.hitboxMagnitude = 55
            
            -- Xóa Cooldown để chém siêu nhanh
            v1860.activeController.timeToNextAttack = 0
            v1860.activeController.attacking = false
            v1860.activeController.increment = 3
            v1860.activeController.blocking = false
            
            -- Thực hiện đòn đánh
            v1860.activeController:attack()
            
            -- Click chuột ảo dự phòng
            game:GetService("VirtualUser"):CaptureController()
            game:GetService("VirtualUser"):Button1Down(Vector2.new(50, 50))
        end
    end)
end

------ Tabs
local Tab1o = MakeTab({Name = "Script Farm"})
local Tab2o = MakeTab({Name = "Chọn Vũ Khí"})

------- TAB CHỌN VŨ KHÍ (M1 CLICK SELECTION)
_G.SelectWeapon = "Melee" -- Mặc định là Melee

AddButton(Tab2o, {
    Name = "Sử dụng Melee (Đấm)",
    Callback = function() 
        _G.SelectWeapon = "Melee" 
        print("Đã chọn: Melee") 
    end
})
AddButton(Tab2o, {
    Name = "Sử dụng Sword (Kiếm)",
    Callback = function() 
        _G.SelectWeapon = "Sword" 
        print("Đã chọn: Kiếm") 
    end
})
AddButton(Tab2o, {
    Name = "Sử dụng Fruit (Trái Ác Quỷ)",
    Callback = function() 
        _G.SelectWeapon = "Blox Fruit" 
        print("Đã chọn: Trái Ác Quỷ") 
    end
})

------- TAB AUTO FARM (DUNG HỢP LOGIC)

AddButton(Tab1o, {
    Name = "Auto Farm Level + Fast Attack",
    Callback = function()
        _G.AutoFarm = not _G.AutoFarm
        
        if _G.AutoFarm then
            print("TBoy Roblox: Bắt đầu Farm với " .. _G.SelectWeapon)
            
            spawn(function()
                while _G.AutoFarm do
                    task.wait()
                    pcall(function()
                        local lp = game.Players.LocalPlayer
                        local char = lp.Character
                        local MyLevel = lp.Data.Level.Value
                        
                        -- 1. TỰ ĐỘNG CẦM VŨ KHÍ ĐÃ CHỌN
                        local tool = lp.Backpack:FindFirstChild(_G.SelectWeapon) or char:FindFirstChild(_G.SelectWeapon)
                        if tool and not char:FindFirstChild(_G.SelectWeapon) then
                            lp.Character.Humanoid:EquipTool(tool)
                        end
                        
                        -- 2. LOGIC NHẬN NHIỆM VỤ
                        if not lp.PlayerGui.Main.Quest.Visible then
                            local QuestName
                            if MyLevel >= 1 and MyLevel <= 9 then
                                QuestName = "BanditQuest1"
                            elseif MyLevel >= 10 and MyLevel <= 14 then
                                QuestName = "MonkeyQuest1"
                            -- Bạn có thể trích xuất thêm các Quest khác từ file txt dán vào đây
                            end
                            
                            if QuestName then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", QuestName, 1)
                            end
                        else
                            -- 3. LOGIC GOM QUÁI & TẤN CÔNG NHANH
                            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                                    -- Gom quái lại trước mặt
                                    v.HumanoidRootPart.CFrame = char.HumanoidRootPart.CFrame * CFrame.new(0, 0, -5)
                                    v.HumanoidRootPart.CanCollide = false
                                    v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                    
                                    -- Gọi Fast Attack đã mổ xẻ
                                    FastAttack()
                                end
                            end
                        end
                    end)
                end
            end)
        else
            print("TBoy Roblox: Đã tắt Auto Farm!")
        end
    end
})

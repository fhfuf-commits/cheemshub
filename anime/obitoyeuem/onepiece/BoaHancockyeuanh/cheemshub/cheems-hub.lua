-- [[ HỆ THỐNG ANTI-BAN BẢO MẬT - TRÍCH XUẤT TỪ SOURCESCRIPT.TXT ]] --
pcall(function()
    -- 1. Chặn game gửi dữ liệu nghi ngờ (Anti-Cheat Bypass)
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

    -- 2. Chống bị Kick khi di chuyển nhanh (Anti-Kick)
    game:GetService("GuiService").ErrorMessageChanged:Connect(function()
        local error = game:GetService("GuiService"):GetErrorMessage()
        if error:find("disconnection") or error:find("kick") then
            game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer)
        end
    end)

    -- 3. Phát hiện Admin (Auto Leave)
    game:GetService("Players").PlayerAdded:Connect(function(player)
        if player:GetRankInGroup(2850137) >= 100 then 
            game.Players.LocalPlayer:Kick("Phát hiện Admin vào Server! Đã tự động thoát để bảo vệ tài khoản.")
        end
    end)
end)

-- Tải thư viện UI
loadstring(game:HttpGet("https://raw.githubusercontent.com/fhfuf-commits/mikasa-hub/refs/heads/main/AOT/anime/obitoyeuem/onepiece/BoaHancockyeuanh/cheemshub/eren/mikasahub.lua"))()

-- Hàm thông báo mây xanh (Cyan)
local function Notify(text)
    pcall(function()
        local v0 = require(game:GetService("ReplicatedStorage").Notification)
        v0.new("<Color=Cyan> " .. text .. " <Color=/>"):Display()
    end)
end

local Window = MakeWindow({
    Hub = {
        Title = "TBoy Roblox",
        Animation = "Youtube: TBoy Roblox"
    },
    Key = {
        KeySystem = false,
        Keys = {"1234"}
    }
})

MinimizeButton({
    Image = "rbxassetid://75707650621490",
    Size = {60, 60},
    Color = Color3.fromRGB(10, 10, 10),
    Corner = true
})

Notify("Bảo Mật: ĐÃ KÍCH HOẠT")

------ Tabs
local Tab1 = MakeTab({Name = "Script Farm"})
local Tab2 = MakeTab({Name = "Cài Đặt M1"})

-- [ BIẾN HỆ THỐNG ]
_G.SelectWeapon = "Melee"
_G.AutoFarm = false

-- [ TAB CHỌN VŨ KHÍ ]
AddButton(Tab2, {
    Name = "Sử dụng Melee",
    Callback = function() 
        _G.SelectWeapon = "Melee" 
        Notify("Đã chọn: Melee")
    end
})
AddButton(Tab2, {
    Name = "Sử dụng Sword",
    Callback = function() 
        _G.SelectWeapon = "Sword" 
        Notify("Đã chọn: Sword")
    end
})
AddButton(Tab2, {
    Name = "Sử dụng Fruit",
    Callback = function() 
        _G.SelectWeapon = "Blox Fruit" 
        Notify("Đã chọn: Fruit")
    end
})

-- [ LOGIC FARM LEVEL TRÍCH XUẤT ]

local function FastAttack()
    pcall(function()
        local v1860 = getupvalues(require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework))[2]
        if v1860 and v1860.activeController then
            v1860.activeController.hitboxMagnitude = 55
            v1860.activeController.timeToNextAttack = 0
            v1860.activeController.attacking = false
            v1860.activeController.increment = 3
            v1860.activeController.blocking = false
            v1860.activeController:attack()
        end
    end)
end

local function GetQuest(level)
    local qName = ""
    local qLevel = 1
    if level >= 1 and level <= 9 then qName = "BanditQuest1"
    elseif level >= 10 and level <= 14 then qName = "MonkeyQuest1"
    elseif level >= 15 and level <= 29 then qName = "GorillaQuest1"
    elseif level >= 30 and level <= 39 then qName = "PirateQuest1"
    elseif level >= 40 and level <= 59 then qName = "BruteQuest1"
    elseif level >= 60 and level <= 74 then qName = "DesertQuest1"
    elseif level >= 75 and level <= 89 then qName = "DesertQuest2"
    elseif level >= 90 and level <= 119 then qName = "SnowQuest1"
    elseif level >= 120 and level <= 149 then qName = "SnowQuest2"
    elseif level >= 150 and level <= 174 then qName = "MarineQuest1"
    elseif level >= 175 and level <= 189 then qName = "MarineQuest2"
    elseif level >= 190 and level <= 209 then qName = "SkyQuest1"
    elseif level >= 210 and level <= 249 then qName = "SkyQuest2"
    elseif level >= 250 and level <= 299 then qName = "PrisonQuest1"
    elseif level >= 300 and level <= 324 then qName = "MagmaQuest1"
    elseif level >= 325 and level <= 374 then qName = "MagmaQuest2"
    elseif level >= 375 and level <= 399 then qName = "FishmanQuest1"
    elseif level >= 400 and level <= 449 then qName = "FishmanQuest2"
    end
    if qName ~= "" then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", qName, qLevel)
    end
end

-- [ NÚT AUTO FARM CHÍNH ]
AddButton(Tab1, {
    Name = "Auto Farm Level",
    Callback = function()
        _G.AutoFarm = not _G.AutoFarm
        
        if _G.AutoFarm then
            Notify("Auto Farm: ĐANG BẬT")
            spawn(function()
                while _G.AutoFarm do
                    task.wait()
                    pcall(function()
                        local lp = game:GetService("Players").LocalPlayer
                        local char = lp.Character
                        
                        -- Cầm vũ khí
                        local tool = lp.Backpack:FindFirstChild(_G.SelectWeapon) or char:FindFirstChild(_G.SelectWeapon)
                        if tool and not char:FindFirstChild(_G.SelectWeapon) then
                            char.Humanoid:EquipTool(tool)
                        end
                        
                        -- Logic Farm
                        if not lp.PlayerGui.Main.Quest.Visible then
                            GetQuest(lp.Data.Level.Value)
                        else
                            for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                                    v.HumanoidRootPart.CFrame = char.HumanoidRootPart.CFrame
                                    v.HumanoidRootPart.CanCollide = false
                                    FastAttack()
                                    game:GetService("VirtualUser"):CaptureController()
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

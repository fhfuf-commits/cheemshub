-- [[ 1. TRÍCH XUẤT UI LIBRARY NỘI BỘ (FROM 11K LINES FILE) ]] --
local Library = {}
function Library:CreateWindow(TitleText)
    local UI = Instance.new("ScreenGui", game:GetService("CoreGui"))
    UI.Name = "Internal_UI_Library"

    local Main = Instance.new("Frame", UI)
    Main.Name = "Main"
    Main.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    Main.BorderSizePixel = 0
    Main.Position = UDim2.new(0.5, -250, 0.5, -175)
    Main.Size = UDim2.new(0, 500, 0, 350)
    Main.Active = true
    Main.Draggable = true -- Đặc trưng của các bản script cũ
    Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 10)

    local TopBar = Instance.new("Frame", Main)
    TopBar.Name = "TopBar"
    TopBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    TopBar.Size = UDim2.new(1, 0, 0, 40)
    Instance.new("UICorner", TopBar).CornerRadius = UDim.new(0, 10)

    local Title = Instance.new("TextLabel", TopBar)
    Title.Text = TitleText
    Title.TextColor3 = Color3.new(1, 1, 1)
    Title.Size = UDim2.new(1, 0, 1, 0)
    Title.BackgroundTransparency = 1
    Title.Font = Enum.Font.GothamBold
    Title.TextSize = 18

    local Container = Instance.new("ScrollingFrame", Main)
    Container.Name = "Container"
    Container.Position = UDim2.new(0, 10, 0, 50)
    Container.Size = UDim2.new(1, -20, 1, -60)
    Container.BackgroundTransparency = 1
    Container.ScrollBarThickness = 2

    local Layout = Instance.new("UIListLayout", Container)
    Layout.Padding = UDim.new(0, 10)

    local function CreateToggle(Text, Callback)
        local Tgl = Instance.new("TextButton", Container)
        Tgl.Size = UDim2.new(1, 0, 0, 40)
        Tgl.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        Tgl.Text = Text .. " : OFF"
        Tgl.TextColor3 = Color3.new(1, 1, 1)
        Instance.new("UICorner", Tgl).CornerRadius = UDim.new(0, 8)
        
        local Enabled = false
        Tgl.MouseButton1Click:Connect(function()
            Enabled = not Enabled
            Tgl.Text = Text .. " : " .. (Enabled and "ON" or "OFF")
            Tgl.BackgroundColor3 = Enabled and Color3.fromRGB(0, 150, 0) or Color3.fromRGB(40, 40, 40)
            Callback(Enabled)
        end)
    end

    return {CreateToggle = CreateToggle}
end

-- [[ 2. KHỞI TẠO GIAO DIỆN VÀ LOGIC ]] --
local Window = Library:CreateWindow("MIKASA PRIVATE - 11K EXTRACT")

-- Logic Fast Attack trích xuất
local function FastAttack()
    pcall(function()
        local cf = require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework)
        local controller = getupvalues(cf)[2]
        if controller and controller.activeController then
            controller.activeController.hitboxMagnitude = 60 
            controller.activeController.timeToNextAttack = 0
            controller.activeController:attack()
        end
    end)
end

-- Logic Quest Sea 1
local function GetQuestData()
    local level = game.Players.LocalPlayer.Data.Level.Value
    if level >= 1 and level <= 9 then return "BanditQuest1", "Bandit Recruiter", "Bandit"
    elseif level >= 10 and level <= 14 then return "MonkeyQuest1", "Monkey Affiliate", "Monkey"
    elseif level >= 15 and level <= 29 then return "GorillaQuest1", "Monkey Affiliate", "Gorilla"
    -- ... (Bạn có thể thêm các level khác ở đây)
    end
    return "BanditQuest1", "Bandit Recruiter", "Bandit" -- Default
end

-- [[ 3. LẮP LOGIC VÀO KHUNG ]] --
_G.AutoFarm = false
_G.SelectWeapon = "Melee"

Window.CreateToggle("Auto Farm Level (Above)", function(Value)
    _G.AutoFarm = Value
    if _G.AutoFarm then
        spawn(function()
            while _G.AutoFarm do
                task.wait()
                pcall(function()
                    local lp = game.Players.LocalPlayer
                    local char = lp.Character
                    local q, n, m = GetQuestData()

                    -- Tự cầm vũ khí
                    local tool = lp.Backpack:FindFirstChild(_G.SelectWeapon) or char:FindFirstChild(_G.SelectWeapon)
                    if tool and not char:FindFirstChild(_G.SelectWeapon) then
                        char.Humanoid:EquipTool(tool)
                    end

                    if not lp.PlayerGui.Main.Quest.Visible then
                        -- Bay nhận Quest (Tween logic)
                        local npc = game:GetService("Workspace").NPCs:FindFirstChild(n) or game:GetService("Workspace"):FindFirstChild(n, true)
                        if npc then
                            char.HumanoidRootPart.CFrame = npc:GetModelCFrame()
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", q, 1)
                        end
                    else
                        -- Tìm quái
                        local enemy = nil
                        for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == m and v.Humanoid.Health > 0 then enemy = v break end
                        end

                        if enemy then
                            -- ĐỨNG TRÊN ĐẦU QUÁI 10 ĐƠN VỊ (Trích xuất từ file 11k)
                            char.HumanoidRootPart.CFrame = enemy.HumanoidRootPart.CFrame * CFrame.new(0, 10, 0)
                            enemy.HumanoidRootPart.CanCollide = false
                            FastAttack()
                            game:GetService("VirtualUser"):Button1Down(Vector2.new(50, 50))
                        end
                    end
                end)
            end
        end)
    end
end)

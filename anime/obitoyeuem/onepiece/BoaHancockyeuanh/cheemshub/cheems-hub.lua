-- [[ KHUNG MENU GIỐNG MARU HUB - 100% CUSTOMIZABLE ]] --
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")

-- Xóa UI cũ nếu có để tránh trùng lặp khi chạy lại script
if CoreGui:FindFirstChild("Cheems_CustomUI") then
    CoreGui.Cheems_CustomUI:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "Cheems_CustomUI"
ScreenGui.Parent = CoreGui

-- [[ 1. NÚT TRÒN MINI (LOGO) ]] --
local MiniButton = Instance.new("ImageButton")
local UICorner_Mini = Instance.new("UICorner")

MiniButton.Name = "MiniButton"
MiniButton.Parent = ScreenGui
MiniButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MiniButton.Position = UDim2.new(0.02, 0, 0.15, 0)
MiniButton.Size = UDim2.new(0, 60, 0, 60)
MiniButton.Image = "rbxassetid://75707650621490" -- ID Logo của bạn
MiniButton.ZIndex = 10
MiniButton.Draggable = true -- Có thể kéo khắp màn hình

UICorner_Mini.CornerRadius = UDim.new(1, 0)
UICorner_Mini.Parent = MiniButton

-- [[ 2. KHUNG MENU CHÍNH (MAIN FRAME) ]] --
local MainFrame = Instance.new("Frame")
local MainCorner = Instance.new("UICorner")
local Sidebar = Instance.new("Frame")
local LogoMain = Instance.new("ImageLabel")
local Title = Instance.new("TextLabel") -- CHỖ ĐỂ TÊN (Ví dụ: Maru Hub)
local Container = Instance.new("Frame") -- Khu vực chứa chức năng bên phải

MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
MainFrame.Size = UDim2.new(0, 0, 0, 0) -- Bắt đầu từ 0 để làm hiệu ứng phóng to
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.Visible = false
MainFrame.ClipsDescendants = true

MainCorner.CornerRadius = UDim.new(0, 8)
MainCorner.Parent = MainFrame

-- Sidebar (Thanh bên trái)
Sidebar.Name = "Sidebar"
Sidebar.Parent = MainFrame
Sidebar.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Sidebar.Size = UDim2.new(0, 160, 1, 0)

-- Logo lớn trong Menu
LogoMain.Name = "LogoMain"
LogoMain.Parent = Sidebar
LogoMain.BackgroundTransparency = 1
LogoMain.Position = UDim2.new(0, 25, 0, 20)
LogoMain.Size = UDim2.new(0, 110, 0, 110)
LogoMain.Image = "rbxassetid://75707650621490"

-- Tên Menu (Chỗ Maru Hub)
Title.Name = "MenuTitle"
Title.Parent = Sidebar
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0, 0, 0, 135)
Title.Size = UDim2.new(1, 0, 0, 30)
Title.Font = Enum.Font.GothamBold
Title.Text = "Cheems Hub PREMIUM " -- << THAY TÊN BẠN MUỐN VÀO ĐÂY
Title.TextColor3 = Color3.fromRGB(200, 200, 200)
Title.TextSize = 16

-- Khu vực chức năng bên phải
Container.Name = "Container"
Container.Parent = MainFrame
Container.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Container.Position = UDim2.new(0, 165, 0, 10)
Container.Size = UDim2.new(1, -175, 1, -20)
Container.BackgroundTransparency = 0.5

-- [[ 3. HIỆU ỨNG PHÓNG TO KHI NHẤN ]] --
local function OpenMenu()
    if MainFrame.Visible == false then
        MainFrame.Visible = true
        -- Tween phóng to từ 0 lên 550x380 (Kích thước giống Maru Hub)
        local OpenTween = TweenService:Create(MainFrame, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
            Size = UDim2.new(0, 550, 0, 380)
        })
        OpenTween:Play()
    else
        local CloseTween = TweenService:Create(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {
            Size = UDim2.new(0, 0, 0, 0)
        })
        CloseTween:Play()
        CloseTween.Completed:Connect(function()
            MainFrame.Visible = false
        end)
    end
end

MiniButton.MouseButton1Click:Connect(OpenMenu)

print("menu đã được bật !")

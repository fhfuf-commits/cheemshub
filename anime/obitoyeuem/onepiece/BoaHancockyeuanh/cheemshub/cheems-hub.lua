print("Break");
local v0 = require(game:GetService("ReplicatedStorage").Notification);
v0.new("<Color=Cyan> cheems hub <Color=/>"):Display();
wait(0.5);
v0.new("<Color=Yellow>Everyone Goes to Discord to Communicate<Color=/>"):Display();
wait(1);
repeat
	wait();
until game.Players.LocalPlayer
if  not game:IsLoaded() then
	game.Loaded:Wait();
end
local v1 = task;
if game:GetService("Players").LocalPlayer.PlayerGui.Main:FindFirstChild("ChooseTeam") then
	repeat
		task.wait();
		if (game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("Main").ChooseTeam.Visible == true) then
			if (getgenv().Team == "Marines") then
				for v1932, v1933 in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container['Marines'].Frame.TextButton.Activated)) do
					for v2129, v2130 in pairs(getconnections(game:GetService("UserInputService").TouchTapInWorld)) do
						v2130:Fire();
					end
					v1933.Function();
				end
			else
				for v1934, v1935 in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container['Pirates'].Frame.TextButton.Activated)) do
					for v2131, v2132 in pairs(getconnections(game:GetService("UserInputService").TouchTapInWorld)) do
						v2132:Fire();
					end
					v1935.Function();
				end
			end
		end
	until (game.Players.LocalPlayer.Team ~= nil) and game:IsLoaded()
end
spawn(function()
	for v621, v622 in pairs(game:GetService("ReplicatedStorage").Effect.Container:GetChildren()) do
		if ((v622.Name == "Death") or (v622.Name == "Spawn")) then
			v622:Destroy();
		end
	end
end);
spawn(function()
	for _, v in pairs(game:GetDescendants()) do
		
		if v:IsA("ParticleEmitter") then
			v.Lifetime = NumberRange.new(0)
			v.Rate = 0
			v.LockedToPart = false
			v.VelocityInheritance = 0
			v.Rotation = NumberRange.new(0)
			v.Speed = NumberRange.new(0)
			v.EmissionDirection = Enum.NormalId.Front
			v.RotationSpeed = NumberRange.new(0)
		end
		
		if v:IsA("Trail") then
			v.Enabled = false
		end
		
	end
end)
spawn(function()
	pcall(function()
		while wait() do
			if (getgenv().AntiKill and game.Players.LocalPlayer.Character and (game.Players.LocalPlayer.Character.PrimaryPart.Position.Y < 0)) then
				local v1037 = math.random(1, 500000);
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(830.865295, -171.598984, -64.0148773);
				wait(1.5);
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(830.865295, -37.6812706, -64.0148773);
			end
		end
	end);
end);
local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/blairewhite333/sss/main/qbtn/main.lua'))()
local v72 = Library:CreateWindow("<Color=Red>CheemsHub<font><font>");
v72:Seperator("<Color=Yellow>Menu")
v72:Toggle("Infinite Yield Base", _G.Toggled, function(v25)
	_G.Toggled = v25;
	if _G.Toggled then
		loadstring(game:HttpGet("https://pastebin.com/raw/NVZWQvXg"))();
	end
end);
v72:Button("Copy Discord Invite", function()
	setclipboard("https://discord.gg/cheemshub");
end);
v72:Seperator("Farm");
local Fastattack = false;
v72:Toggle("Auto Farm Devil", _G.bjirFish, function(v26)
	_G.bjirFish = v26;
	StopTween(_G.bjirFish);
end);
v72:Toggle("Auto Farm Ghost Ship", _G.KillGhostShip, function(v27)
	_G.KillGhostShip = v27;
	StopTween(_G.KillGhostShip);
end);
v72:Toggle("Auto Farm Bosses", _G.DoughtBoss, function(v28)
	_G.DoughtBoss = v28;
	StopTween(_G.DoughtBoss);
end);
v72:Toggle("Auto Dungeon Aura", _G.DungeonMobAura, function(v29)
	_G.DungeonMobAura = v29;
	StopTween(_G.DungeonMobAura);
end);
v72:Toggle("Auto Bring Boats", _G.FarmerFishBoat, function(v30)
	_G.FarmerFishBoat = v30;
	StopTween(_G.FarmerFishBoat);
end);
v72:Toggle("Auto Open Chest", _G.FarmChest, function(v31)
	_G.FarmChest = v31;
	StopTween(_G.FarmChest);
end);
v72:Toggle("Auto Tinker Member", _G.TinkerMember, function(v32)
	_G.TinkerMember = v32;
	StopTween(_G.TinkerMember);
end);
v72:Toggle("Instant Finish Cable", _G.Cable, function(v33)
	_G.Cable = v33;
	StopTween(_G.Cable);
end);
v72:Seperator("Auto Farm Quest");
v72:Dropdown("Kitunes Island", {"Kitsune Island", "Reindeer Island", "Phantom Halloween", "Wolf Island", "Snow Island"}, function(v34)
	_G.TeleportDestination = v34
end);
local function TeleportCharacter(position)
	local player = game:GetService("Players").LocalPlayer
	local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
	if hrp then
		hrp.CFrame = position
	end
end
Spawn(function()
	local lastPos = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character.HumanoidRootPart.Position
	while task.wait() do
		if _G.FarmChest then
			for _, v1655 in pairs(game.Workspace:GetDescendants()) do
				if (v1655.Name == "Chest") and (v1655:IsA("BasePart")) then
					local v1656 = game.Players.LocalPlayer
					local v1657 = v1656.Character and v1656.Character:FindFirstChild("HumanoidRootPart")
					if v1657 then
						v1657.CFrame = CFrame.new(v1655.Position)
					end
				end
			end
		end
	end
end)
spawn(function()
	while task.wait(0.1) do
		if (_G.DoughtBoss or _G.DungeonMobAura or _G.FarmChest or _G.FarmChess or _G.FarmerFishBoat or _G.TinkerMember or _G.bjirFishBoat or (_G.KillGhostShip == true)) then
			pcall(function()
				game:GetService("ReplicatedStorage").Remotes.CommE:FireServer("Ken", true);
			end);
		end
	end
end);
spawn(function()
	game:GetService("RunService").RenderStepped:Connect(function()
		if (_G.Click or Fastattack) then
			pcall(function()
				game:GetService("VirtualUser"):CaptureController();
				game:GetService("VirtualUser"):Button1Down(Vector2.new(0, 1, 0, 1));
			end);
		end
	end);
end);
v72:Button("Kill All Players", function()
	for _, v59 in pairs(game.Players:GetPlayers()) do
		if v59 ~= game.Players.LocalPlayer then
			fireclickdetector(v59.Character.Head.ClickDetector)
		end
	end
end);
v72:Button("Collect Crystals", function()
	for _, v72 in pairs(workspace:GetDescendants()) do
		if v72.Name == "PickUp" and v72.Parent == workspace then
			fireproximityprompt(v72)
		end
	end
end);
v72:Seperator("Local Player");
v72:Slider("Walkspeed", 16, 16, 100, function(v60)
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v60;
end);
v72:Slider("Jumppower", 50, 50, 200, function(v61)
	game.Players.LocalPlayer.Character.Humanoid.JumpPower = v61;
end);
v72:Toggle("Triple Jump", _G.TriJump, function(v62)
	_G.TriJump = v62;
	if _G.TriJump then
		game.Players.LocalPlayer.Character.Humanoid.JumpPower = 350;
	end
end);
v72:Seperator("Other Options");
v72:Toggle("Teleport Kitsune Shrine", false, function(v63)
	_G.tpkit = v63;
	StopTween(_G.tpkit);
end);
v72:Spawn("Click Every 0.1s", function()
	while _G.tpkit do
		local v1837 = game:GetService("Workspace").Map:FindFirstChild("KitsuneIsland");
		if v1837 then
			local shrine = v1837.ShrineActive
			for _, shrinePart in ipairs(shrine:GetChildren()) do
				firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, shrinePart, 0)
				firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, shrinePart, 1)
			end
		end
		task.wait(0.1)
	end
end)
v72:Spawn("Always Render", function()
	while task.wait() do
		game:GetService("RunService").RenderStepped:Wait()
	end
end)
v72:Spawn("Refresh Holy Fruit", function()
	while task.wait(30) do
		local fruit = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame.p
		local oldFruit = game:GetService("Players").LocalPlayer.Data.DevilFruit.Value
		if oldFruit ~= nil and oldFruit ~= "" then
			game:GetService("ReplicatedStorage").Remotes.CommE:FireServer("Rotate", oldFruit)
		end
	end
end)
v72:Toggle("Chest Aura", _G.aura, function(v61)
	_G.aura = v61;
end);
v72:Toggle("Bring Loot to You", _G.BringItems, function(v62)
	_G.BringItems = v62;
end);
spawn(function()
	while wait(1) do
		if _G.aura or _G.BringItems then
			for _, part in pairs(game.Workspace:GetDescendants()) do
				if _G.aura and part.Name == "GoldCoin" then
					part.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
				end
				if _G.BringItems and part.Name == "SpawnLoot" then
					part.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
				end
			end
		end
	end
end)
v72:Seperator("Teleport");
v72:Dropdown("Teleport Spots", {"Marine Soldier", "Barbarian", "Arlong Park", "God", "Pirates", "Jungle", "Coconut", "Arctic", "Snowy Town", "Kitsune Shrine", "Onigashima", "Hidden Castle", "Marine Fortress", "Operation", "Slave Port", "Magma", "Shark Island", "Jeans", "Cake", "Movie Island", "Sphinx", "Dressrosa", "Zoro", "One Piece Island", "Arabasta"}, function(v68)
	if v68 == "Marine Soldier" then
		TeleportCharacter(CFrame.new(1347.94775, 29.164362, -1232.82299))
	elseif v68 == "Barbarian" then
		TeleportCharacter(CFrame.new(-579.660889, 25.4742813, -483.933197))
	elseif v68 == "Arlong Park" then
		TeleportCharacter(CFrame.new(-20.6329975, 23.3581142, 898.860291))
	elseif v68 == "God" then
		TeleportCharacter(CFrame.new(-3722.55176, 7.48484802, 9151.98926))
	elseif v68 == "Pirates" then
		TeleportCharacter(CFrame.new(3321.45239, 30.0556507, -1080.59644))
	elseif v68 == "Jungle" then
		TeleportCharacter(CFrame.new(5265.06055, 44.3299484, -5958.3916))
	elseif v68 == "Coconut" then
		TeleportCharacter(CFrame.new(4607.49805, 49.6353188, -3271.3645))
	elseif v68 == "Arctic" then
		TeleportCharacter(CFrame.new(-3931.73657, 117.905029, -2396.47534))
	elseif v68 == "Snowy Town" then
		TeleportCharacter(CFrame.new(-7939.99023, 385.207336, -7036.1792))
	elseif v68 == "Kitsune Shrine" then
		TeleportCharacter(CFrame.new(640.334106, 6.65219355, -10.4446268))
	elseif v68 == "Onigashima" then
		TeleportCharacter(CFrame.new(8036.37012, 135.525208, -984.263611))
	elseif v68 == "Hidden Castle" then
		TeleportCharacter(CFrame.new(640.334106, 6.65219355, -10.4446268))
	elseif v68 == "Marine Fortress" then
		TeleportCharacter(CFrame.new(-11267.0889, 7.47616863, -6044.60059))
	elseif v68 == "Operation" then
		TeleportCharacter(CFrame.new(-2632.60864, 79.740303, 4653.17432))
	elseif v68 == "Slave Port" then
		TeleportCharacter(CFrame.new(-4315.05713, 30.6513557, 10753.4297))
	elseif v68 == "Magma" then
		TeleportCharacter(CFrame.new(8400.63477, 320.130005, 1216.91138))
	elseif v68 == "Shark Island" then
		TeleportCharacter(CFrame.new(8274.74902, 123.436668, -2720.99683))
	elseif v68 == "Jeans" then
		TeleportCharacter(CFrame.new(8505.99951, 67.0576782, 6111.25439))
	elseif v68 == "Cake" then
		TeleportCharacter(CFrame.new(12083.2871, 35.0456619, -9641.36133))
	elseif v68 == "Movie Island" then
		TeleportCharacter(CFrame.new(2057.84009, 36.1062431, 7681.8252))
	elseif v68 == "Sphinx" then
		TeleportCharacter(CFrame.new(9400.6875, 58.5540771, 2876.1792))
	elseif v68 == "Dressrosa" then
		TeleportCharacter(CFrame.new(3200.10645, 61.6753807, 7600.91406))
	elseif v68 == "Zoro" then
		TeleportCharacter(CFrame.new(-1515.2998, 25.2297325, 172.872391))
	elseif v68 == "One Piece Island" then
		TeleportCharacter(CFrame.new(2504.03467, 32.6315575, 1000.89502))
	elseif v68 == "Arabasta" then
		TeleportCharacter(CFrame.new(-4500.56836, 30.9594879, 6300.34033))
	end
end);
v72:Toggle("No Red BG", false, function(v69)
	_G.NoRed = v69;
end);
v72:Toggle("RightClick Teleport", false, function(v70)
	_G.RightClickTP = v70;
end);
spawn(function()
	game:GetService("UserInputService").InputBegan:Connect(function(input, typing)
		if (_G.RightClickTP and (not typing)) then
			if input.UserInputType == Enum.UserInputType.MouseButton2 then
				local mouse = game.Players.LocalPlayer:GetMouse();
				local position = mouse.Hit.p;
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(position)
			end
		end
	end);
end);
spawn(function()
	game:GetService("RunService").Stepped:Connect(function()
		if _G.NoRed then
			game:GetService("Lighting").Ambient = Color3.fromRGB(255, 255, 255)
			game:GetService("Lighting").OutdoorAmbient = Color3.fromRGB(255, 255, 255)
		end
	end);
end);
v72:Seperator("Criticals");
v72:Button("Remove Spawn", function()
	for _, object in pairs(game.Workspace:GetDescendants()) do
		if object:IsA("BasePart") and object.Name == "Spawn" then
			object:Destroy();
		end
	end
end);
v72:Button("Safe Mode Antihit", function()
	local char = game.Players.LocalPlayer.Character
	if char and char.PrimaryPart then
		char:SetAttribute("Antiafk", true)
	end
end);
v72:Button("Destroy Dropped Chests", function()
	for _, ch in pairs(game.Workspace:GetDescendants()) do
		if ch.Name == "DroppedChest" then
			ch:Destroy()
		end
	end
end);
v72:Button("Crash Players (Cancel to stop)", function()
	local c = coroutine.create(function()
		while true do
			for _, p in pairs(game.Players:GetPlayers()) do
				for _, part in pairs(workspace:GetDescendants()) do
					pcall(function()
						firetouchinterest(p.Character.HumanoidRootPart, part, 0)
					end)
				end
			end
			task.wait()
		end
	end)
	coroutine.resume(c)
end);
v72:Button("GodMode (Don't Move)", function()
	spawn(function()
		while wait() do
			game.Players.LocalPlayer.Character.Humanoid.Health = 0
		end
	end)
end);
v72:Seperator("Combat");
local module = require(game:GetService("ReplicatedStorage").CombatFramework["CombatFramework"]);
function AttackFunction()
	if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") then
		module:attack()
	end
end
LocalFunctions = {}
function getrawmetatable(v768)
	local v768 = v768
	v769 = (setreadonly)
end
local function chew()
	local toolName = game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name
	local Folder = game:GetService("ReplicatedStorage").Remotes
	local count = 0
	for _, v767 in pairs(Folder:children()) do
		if v767.Name == toolName then
			for _, v875 in pairs(v767:children()) do
				if (v875.ClassName == "Function") then
					count = count + 1
				end
			end
		end
	end
	if count > 0 then
		return true
	else
		return false
	end
end
v72:Button("Defend", function()
	local character = game.Players.LocalPlayer.Character
	if character then
		local humanoid = character:FindFirstChildOfClass("Humanoid")
		if humanoid then
			humanoid.Health = humanoid.MaxHealth
			humanoid.WalkSpeed = 0
			task.wait(0.1)
			humanoid.Health = 0
		end
	end
end);
v72:Button("Charge (MousePos)", function()
	local mouse = game.Players.LocalPlayer:GetMouse()
	local char = game.Players.LocalPlayer.Character
	if char then
		game:GetService("VirtualInputManager"):SendKeyEvent(true, "C", false, game)
		wait(_G.Charge)
		game:GetService("VirtualInputManager"):SendKeyEvent(false, "C", false, game)
	end
end);
v72:Toggle("Safe Mode", _G.Safe_Mode, function(v72)
	_G.Safe_Mode = v72;
end);
v72:Button("FPS Boost", function()
	for _, obj in pairs(game:GetService("Workspace"):GetDescendants()) do
		if (obj:IsA("Texture") or obj:IsA("Texture") or obj:IsA("SpecialMesh") or obj:IsA("Decal") or obj:IsA("ParticleEmitter") or obj:IsA("Sound") or obj:IsA("Clothing")) then
			obj:Destroy()
		end
	end
end);
v72:Seperator("Global");
v72:Label("Some random stuff");
v72:Seperator("Test Godmode Without Movement");
v72:Toggle("TestBlock", _G.TrueGod, function(v73)
	_G.TrueGod = v73;
end);
spawn(function()
	while task.wait() do
		if _G.TrueGod then
			local v721 = game.Players.LocalPlayer.Character.Humanoid
			v721.Health = 0
			wait(0.1)
		end
	end
end);
v72:Seperator("Animation IDs");
v72:Button("Rock", function()
	local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(game:GetObjects("rbxassetid://1840267950")[1])
	track:Play()
end);
v72:Button("Jawa", function()
	local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(game:GetObjects("rbxassetid://1834033284")[1])
	track:Play()
end);
v72:Seperator("Sound & 3D");
v72:Toggle("WalkSound", _G.WalkSound, function(v74)
	_G.WalkSound = v74;
	if _G.WalkSound then
		while wait() do
			game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = _G.WalkSpeed
		end
	end
end);
v72:Button("SuperRagWave#", function()
	local args = {
		[1] = "Speed"
	}
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end);
v72:Button("AfkLoop", function()
	local c = coroutine.create(function()
		while true do
			for i=0,9 do
				wait()
				game:GetService("Players").LocalPlayer.Character.Humanoid.Jump = true
			end
			wait(20)
		end
	end)
	coroutine.resume(c)
end);
v72:Button("Bypass Animation", function()
	sethiddenproperty(game.Players.LocalPlayer.Character.Humanoid, "Animator", true)
end);
v72:Seperator("Auto SPAM HOOKS");
v72:Button("Anti Combat Logging", function()
	getgenv().BanList = {}
end);
v72:Button("APC", function()
	getgenv().GodAFK = true;
end);
v72:Button("Rejoin on Vote Kick", function()
	getgenv().NoVoteKick = true;
end);
v72:Button("Vape's Safe Uninject", function()
	loadstring(game:HttpGet(('https://pastebin.com/raw/w7nPpCKS'), true))()
end);
v72:Button("Hammer Crash (Mode)", function()
	for _, p in pairs(game.Players:GetPlayers()) do
		local origName = p.Name
		game.Players.LocalPlayer.Name = origName
		fireclickdetector(game.Players.LocalPlayer.Character.Head.ClickDetector)
	end
end);
v72:Button("GG Crash", function()
	for _, v90 in ipairs(game.Players:GetPlayers()) do
		for _, v91 in pairs(game.Workspace:GetDescendants()) do
			pcall(function()
				firetouchinterest(v90.Character.HumanoidRootPart, v91, 0)
			end)
		end
	end
end);
v72:Button("Floppa Crash 2", function()
	local c = coroutine.create(function()
		while true do
			for _, ply in pairs(game.Players:GetPlayers()) do
				for _, itm in pairs(game.Workspace:GetDescendants()) do
					pcall(function()
						if ply.Character and ply.Character:FindFirstChild("HumanoidRootPart") and itm:IsA("BasePart") then
							firetouchinterest(ply.Character.HumanoidRootPart, itm, 0)
						end
					end)
				end
			end
			game:GetService("RunService").Stepped:Wait()
		end
	end)
	coroutine.resume(c)
end);
v72:Button("Fake Crash", function()
	local c = coroutine.create(function()
		while true do
			for i=1,100 do
				wait()
				game:GetService("Players").LocalPlayer.Character.Humanoid.Jump = true
			end
			wait(20)
		end
	end)
	coroutine.resume(c)
end);
v72:Label("Embeded GUI (Lua By Rewired)");
v72:Seperator("Misc");
v72:Toggle("Anti AFK", _G.AntiAfk, function(v94)
	_G.AntiAfk = v94;
end);
spawn(function()
	while task.wait() do
		if _G.AntiAfk then
			pcall(function()
				game:GetService("VirtualUser"):CaptureController();
				game:GetService("VirtualUser"):ClickButton1(Vector2.new(0,0), game:GetService("workspace"))
			end)
		end
	end
end);
v72:Button("Rejoin Game", function()
	game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer);
end);
v72:Button("Serverhop Game", function()
	local HttpService = game:GetService("HttpService");
	local Servers = HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/'.. game.PlaceId .. '/servers/Public?sortOrder=Desc&limit=100'))
	for _,Server in pairs(Servers.data) do
		if Server.playing < Server.maxPlayers then
			game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, Server.id, game:GetService("Players").LocalPlayer)
		end
	end
end);
v72:Button("Copy Server ID", function()
	setclipboard(game.JobId);
end);
v72:Button("Left Shift Inf. Sprint", function()
	local s = game.Players.LocalPlayer.Character.Humanoid
	while task.wait(0.01) do
		if s.MoveDirection.Magnitude > 0 then
			game:GetService("VirtualInputManager"):SendKeyEvent(true, "LeftControl", false, game)
			game:GetService("VirtualInputManager"):SendKeyEvent(true, "LeftShift", false, game)
			game:GetService("VirtualInputManager"):SendKeyEvent(false, "LeftShift", false, game)
			game:GetService("VirtualInputManager"):SendKeyEvent(false, "LeftControl", false, game)
		end
	end
end);
v72:Seperator("Combat Extras");
v72:Toggle("OneTap", _G.OneTap, function(v95)
	_G.OneTap = v95;
end);
spawn(function()
	while task.wait() do
		if _G.OneTap then
			local enemy = game.Players.LocalPlayer:GetMouse().Target
			if enemy and enemy.Parent and enemy.Parent.Parent.Name == "Enemies" then
				game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
				module:attack()
			end
		end
	end
end);
v72:Toggle("Auto E", _G.UseSkill, function(v96)
	_G.UseSkill = v96;
end);
spawn(function()
	while task.wait(0.1) do
		if UseSkill then
			pcall(function()
				CheckQuest();
				for _, enemy in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
					local PosMonMasteryFruit = enemy:FindFirstChild("HumanoidRootPart")
					if PosMonMasteryFruit then
						local MasBF = 0;
						if game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool") and game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name == game:GetService("Players").LocalPlayer.Data.DevilFruit.Value then
							MasBF = game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name
						elseif game:GetService("Players").LocalPlayer.Backpack:FindFirstChildOfClass("Tool") and game:GetService("Players").LocalPlayer.Backpack:FindFirstChildOfClass("Tool").Name == game:GetService("Players").LocalPlayer.Data.DevilFruit.Value then
							MasBF = game:GetService("Players").LocalPlayer.Backpack:FindFirstChildOfClass("Tool").Name
						end
						if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dragon-Dragon") then
							if _G.SkillZ then
								local v2360 = {
									[1] = PosMonMasteryFruit.Position
								};
								game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(v2360));
								game:GetService("VirtualInputManager"):SendKeyEvent(true, "Z", false, game);
								game:GetService("VirtualInputManager"):SendKeyEvent(false, "Z", false, game);
							end
							if _G.SkillX then
								local v2361 = {
									[1] = PosMonMasteryFruit.Position
								};
								game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(v2361));
								game:GetService("VirtualInputManager"):SendKeyEvent(true, "X", false, game);
								game:GetService("VirtualInputManager"):SendKeyEvent(false, "X", false, game);
							end
							if _G.SkillC then
								local v2362 = {
									[1] = PosMonMasteryFruit.Position
								};
								game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(v2362));
								game:GetService("VirtualInputManager"):SendKeyEvent(true, "C", false, game);
								wait(2);
								game:GetService("VirtualInputManager"):SendKeyEvent(false, "C", false, game);
							end
						elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("Venom-Venom") then
							if _G.SkillZ then
								local v2605 = {
									[1] = PosMonMasteryFruit.Position
								};
								game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(v2605));
								game:GetService("VirtualInputManager"):SendKeyEvent(true, "Z", false, game);
								game:GetService("VirtualInputManager"):SendKeyEvent(false, "Z", false, game);
							end
							if _G.SkillX then
								local v2606 = {
									[1] = PosMonMasteryFruit.Position
								};
								game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(v2606));
								game:GetService("VirtualInputManager"):SendKeyEvent(true, "X", false, game);
								game:GetService("VirtualInputManager"):SendKeyEvent(false, "X", false, game);
							end
							if _G.SkillC then
								local v2607 = {
									[1] = PosMonMasteryFruit.Position
								};
								game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(v2607));
								game:GetService("VirtualInputManager"):SendKeyEvent(true, "C", false, game);
								wait(2);
								game:GetService("VirtualInputManager"):SendKeyEvent(false, "C", false, game);
							end
						elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("Sand-Sand") then
							if _G.SkillZ then
								local v2700 = {
									[1] = PosMonMasteryFruit.Position
								};
								game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(v2700));
								game:GetService("VirtualInputManager"):SendKeyEvent(true, "Z", false, game);
								game:GetService("VirtualInputManager"):SendKeyEvent(false, "Z", false, game);
							end
							if _G.SkillX then
								local v2701 = {
									[1] = PosMonMasteryFruit.Position
								};
								game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(v2701));
								game:GetService("VirtualInputManager"):SendKeyEvent(true, "X", false, game);
								game:GetService("VirtualInputManager"):SendKeyEvent(false, "X", false, game);
							end
							if _G.SkillC then
								local v2702 = {
									[1] = PosMonMasteryFruit.Position
								};
								game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(v2702));
								game:GetService("VirtualInputManager"):SendKeyEvent(true, "C", false, game);
								wait(2);
								game:GetService("VirtualInputManager"):SendKeyEvent(false, "C", false, game);
							end
						elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild("Smoke-Smoke") then
							if _G.SkillZ then
								local v2872 = {
									[1] = PosMonMasteryFruit.Position
								};
								game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(v2872));
								game:GetService("VirtualInputManager"):SendKeyEvent(true, "Z", false, game);
								game:GetService("VirtualInputManager"):SendKeyEvent(false, "Z", false, game);
							end
							if _G.SkillX then
								local v2873 = {
									[1] = PosMonMasteryFruit.Position
								};
								game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(v2873));
								game:GetService("VirtualInputManager"):SendKeyEvent(true, "X", false, game);
								game:GetService("VirtualInputManager"):SendKeyEvent(false, "X", false, game);
							end
							if _G.SkillC then
								local v2874 = {
									[1] = PosMonMasteryFruit.Position
								};
								game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(v2874));
								game:GetService("VirtualInputManager"):SendKeyEvent(true, "C", false, game);
								game:GetService("VirtualInputManager"):SendKeyEvent(false, "C", false, game);
							end
							if _G.SkillV then
								local v2875 = {
									[1] = PosMonMasteryFruit.Position
								};
								game:GetService("Players").LocalPlayer.Character[game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteEvent:FireServer(unpack(v2875));
							end
						end
					end
				end
			end)
		end
	end
end);
v72:Seperator("Render");
v72:Toggle("Fullbright", false, function(v100)
	_G.FullBright = v100;
	while wait() do
		if _G.FullBright then
			game:GetService("Lighting").Brightness = 2;
			game:GetService("Lighting").FogEnd = 999999;
			game:GetService("Lighting").ClockTime = 5;
		end
	end
end);
v72:Toggle("Shadows Off", false, function(v101)
	_G.NoShadows = v101;
	while wait() do
		if _G.NoShadows then
			game:GetService("Lighting").GlobalShadows = false;
			game:GetService("Lighting").Brightness = 3;
		end
	end
end);
v72:Toggle("Fake Time", _G.FakeTime, function(v102)
	_G.FakeTime = v102;
	while wait() do
		if _G.FakeTime then
			game:GetService("Lighting").TimeOfDay = 12.0;
		end
	end
end);
v72:Button("RejoinScript", function()
	loadstring(game:HttpGet("https://pastebin.com/raw/uaA6CW5w"))()
end);
v72:Button("MobSynx Cooldowns", function()
	loadstring(game:HttpGet("https://pastebin.com/raw/xzFVy20S"))()
end);
v72:Button("NoFall Damage", function()
	game.Players.LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
	game.Players.LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall, false)
end);
v72:Button("Full Bright (Pseudo)", function()
	game:GetService("Lighting").Brightness = 3
	game:GetService("Lighting").ClockTime = 12
	game:GetService("Lighting").FogEnd = 999999
end);
v72:Button("Clear Effects", function()
	for _,v1792 in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
		if v1792:IsA("ParticleEmitter") then
			v1792:Destroy()
		end
	end
end);
v72:Button("Death Effects", function()
	game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(game:GetObjects("rbxassetid://5458812983")[1]):Play()
end);
v72:Button("Teleport to Blue Log", function()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(200, 200, 200)
end);
v72:Button("Copy Gun Slot ID", function()
	local guns = {}
	for i,v in ipairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
		table.insert(guns, v.Name)
	end
	setclipboard(game.Players.LocalPlayer.Backpack:FindFirstChildOfClass("Tool").Name)
end);
v72:Button("Delete All Inventory", function()
	for _, v382 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
		v382:Destroy()
	end
	for _, v384 in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
		if v384:IsA("Tool") then
			v384:Destroy()
		end
	end
end);
v72:Button("Last Gun (God)", function()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2000,2000,2000)
end);
v72:Label("CheemsX");
v72:Seperator("Utilities");
v72:Button("AntiKick Eject", function()
	local Metatable = getrawmetatable(game)
	local Original = Metatable.__namecall
	setreadonly(Metatable, false)
	Metatable.__namecall = newcclosure(function(self, ...)
		local args = {...}
		local method = getnamecallmethod()
		if method == "Kick" or method == "kick" then
			return nil
		end
		return Original(self, ...)
	end)
end);
v72:Seperator("Finish");  
spawn(function()
	local v1521;
	while  not v1521 do
		v1521 = game:GetService("Workspace").Map:FindFirstChild("KitsuneIsland");
		wait(1);
	end
	while task.wait() do
		if _G.tpkit then
			local v1837 = v1521:FindFirstChild("ShrineActive");
			if v1837 then
				for _, v1840 in pairs(v1837:GetChildren()) do
					if (v1840:IsA("SpawnLocation") and (not v1840.CanCollide)) then
						v1840.CanCollide = true;
					end
					if (v1840:IsA("BasePart") and _G.tpkit) then
						firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v1840, 0)
						firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v1840, 1)
					end
				end
			end
		end
	end
end);
spawn(function()
	while wait() do
		if setscriptable then
			setscriptable(game.Players.LocalPlayer, "SimulationRadius", true);
		end
		if sethiddenproperty then
			sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge);
		end
	end
end);
spawn(function()
	local v1522;
	while  not v1522 do
		local v1907 = workspace:FindFirstChild("Packman")
		v1522 = v1907 or game:GetService("Workspace").Map:FindFirstChild("Maze")
		wait(1);
	end
	while task.wait() do
		if _G.tpMaze then
			local v1908 = game:GetService("Workspace").Packman.Packman.Maze:FindFirstChild("DeadEnds");
			if v1908 then
				local rads = math.rad
				local phi = (1+math.sqrt(5))/2
				for _, nodes in pairs(v1908:GetDescendants()) do
					if nodes.Name == "Ground" then
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = nodes.CFrame
						break;
					end
				end
			end
		end
	end
end);
v72:Button("Delete GUI (Title)", function()
	game:GetService("StarterGui"):SetCore("SendNotification", {Title="Title:CheemsHub Loaded"; Text="gg Reload?"})
end);
v72:Toggle("Crystal Aura", _G.CryAura, function(v538)
	_G.CryAura = v538;
end);
spawn(function()
	while wait() do
		if _G.CryAura then
			for _, v538 in pairs(game.Workspace:GetDescendants()) do
				pcall(function()
					if ((v538.Name == "GoldCoin") and v538:IsA("BasePart")) then
						v538.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame;
					end
				end);
			end
		end
	end
end);
spawn(function()
	while wait() do
		if _G.CryAura and game:GetService("Players").LocalPlayer.Character.PrimaryPart then
			for _, v538 in pairs(game.Workspace.Map:GetDescendants()) do
				if (v538.Name == "BeliDrop") then
					v538.CFrame = game.Players.LocalPlayer.Character.PrimaryPart.CFrame;
				end
			end
		end
	end
end);
spawn(function()
	while wait() do
		if _G.CryAura then
			for _, v538 in pairs(game:GetService("Workspace").DroppedItems:GetDescendants()) do
				if (v538.Name == "Beli") then
					v538.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame;
				end
			end
		end
	end
end);
spawn(function()
	while wait() do
		if _G.CryAura then
			for _, v538 in pairs(game:GetService("Workspace").DroppedItems:GetDescendants()) do
				if (v538.Name == "BeliP") then
					v538.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame;
				end
			end
		end
	end
end);
spawn(function()
	while wait() do
		if _G.CryAura then
			for _, v538 in pairs(game:GetService("Workspace").DroppedItems:GetDescendants()) do
				if (v538.Name == "SwordPart") then
					v538.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame;
				end
			end
		end
	end
end);
spawn(function()
	local v1523 = game:GetService("Players").LocalPlayer
	local v1524 = game.Players.LocalPlayer.Character
	while wait() do
		if _G.CryAura then
			if v1524 and v1524:FindFirstChild("HumanoidRootPart") then
				local _ = require(game:GetService("ReplicatedStorage").Effect.Container.Vanish)
				_:FireServer()
			end
		end
	end
end);
v72:Button("Remove Fog", function()
	RemoveFog = true
	local FogScript = v72
	FogScript = FogScript:Toggle("Remove Fog", RemoveFog, function(v521)
		RemoveFog = v521;
	end);
end);
spawn(function()
	if not RemoveFog then
		return;
	end
	while RemoveFog do
		wait();
		game.Lighting.FogEnd = 8999999488;
		if not RemoveFog then
			game.Lighting.FogEnd = 2500;
		end
	end
end);
v72:Toggle("Infinite Range", _G.InfiniteObRange, function(v519)
	getgenv().InfiniteObRange = v519;
end);
spawn(function()
	if not getgenv().InfiniteObRange then
		return;
	end
	while getgenv().InfiniteObRange do
		wait();
		local player = game:GetService("Players").LocalPlayer
		local char = player.Character
		local v875 = player.VisionRadius
		if player then
			if (char.Humanoid.Health <= 0) then
				wait(5);
			end
			v875.Value = math.huge;
		elseif ((getgenv().InfiniteObRange == false) and player) then
			v875.Value = v521;
		end
	end
end);
v72:Toggle("Auto Buy Abilities", false, function(v571)
	Abilities = v571;
	while Abilities do
		wait(0.1);
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki", "Geppo");
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki", "Buso");
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki", "Soru");
	end
end);
v72:Seperator("Fighting Style");
v72:Button("Buy Black Leg [ 150,000 Beli ]", function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBlackLeg");
end);
v72:Button("Buy Electro [ 550,000 Beli ]", function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectro");
end);
v72:Button("Buy Superhuman [ 850,000 Beli ]", function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman");
end);
v72:Button("Buy Dragon Claw [ 800,000 Beli ]", function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonClaw");
end);
v72:Button("Buy Fishman Karate [ 800,000 Beli ]", function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyFishmanKarate");
end);
v72:Button("Buy Spider [ 800,000 Beli ]", function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySpider");
end);
v72:Button("Buy Godhand [ 800,000 Beli ]", function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyGodhand");
end);
v72:Button("Buy Sharkman Karate [ 800,000 Beli ]", function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate");
end);
v72:Button("Buy Superhuman II [ 2,000,000 Beli ]", function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman2");
end);
v72:Button("Buy Champion [ 2,000,000 Beli ]", function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyChampion");
end);
v72:Button("Buy Fist [ 2,000,000 Beli ]", function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyFist");
end);
v72:Button("Buy Death Step [ 1,200,000 Beli ]", function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep");
end);
v72:Button("Buy Jutte [ 2,000,000 Beli ]", function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyJutte");
end);
v72:Button("Buy Electro II [ 2,000,000 Beli ]", function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectro2");
end);
v72:Button("Buy Spider II [ 2,000,000 Beli ]", function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySpider2");
end);
v72:Button("Buy Godhand II [ 2,000,000 Beli ]", function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyGodhand2");
end);
v72:Seperator("Misc");
v72:Toggle("AutoGiveUP", _G.AutoGiveUP, function(v597)
	_G.AutoGiveUP = v597;
end);
spawn(function()
	while wait() do
		if _G.AutoGiveUP then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0,0,0)
		end
	end
end);
v72:Toggle("AutoBuyItem", false, function(v524)
	_G.AutoBuyItem = v524;
	while _G.AutoBuyItem do
		wait();
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Chilly Bar")
	end
end);
v72:Seperator("Debug");
v72:Toggle("Anti Sunburn", _G.NoSunBurn, function(v555)
	_G.NoSunBurn = v555;
end);
spawn(function()
	while wait() do
		if _G.NoSunBurn then
			game.Players.LocalPlayer.Character.BodyEffects.SunDamage:Destroy();
		end
	end
end);
v72:Toggle("NoSlide", _G.NoSlide, function(v556)
	_G.NoSlide = v556
end)

spawn(function()
	while task.wait(0.2) do
		if _G.NoSlide then
		end
	end
end)

v72:Button("Reset Character", function()
	game.Players.LocalPlayer.Character.Humanoid.Health = 0
end);
v72:Button("Destroy CamGlitch", function()
	for _, part in pairs(workspace.Map:GetDescendants()) do
		if part.Name == "CamGlitchTrigger" then
			part:Destroy()
		end
	end
end);
v72:Button("Character Anti Break", function()
	for _, part in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
		if (part:IsA("BasePart")) then
			part.Anchored = false
			part.CanCollide = false
		end
	end
end);
v72:Toggle("Anti Stun", _G.UnStun, function(v601)
	_G.UnStun = v601;
end);
spawn(function()
	while wait() do
		if _G.UnStun then
			for _, part in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
				if (part:IsA("BasePart")) then
					part:DestroyJoint()
				end
			end
		end
	end
end);
v72:Toggle("AutoGiveUP Shops", _G.CheapShops, function(v602)
	_G.CheapShops = v602;
end);
spawn(function()
	while wait() do
		if _G.CheapShops then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 0, 0)
		end
	end
end);
v72:Seperator("Credits")
v72:Label("You use it")




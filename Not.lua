local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")

local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "BHK2MamboUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = (RunService:IsStudio() and LocalPlayer:WaitForChild("PlayerGui") or CoreGui)

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 220, 0, 160)
MainFrame.Position = UDim2.new(0.5, -110, 0.4, -80)
MainFrame.BackgroundColor3 = Color3.fromRGB(24, 24, 28)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 10)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(50, 50, 60)
MainStroke.Thickness = 1
MainStroke.Parent = MainFrame

local TitleFrame = Instance.new("Frame")
TitleFrame.Size = UDim2.new(1, 0, 0, 35)
TitleFrame.BackgroundTransparency = 1
TitleFrame.Parent = MainFrame

local Icon = Instance.new("ImageLabel")
Icon.Size = UDim2.new(0, 22, 0, 22)
Icon.Position = UDim2.new(0, 10, 0, 6.5)
Icon.BackgroundTransparency = 1
local success, assetId = pcall(function()
	return getcustomasset("Minecraft_Hub_102983920101983883039939393029201027.png")
end)
if success and assetId then
	Icon.Image = assetId
end
Icon.Parent = TitleFrame

local TitleText = Instance.new("TextLabel")
TitleText.Size = UDim2.new(1, -40, 1, 0)
TitleText.Position = UDim2.new(0, 38, 0, 0)
TitleText.BackgroundTransparency = 1
TitleText.Text = "BHK2 Mambo"
TitleText.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleText.TextSize = 14
TitleText.Font = Enum.Font.GothamBold
TitleText.TextXAlignment = Enum.TextXAlignment.Left
TitleText.Parent = TitleFrame

local Container = Instance.new("Frame")
Container.Size = UDim2.new(1, -20, 1, -45)
Container.Position = UDim2.new(0, 10, 0, 38)
Container.BackgroundTransparency = 1
Container.Parent = MainFrame

local UIList = Instance.new("UIListLayout")
UIList.SortOrder = Enum.SortOrder.LayoutOrder
UIList.Padding = UDim.new(0, 8)
UIList.Parent = Container

local LockState = false
local ESPState = false

local FloatingBtnGui = Instance.new("ScreenGui")
FloatingBtnGui.Name = "BHK2FloatingBtn"
FloatingBtnGui.ResetOnSpawn = false
FloatingBtnGui.Enabled = false
FloatingBtnGui.Parent = (RunService:IsStudio() and LocalPlayer:WaitForChild("PlayerGui") or CoreGui)

local FloatBtn = Instance.new("TextButton")
FloatBtn.Size = UDim2.new(0, 70, 0, 70)
FloatBtn.Position = UDim2.new(0.85, 0, 0.7, 0)
FloatBtn.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
FloatBtn.Text = "ยิง"
FloatBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
FloatBtn.TextSize = 18
FloatBtn.Font = Enum.Font.GothamBold
FloatBtn.Parent = FloatingBtnGui

local FloatCorner = Instance.new("UICorner")
FloatCorner.CornerRadius = UDim.new(1, 0)
FloatCorner.Parent = FloatBtn

local FloatStroke = Instance.new("UIStroke")
FloatStroke.Color = Color3.fromRGB(255, 255, 255)
FloatStroke.Thickness = 2
FloatStroke.Parent = FloatBtn

local Highlights = {}

local function CreateToggle(name, callback)
	local ToggleFrame = Instance.new("Frame")
	ToggleFrame.Size = UDim2.new(1, 0, 0, 32)
	ToggleFrame.BackgroundColor3 = Color3.fromRGB(32, 32, 38)
	ToggleFrame.BorderSizePixel = 0
	ToggleFrame.Parent = Container

	local ToggleCorner = Instance.new("UICorner")
	ToggleCorner.CornerRadius = UDim.new(0, 6)
	ToggleCorner.Parent = ToggleFrame

	local ToggleText = Instance.new("TextLabel")
	ToggleText.Size = UDim2.new(1, -50, 1, 0)
	ToggleText.Position = UDim2.new(0, 12, 0, 0)
	ToggleText.BackgroundTransparency = 1
	ToggleText.Text = name
	ToggleText.TextColor3 = Color3.fromRGB(220, 220, 220)
	ToggleText.TextSize = 13
	ToggleText.Font = Enum.Font.Gotham
	ToggleText.TextXAlignment = Enum.TextXAlignment.Left
	ToggleText.Parent = ToggleFrame

	local ToggleBtn = Instance.new("TextButton")
	ToggleBtn.Size = UDim2.new(0, 40, 0, 20)
	ToggleBtn.Position = UDim2.new(1, -48, 0.5, -10)
	ToggleBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
	ToggleBtn.Text = ""
	ToggleBtn.Parent = ToggleFrame

	local ToggleBtnCorner = Instance.new("UICorner")
	ToggleBtnCorner.CornerRadius = UDim.new(1, 0)
	ToggleBtnCorner.Parent = ToggleBtn

	local Circle = Instance.new("Frame")
	Circle.Size = UDim2.new(0, 16, 0, 16)
	Circle.Position = UDim2.new(0, 2, 0.5, -8)
	Circle.BackgroundColor3 = Color3.fromRGB(180, 180, 190)
	Circle.BorderSizePixel = 0
	Circle.Parent = ToggleBtn

	local CircleCorner = Instance.new("UICorner")
	CircleCorner.CornerRadius = UDim.new(1, 0)
	CircleCorner.Parent = Circle

	local state = false
	ToggleBtn.MouseButton1Click:Connect(function()
		state = not state
		if state then
			ToggleBtn.BackgroundColor3 = Color3.fromRGB(50, 180, 80)
			Circle:TweenPosition(UDim2.new(1, -18, 0.5, -8), "Out", "Quad", 0.15, true)
			Circle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		else
			ToggleBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
			Circle:TweenPosition(UDim2.new(0, 2, 0.5, -8), "Out", "Quad", 0.15, true)
			Circle.BackgroundColor3 = Color3.fromRGB(180, 180, 190)
		end
		callback(state)
	end)
end

local function IsEnemy(player)
	if not player.Team or not LocalPlayer.Team then
		return true
	end
	return player.Team \~= LocalPlayer.Team
end

local function ClearESP()
	for player, hl in pairs(Highlights) do
		if hl then
			hl:Destroy()
		end
	end
	Highlights = {}
end

local function GetClosestEnemyHead()
	local closestHead = nil
	local shortestDistance = math.huge
	local myChar = LocalPlayer.Character
	if not myChar or not myChar:FindFirstChild("HumanoidRootPart") then
		return nil
	end
	local myPos = myChar.HumanoidRootPart.Position

	for _, player in pairs(Players:GetPlayers()) do
		if IsEnemy(player) and player.Character and player.Character:FindFirstChild("Head") and player.Character:FindFirstChildOfClass("Humanoid") then
			if player.Character.Humanoid.Health > 0 then
				local head = player.Character.Head
				local dist = (head.Position - myPos).Magnitude
				if dist < shortestDistance then
					shortestDistance = dist
					closestHead = head
				end
			end
		end
	end
	return closestHead
end

CreateToggle("ล็อคเป้า", function(state)
	LockState = state
	FloatingBtnGui.Enabled = state
end)

FloatBtn.MouseButton1Click:Connect(function()
	if not LockState then return end
	local targetHead = GetClosestEnemyHead()
	local myChar = LocalPlayer.Character
	if targetHead and myChar and myChar:FindFirstChild("HumanoidRootPart") then
		local myPos = myChar.HumanoidRootPart.Position
		local dir = (targetHead.Position - myPos).Unit
		local bulletPos = myPos + (dir * 0.5)

		local weapon = myChar:FindFirstChild("Laser Blue") or LocalPlayer.Backpack:FindFirstChild("Laser Blue")
		if weapon and weapon:FindFirstChild("FireWeapon") then
			local args = {
				vector.create(bulletPos.X, bulletPos.Y, bulletPos.Z),
				vector.create(dir.X, dir.Y, dir.Z)
			}
			weapon.FireWeapon:FireServer(unpack(args))
		end
	end
end)

CreateToggle("มองทะลุ", function(state)
	ESPState = state
	if not state then
		ClearESP()
	end
end)

RunService.RenderStepped:Connect(function()
	if not ESPState then return end

	for _, player in pairs(Players:GetPlayers()) do
		if player \~= LocalPlayer and player.Character then
			local char = player.Character
			local hl = Highlights[player]

			if not hl or hl.Parent \~= char then
				if hl then hl:Destroy() end
				hl = Instance.new("Highlight")
				hl.Adornee = char
				hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
				hl.FillTransparency = 0.5
				hl.OutlineTransparency = 0
				hl.Parent = char
				Highlights[player] = hl
			end

			local isEnemy = IsEnemy(player)
			if isEnemy then
				hl.FillColor = Color3.fromRGB(255, 50, 50)
				hl.OutlineColor = Color3.fromRGB(255, 255, 255)
			else
				hl.FillColor = Color3.fromRGB(50, 150, 255)
				hl.OutlineColor = Color3.fromRGB(255, 255, 255)
			end
		end
	end

	for player, hl in pairs(Highlights) do
		if not Players:FindFirstChild(player.Name) or not player.Character then
			hl:Destroy()
			Highlights[player] = nil
		end
	end
end)

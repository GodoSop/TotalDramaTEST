--This script is open source for all <3 if you want to check how it works feel fee to do so. Im using Rayfield UI library.
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Disable-adonis-anti-cheat-19754"))()

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Godo Hub",
   Icon = 0,
   LoadingTitle = "GodoHub",
   LoadingSubtitle = "by GodoSop",
   Theme = "Default",
   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false,
   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil,
      FileName = "Big Hub"
   },
   Discord = {
      Enabled = false,
      Invite = "noinvitelink",
      RememberJoins = true
   },
   KeySystem = false,
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided",
      FileName = "Key",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = {"Hello"}
   }
})

local MainTab = Window:CreateTab("Main", nil)
local Section = MainTab:CreateSection("Basic Features")

local WinButton = MainTab:CreateButton({
   Name = "Win Obby",
   Callback = function()
      local WinPart = workspace.Assets:GetChildren()
      local Player = workspace:WaitForChild(tostring(game.Players.LocalPlayer)):WaitForChild("HumanoidRootPart")
      local finishPart = nil
      local assetsFolder = game.Workspace.Assets

      for _, item in pairs(assetsFolder:GetDescendants()) do
         if item:IsA("Part") and item.Name == "Finish" then
            finishPart = item
            break
         end
      end

      repeat wait() until game.Players.LocalPlayer.PlayerGui.Game.Background.MainText.Text == "GO!"
      Player.CFrame = CFrame.new(finishPart.Position)
   end,
})

local SafetyButton = MainTab:CreateButton({
   Name = "Find Bag and Statue(Doesnt always spawn)",
   Callback = function()
      local player = game.Players.LocalPlayer
      local timerGui = player:WaitForChild("PlayerGui"):WaitForChild("Timer")

      timerGui.AncestryChanged:Connect(function(_, parent)
         if parent == nil then
            local SafetyStatue = workspace.Idols:WaitForChild("SafetyStatue", 100)
            local Bag = workspace.Idols:WaitForChild("Bag", 100)
            local startingpos = workspace:WaitForChild(tostring(player)).HumanoidRootPart.CFrame

            -- Move the models using their PrimaryPart
            if SafetyStatue.PrimaryPart then
               SafetyStatue:SetPrimaryPartCFrame(startingpos)
            end
            if Bag.PrimaryPart then
               Bag:SetPrimaryPartCFrame(startingpos)
            end
         end
      end)

      local function setHitAsPrimary(model)
         local hitPart = model:FindFirstChild("hit", true)
         if hitPart and hitPart:IsA("BasePart") then
            model.PrimaryPart = hitPart
            return true
         else
            return false
         end
      end

      local character = player.Character or player.CharacterAdded:Wait()
      local hrp = character:WaitForChild("HumanoidRootPart")

      local idols = workspace:WaitForChild("Idols")
      local bag = idols:WaitForChild("Bag")
      local statue = idols:WaitForChild("SafetyStatue")

      if setHitAsPrimary(bag) then
         bag:SetPrimaryPartCFrame(hrp.CFrame * CFrame.new(3, 0, 0))
      end

      if setHitAsPrimary(statue) then
         statue:SetPrimaryPartCFrame(hrp.CFrame * CFrame.new(-3, 0, 0))
      end
   end,
})

local MathMania = MainTab:CreateButton({
   Name = "Math Mania Answers",
   Callback = function()
	wait(3)
   	for i = 1, 10 do
	Rayfield:Notify({
   Title = "Math Mania Answer",
   Content = tostring(workspace.Assets["Math Mania"].Questions[i].answer.Value),
   Duration = 4,
   Image = nil,
})
		wait(2.5)
	end
   end,
})

local ComebackFemale = MainTab:CreateButton({
   Name = "Come back into the game(Female)",
   Callback = function()
   local args = {
	"Gender",
	"Female"
}
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Buy"):FireServer(unpack(args))
   end,
})

local ComebackMale = MainTab:CreateButton({
   Name = "Come back into the game(Male)",
   Callback = function()
   local args = {
	"Gender",
	"Male"
}
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Buy"):FireServer(unpack(args))
   end,
})

local BecomeCharacter = MainTab:CreateInput({
   Name = "Become any character",
   CurrentValue = "",
   PlaceholderText = "Character",
   RemoveTextAfterFocusLost = false,
   Flag = "Input1",
   Callback = function(Text)
      local args = {
         [1] = "Character",
         [2] = Text
      }

      game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Buy"):FireServer(unpack(args))
   end,
})

local ChangeConffesional = MainTab:CreateInput({
   Name = "Change Conffesional",
   CurrentValue = "",
   PlaceholderText = "Desired text here",
   RemoveTextAfterFocusLost = false,
   Flag = "Input1",
   Callback = function(Text)
   local args = {
	Text
}
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Confessional"):FireServer(unpack(args))

   end,
})

local FakeWin1 = MainTab:CreateButton({
   Name = "Fake Win Team 1",
   Callback = function()
local folder = workspace.Assets
local part = nil

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

for _, obj in ipairs(folder:GetDescendants()) do
if obj:IsA("BasePart") and obj.Name == "Team1Finish" then
	part = obj
	end
end
			
humanoidRootPart.CFrame = part.CFrame
   end,
})

local FakeWin2 = MainTab:CreateButton({
   Name = "Fake Win Team 2",
   Callback = function()
local folder = workspace.Assets
local part = nil

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

for _, obj in ipairs(folder:GetDescendants()) do
if obj:IsA("BasePart") and obj.Name == "Team2Finish" then
	part = obj
	end
end
			
humanoidRootPart.CFrame = part.CFrame
   end,
})

local FakeWin3 = MainTab:CreateButton({
   Name = "Fake Win Team 3",
   Callback = function()
local folder = workspace.Assets
local part = nil

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

for _, obj in ipairs(folder:GetDescendants()) do
if obj:IsA("BasePart") and obj.Name == "Team3Finish" then
	part = obj
	end
end
			
humanoidRootPart.CFrame = part.CFrame
   end,
})

local PlayerTab = Window:CreateTab("Player", nil)
local PlayerSettings = PlayerTab:CreateSection("Player Settings")

local PlayerSpeed = PlayerTab:CreateInput({
   Name = "Player Speed",
   CurrentValue = "",
   PlaceholderText = "Speed",
   RemoveTextAfterFocusLost = false,
   Flag = "Input1",
   Callback = function(Text)
	local Player = game:GetService("Players").LocalPlayer
	local character = Player.Character or Player.CharacterAdded:Wait()
	local HumanoidRootPart = character:WaitForChild("HumanoidRootPart")
	
	local Humanoid =  character:WaitForChild("Humanoid")
	if Humanoid then
	Humanoid.WalkSpeed = Text
	end
   end,
})

local PlayerJump = PlayerTab:CreateInput({
   Name = "Player Jump Power",
   CurrentValue = "",
   PlaceholderText = "Jump Power",
   RemoveTextAfterFocusLost = false,
   Flag = "Input1",
   Callback = function(Text)
	local Player = game:GetService("Players").LocalPlayer
	local character = Player.Character or Player.CharacterAdded:Wait()
	local HumanoidRootPart = character:WaitForChild("HumanoidRootPart")
 
	local Humanoid =  character:WaitForChild("Humanoid")
	if Humanoid then
	Humanoid.JumpPower = Text
	end
   end,
})

local LongName = PlayerTab:CreateInput({
   Name = "Long Glitch Name",
   CurrentValue = "",
   PlaceholderText = "Character",
   RemoveTextAfterFocusLost = false,
   Flag = "Input1",
   Callback = function(Text)
local longString = "​"

for i = 1, 21 do
longString = longString .. longString
end

local FinalText = Text .. longString
			
      local args = {
         [1] = "Character",
         [2] = FinalText
      }

      game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Buy"):FireServer(unpack(args))
   end,
})

local RevealStatue = PlayerTab:CreateButton({
   Name = "Reveal Who Has Statue",
   Callback = function()
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local owner = ReplicatedStorage.Season.Twists.Idol.Value
local players = ReplicatedStorage.Season.Players:GetChildren()
local foundPlayer = nil
for _, player in pairs(players) do
    if player.Name == owner then
        foundPlayer = player
        break
    end
end
if foundPlayer then
    Rayfield:Notify({
   Title = "Statue",
   Content = foundPlayer.Value .. " Has the statue",
   Duration = 3,
   Image = nil,
})
else
    Rayfield:Notify({
   Title = "Statue",
   Content = "Nobody has the statue",
   Duration = 3,
   Image = nil,
})
end
   end,
})

local PrintVotes = PlayerTab:CreateButton({
   Name = "Print Votes",
   Callback = function()
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local input = ReplicatedStorage.GuiTexts.Votes.Value
local output = ""

for name, voted in string.gmatch(input, "(%w+)%((%w+)%)") do
	output = output .. name .. " voted " .. voted .. "\n"
end

output = output:sub(1, -2)

Rayfield:Notify({
   Title = "Voting",
   Content = output,
   Duration = 8,
   Image = nil,
})
   end,
})

local TPTab = Window:CreateTab("Teleports", nil) -- Title, Image
local Section = TPTab:CreateSection("Main Teleports")

local SpawnButton = TPTab:CreateButton({
   Name = "Spawn",
   Callback = function()
local part = workspace.SpawnLocation

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

humanoidRootPart.CFrame = part.CFrame
   end,
})

local ExileButton = TPTab:CreateButton({
   Name = "Exile (camp)",
   Callback = function()
local part = workspace.Map:FindFirstChild("Roblox Drama: Camp").Game.Cave.MeshPart

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

humanoidRootPart.CFrame = part.CFrame
   end,
})

local CabinsButton = TPTab:CreateButton({
   Name = "Cabins (camp)",
   Callback = function()
local part = workspace.Map:FindFirstChild("Roblox Drama: Camp").Game.Path:FindFirstChild("Stepping Stones"):FindFirstChild("MeshPart")

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

humanoidRootPart.CFrame = part.CFrame
   end,
})

local ExtraTab = Window:CreateTab("Extra", nil)
local ExtraScripts = ExtraTab:CreateSection("Extra Scripts")

local InfiniteYield = ExtraTab:CreateButton({
   Name = "Infinite Yield",
   Callback = function()
   	loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
   end,
})

local EnergizeFE = ExtraTab:CreateButton({
   Name = "Energize FE",
   Callback = function()
   	loadstring(game:HttpGet("https://rawscripts.net/raw/a-literal-baseplate.-energize-gui-24798"))()
   end,
})

local FakeLag = ExtraTab:CreateButton({
   Name = "Fake Lag",
   Callback = function()
   	local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Frame_2 = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local TextButton = Instance.new("TextButton")

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false

print("If you see this, the script worked!")

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.388539821, 0, 0.427821517, 0)
Frame.Size = UDim2.new(0, 158, 0, 100) -- Reduced height since we removed a button

Frame_2.Parent = Frame
Frame_2.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Frame_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame_2.BorderSizePixel = 0
Frame_2.Size = UDim2.new(0, 158, 0, 25)

TextLabel.Parent = Frame_2
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0.112792775, 0, -0.0151660154, 0)
TextLabel.Size = UDim2.new(0, 121, 0, 26)
TextLabel.Font = Enum.Font.Sarpanch
TextLabel.Text = "Fake Lag by SillyNooby"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextSize = 16.000

TextButton.Parent = Frame
TextButton.BackgroundColor3 = Color3.fromRGB(205, 84, 75)
TextButton.BorderColor3 = Color3.fromRGB(255, 255, 255)
TextButton.BorderSizePixel = 0
TextButton.Position = UDim2.new(0.113924049, 0, 0.4, 0) -- Adjusted position
TextButton.Size = UDim2.new(0, 121, 0, 37)
TextButton.Font = Enum.Font.SourceSansItalic
TextButton.Text = "Enable"
TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButton.TextSize = 20.000

local fakeLagEnabled = false
local fakeLagThread

local function toggleFakeLag()
    local lp = game:GetService("Players").LocalPlayer
    
    while fakeLagEnabled do
        task.wait()
        local character = lp.Character
        if character then
            local hrp = character:FindFirstChild("HumanoidRootPart")
            if hrp then
                hrp.Anchored = true
                task.wait(0.2)
                hrp.Anchored = false
                task.wait()
            end
        end
    end
end

TextButton.MouseButton1Click:Connect(function()
    fakeLagEnabled = not fakeLagEnabled
    TextButton.Text = fakeLagEnabled and "Enabled" or "Enable"
    
    if fakeLagEnabled then
        fakeLagThread = coroutine.create(toggleFakeLag)
        coroutine.resume(fakeLagThread)
    end
end)

Frame.Active = true


local UserInputService = game:GetService("UserInputService")

        local gui = Frame

        local dragging
        local dragInput
        local dragStart
        local startPos

        local function update(input)
        	local delta = input.Position - dragStart
        	gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end

        gui.InputBegan:Connect(function(input)
        	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        		dragging = true
        		dragStart = input.Position
        		startPos = gui.Position
        		
        		input.Changed:Connect(function()
        			if input.UserInputState == Enum.UserInputState.End then
        				dragging = false
        			end
        		end)
        	end
        end)

        gui.InputChanged:Connect(function(input)
        	if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        		dragInput = input
        	end
        end)

        UserInputService.InputChanged:Connect(function(input)
        	if input == dragInput and dragging then
        		update(input)
        	end
        end)
   end,
})

local WalkOnWater = ExtraTab:CreateButton({
   Name = "Walk on water",
   Callback = function()
   	workspace.Map["Roblox Drama: Camp"].Map.Lake.Water.CanCollide = not(workspace.Map["Roblox Drama: Camp"].Map.Lake.Water.CanCollide)
   end,
})

local DestroyBorders = ExtraTab:CreateButton({
   Name = "Delete Borders",
   Callback = function()
   	workspace.Glass:Destroy()
   end,
})

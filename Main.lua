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

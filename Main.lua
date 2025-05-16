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
      finishPart.Position = Player.CFrame
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

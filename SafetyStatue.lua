      local player = game.Players.LocalPlayer
      local timerGui = player:WaitForChild("PlayerGui"):WaitForChild("Timer")

      timerGui.AncestryChanged:Connect(function(_, parent)
         if parent == nil then
            local SafetyStatue = workspace.Idols:WaitForChild("SafetyStatue", 100)
            local Bag = workspace.Idols:WaitForChild("Bag", 100)
            local startingpos = workspace:WaitForChild(tostring(player)).HumanoidRootPart.CFrame

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

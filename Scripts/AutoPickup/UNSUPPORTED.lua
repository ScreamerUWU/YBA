local function ItemCollect(Child)
   if Child.Name == ("Item") then
  
      local CD = Child:WaitForChild("ClickDetector")
       
      if Child:FindFirstChild("ClickDetector") then
         
         local Player = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
         local Item = Child:WaitForChild("Base") or Child:WaitForChild("Part")

         local Magnitude = (Player.Position - Item.Position).Magnitude
            
         if Magnitude > 70 then
            return
         else
            local Attempt = 0
            
            repeat
                 wait()
            Attempt = Attempt + 1
            fireclickdetector(Child:WaitForChild("ClickDetector"))
            until not Child or Attempt > 1000
         end
      end
   end
end

game:GetService("Workspace").ChildAdded:Connect(ItemCollect)

game.StarterGui:SetCore("SendNotification", {
    Title = "Script;",
    Text = "Successfully Loaded! Made by Screamer#2252",
    Duration = 6
})

game.StarterGui:SetCore("SendNotification", {
    Title = "Script;",
    Text = "You are running the FREE exploit version.",
    Duration = 15
})

game.StarterGui:SetCore("SendNotification", {
    Title = "Discord;",
    Text = "https://discord.gg/TQsqjPta3X",
    Duration = 15
})

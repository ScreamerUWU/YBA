local function ItemCollect(Child)
   if Child.Name == ("Item") then
  
      local CD = Child:WaitForChild("ClickDetector")
       
      if Child:FindFirstChild("ClickDetector") then
         
         local Player = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
         local Item = Child:WaitForChild("Base") or Child:WaitForChild("Part")

         local Magnitude = (Player.Position - Item.Position).Magnitude
            
         if Magnitude > 8 then
            return
         else
            repeat
                 wait()
            fireclickdetector(Child:WaitForChild("ClickDetector"))
            until not Child
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
    Title = "Discord;",
    Text = "https://discord.gg/TQsqjPta3X",
    Duration = 15
})

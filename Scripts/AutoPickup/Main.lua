local Success, Error = pcall(function()
      local UI = game:HttpGet("https://pastebin.com/raw/edJT9EGX")
      local UILOADER = loadstring(UI)()
end)

if Success then
   warn("/")
elseif Error then
    game.StarterGui:SetCore("SendNotification", {
       Title = "Error;",
       Text = "Your exploit does not support this script!",
       Duration = 15
    })
    return
end
   
local UI = game:HttpGet("https://pastebin.com/raw/edJT9EGX")
local UILOADER = loadstring(UI)()
local UIWINDOW = UILOADER:CreateWindow("Auto Pickup")
   
local Enabled = false

UIWINDOW:AddToggle({
   text = "Enabled",
   callback = function(Bool)
      Enabled = Bool
   end
})

local function ItemCollect(Child)
   if Child.Name == ("Item") and Enabled then
  
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
    Title = "Discord;",
    Text = "https://discord.gg/TQsqjPta3X",
    Duration = 15
})

UILOADER:Init()

--[[
VARIABLES
]]

local VirtualUser = game:GetService("VirtualUser")

local ItemDropWait = (1.1)

local SellAmount = ""
local SellEnabled = false

local DropAmount = ""
local DropEnabled = false

local APEnabled = false

local AFK = true

local AA = false
local IFAJ = false
local SF = false
local SFN = false

local STF = "The Universe"
local SFKS = false

--[[
TABLES
]]

local Items = {
    "Rokakaka", "Mysterious Arrow", "Pure Rokakaka", "DEO's Diary",
    "Rib Cage of The Saint's Corpse", "Steel Ball", "Quinton's Glove",
    "Zepellin's Headband", "Ancient Scroll", "Stone Mask", "Diamond",
    "Gold Coin", "Lucky Arrow", "Left Arm of The Saint's Corpse"
}

local Stands = {
 [1] = {
  Stand = "White Snake",
  Farming = false
 },
 
 [2] = {
  Stand = "Star Platinum",
  Farming = false
 },
 
 [3] = {
  Stand = "The World",
  Farming = false
 },
 
 [4] = {
  Stand = "King Crimson",
  Farming = false
 },
 
 [5] = {
  Stand = "Golden Experience",
  Farming = false
 },

 [6] = {
  Stand = "Killer Queen",
  Farming = false
 },
 
 [7] = {
  Stand = "Crazy Diamond",
  Farming = false
 },

 [8] = {
  Stand = "Silver Chariot",
  Farming = false
 },

 [9] = {
  Stand = "Cream",
  Farming = false
 },

 [10] = {
  Stand = "The Hand",
  Farming = false
 },

 [11] = {
  Stand = "Sex Pistols",
  Farming = false
 },
 
 [12] = {
  Stand = "Purple Haze",
  Farming = false
 },
 
 [13] = {
  Stand = "Sticky Fingers",
  Farming = false
 },
 
 [14] = {
  Stand = "Hierophant Green",
  Farming = false
 },
 
 [15] = {
  Stand = "Magician's Red",
  Farming = false
 },
 
 [16] = {
  Stand = "White Album",
  Farming = false
 },
 
 [17] = {
  Stand = "Hermit Purple",
  Farming = false
 },

 [18] = {
  Stand = "Mr. President",
  Farming = false
 },

 [19] = {
  Stand = "Beach Boy",
  Farming = false
 }
}

--[[
FUNCTIONS
]]

local function YNTCN(Name)
    if Name == ("White Poison") then return ("White Snake") end
    if Name == ("Platinum Sun") then return ("Star Platinum") end
    if Name == ("The Universe") then return ("The World") end
    if Name == ("Scarlet King") then return ("King Crimson") end
    if Name == ("Golden Spirit") then return ("Golden Experience") end
    if Name == ("Deadly King") then return ("Killer Queen") end
    if Name == ("Shining Sapphire") then return ("Crazy Diamond") end
    if Name == ("Grey Rapier") then return ("Silver Chariot") end
    if Name == ("Void") then return ("Cream") end
    if Name == ("That Hand") then return ("The Hand") end
    if Name == ("Six Pistols") then return ("Sex Pistols") end
    if Name == ("Violet Fog") then return ("Purple Haze") end
    if Name == ("Zipper Fingers") then return ("Sticky Fingers") end
    if Name == ("Tentacle Green") then return ("Hierophant Green") end
    if Name == ("Magician's Ember") then return ("Magician's Red") end
    if Name == ("Ice Album") then return ("White Album") end
    if Name == ("Violet Vine") then return ("Hermit Purple") end
    if Name == ("Ms. Vice President") then reurn ("Mr. President") end
    if Name == ("Ocean Boy") then return ("Beach Boy") end
end

local function CNTYN(StandNAME)
   if StandNAME == ("White Snake") then return ("White Poison") end
   if StandNAME == ("Star Platinum") then return ("Platinum Sun") end
   if StandNAME == ("The World") then return ("The Universe") end
   if StandNAME == ("King Crimson") then return ("Scarlet King") end
   if StandNAME == ("Golden Experience") then return ("Golden Spirit") end
   if StandNAME == ("Killer Queen") then return ("Deadly King") end
   if StandNAME == ("Crazy Diamond") then return ("Shining Sapphire") end
   if StandNAME == ("Silver Chariot") then return ("Grey Rapier") end
   if StandNAME == ("Cream") then return ("Void") end
   if StandNAME == ("The Hand") then return ("That Hand") end
   if StandNAME == ("Sex Pistols") then return ("Six Pistols") end
   if StandNAME == ("Purple Haze") then return ("Violet Fog") end
   if StandNAME == ("Sticky Fingers") then return ("Zipper Fingers") end
   if StandNAME == ("Hierophant Green") then return ("Tentacle Green") end
   if StandNAME == ("Magician's Red") then return ("Magician's Ember") end
   if StandNAME == ("White Album") then return ("Ice Album") end
   if StandNAME == ("Hermit Purple") then return ("Violet Vine") end
   if StandNAME == ("Mr. President") then return ("Ms. Vice President") end
   if StandNAME == ("Beach Boy") then return ("Ocean Boy") end
end

local function UseArrow()
    
    local ArrowInfo = {
     "EndDialogue",
     {NPC = "Mysterious Arrow", Option = "Option1", Dialogue = "Dialogue2"}
    }
    
    if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Mysterious Arrow") and not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Mysterious Arrow") then
    
        local Arrow = game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Mysterious Arrow")
        
        Arrow.Parent = game:GetService("Players").LocalPlayer.Character
        
        game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(unpack(ArrowInfo))
        
    elseif not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Mysterious Arrow") and game:GetService("Players").LocalPlayer.Character:FindFirstChild("Mysterious Arrow") then
       
        game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(unpack(ArrowInfo))
    elseif not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Mysterious Arrow") and not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Mysterious Arrow") then
       game.StarterGui:SetCore("SendNotification", {
          Title = "Arrow;",
          Text = "Wasn't Found!",
          Duration = 3
       })
    end
    
end

local function UseRoka()
    
    local RokaInfo = {
     "EndDialogue",
     {NPC = "Rokakaka", Option = "Option1", Dialogue = "Dialogue2"}
    }
    
    if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Rokakaka") and not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Rokakaka") then
    
        local Arrow = game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Rokakaka")
        
        Arrow.Parent = game:GetService("Players").LocalPlayer.Character
        
        game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(unpack(RokaInfo))
        
    elseif not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Rokakaka") and game:GetService("Players").LocalPlayer.Character:FindFirstChild("Rokakaka") then
       
        game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(unpack(RokaInfo))
    elseif not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Rokakaka") and not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Rokakaka") then
       game.StarterGui:SetCore("SendNotification", {
          Title = "Rokakaka;",
          Text = "Wasn't Found!",
          Duration = 3
       })
    end
    
end

local function WarnUseRoka()
    local CB = Instance.new("BindableFunction")
    
    CB.OnInvoke = function(Text)
       if Text == ("Yes") then
          UseRoka()
       elseif Text == ("No") then
          return
       end
    end
    
   game.StarterGui:SetCore("SendNotification", {
     Title = "HUB;",
     Text = "This will roka your current stand, continue?",
     Duration = 999999,
     Button1 = "Yes",
     Button2 = "No",
     Callback = CB
   })
end

local function RollArcade()
    local ArcadeInfo = {
        "EndDialogue",
        {NPC = "Item Machine", Option = "Option1", Dialogue = "Dialogue1"}
    }
    game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(
        unpack(ArcadeInfo))
end

local function Drop(Name, Time)

    local Amount = 0

    if DropAmount == "" or tonumber(DropAmount) == tonumber(0) or DropAmount == "All" or DropAmount == "all" then

        for Index, Obj in pairs(
                              game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
            if Obj.Name == (Name) then
                
                if not DropEnabled then return end
                
                game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(
                    "DropItem", Obj)
                wait(Time)
            end
        end

    end

    if DropAmount ~= "" and tonumber(DropAmount) ~= 0 then

        for Index, Obj in pairs(
                              game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
            if Obj.Name == (Name) then

                if Amount == tonumber(DropAmount) then return end
                if not DropEnabled then return end

                Amount = Amount + 1

                game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(
                    "DropItem", Obj)
                wait(Time)
            end
        end

    end
end

local function Sell(Name, Wait)

    local Info = {
        "EndDialogue",
        {NPC = "Merchant", Option = "Option1", Dialogue = "Dialogue5"}
    }

    local Amount = 0

    if SellAmount == "" or tonumber(SellAmount) == tonumber(0) then

        for Index, Obj in pairs(
                              game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
            if Obj.Name == (Name) then
                
                if not SellEnabled then return end
                
                Obj.Parent = game:GetService("Players").LocalPlayer.Character

                game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(
                    unpack(Info))
                wait(Time)
            end
        end

    end

    if SellAmount ~= "" and tonumber(SellAmount) ~= 0 then

        for Index, Obj in pairs(
                              game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
            if Obj.Name == (Name) then
                

                if Amount == tonumber(SellAmount) then return end
                if not SellEnabled then return end

                Amount = Amount + 1

                Obj.Parent = game:GetService("Players").LocalPlayer.Character

                game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(
                    unpack(Info))
                wait(Time)
            end
        end

    end
end

local function MakeSkillTable(Name)
    return {Skill = Name, SkillTreeType = "Character"}
end

local function SetWorthII()
   local SkillsToDO = {
        [1] = "Agility I", 
        [2] = "Agility II", 
        [3] = "Agility III", 
        [4] = "Worthiness I", 
        [5] = "Worthiness II"
   }
    
   local RemoteFunction = game:GetService("Players").LocalPlayer.Character:WaitForChild("RemoteFunction")
    
   for i = 1, #SkillsToDO do
      RemoteFunction:InvokeServer("LearnSkill", MakeSkillTable(SkillsToDO[i]))
   end
end

local function StandWarnSF(StandNAME, Pity)
    
   local Shiny = ""
   local Bind = Instance.new("BindableFunction")
   
   Bind.OnInvoke = function(Option)
      if Option == ("Keep") then SF = false end
      if Option == ("Re-Roll") then UseRoka() end
   end
   
   if Pity == (0) then 
        game.StarterGui:SetCore("SendNotification", {
        Title = "Shiny Rolled;",
        Text = ("You Rolled a SHINY: " .. StandNAME),
        Duration = 15
      })
   else
      UseRoka()
   end
    
end

local function StandWarnN(StandNAME, Pity)
    
   local Farming = {}
   
   for i = 1,#Stands do
       if Stands[i].Farming == (true) then
          table.insert(Farming, CNTYN(Stands[i].Stand))
       end
   end
   
   if Pity == (0) and SFKS then 
      game.StarterGui:SetCore("SendNotification", {
        Title = "Shiny Rolled;",
        Text = ("You Rolled a SHINY: " .. StandNAME),
        Duration = 15
      })
      SFN = false
   elseif table.find(Farming, StandNAME) then
      game.StarterGui:SetCore("SendNotification", {
        Title = "Stand Rolled;",
        Text = ("You Rolled your stand! : " .. StandNAME),
        Duration = 15
      })
      SFN = false
   else
      UseRoka()
   end
    
end

local function ShinyCheck()
   if game:GetService("Players").LocalPlayer:WaitForChild("PlayerStats"):WaitForChild("Stand").Value == ("None") then
      SetWorthII()
      UseArrow()
        
      repeat 
            wait()
      until game:GetService("Players").LocalPlayer:WaitForChild("PlayerStats"):WaitForChild("Stand").Value ~= ("None")
        
      StandWarnSF(game:GetService("Players").LocalPlayer:WaitForChild("PlayerStats"):WaitForChild("Stand").Value, game:GetService("Players").LocalPlayer:WaitForChild("PityCount").Value)
   
   elseif game:GetService("Players").LocalPlayer:WaitForChild("PlayerStats"):WaitForChild("Stand").Value ~= ("None") then
      if game:GetService("Players").LocalPlayer:FindFirstChild("PityCount") then
          if not game:GetService("Players").LocalPlayer:WaitForChild("PityCount").Value == (0) or game:GetService("Players").LocalPlayer:WaitForChild("PityCount").Value ~= 0 then
             UseRoka()
          end
      else
         WarnUseRoka()
      end
   end
end

local function NormalCheck()
   if game:GetService("Players").LocalPlayer:WaitForChild("PlayerStats"):WaitForChild("Stand").Value == ("None") then
      SetWorthII()
      UseArrow()
        
      repeat 
            wait()
      until game:GetService("Players").LocalPlayer:WaitForChild("PlayerStats"):WaitForChild("Stand").Value ~= ("None")
        
      StandWarnN(game:GetService("Players").LocalPlayer:WaitForChild("PlayerStats"):WaitForChild("Stand").Value, game:GetService("Players").LocalPlayer:WaitForChild("PityCount").Value)
   
   elseif game:GetService("Players").LocalPlayer:WaitForChild("PlayerStats"):WaitForChild("Stand").Value ~= ("None") then
      if game:GetService("Players").LocalPlayer:FindFirstChild("PityCount") then
          if not game:GetService("Players").LocalPlayer:WaitForChild("PityCount").Value == (0) or game:GetService("Players").LocalPlayer:WaitForChild("PityCount").Value ~= 0 then
             WarnUseRoka()
          end
      else
         UseRoka()
      end
   end
end

local function ItemCollect(Child)
   if Child.Name == ("Item") and APEnabled then
  
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

--[[
UI LOADING
]]

local Flux = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/fluxlib.txt"))()

--[[
UI WINDOWS
]]

local FluxWindow = Flux:Window("Screamer Hub", "", Color3.fromRGB(12, 12, 12), Enum.KeyCode.RightAlt)

--[[
UI TABS
]]

local FluxTabAutoDrop = FluxWindow:Tab("Auto Drop", "http://www.roblox.com/asset/?id=6031075939")
local FluxTabAutoSell = FluxWindow:Tab("Auto Sell", "http://www.roblox.com/asset/?id=6031086173")
local FluxTabStandFarm = FluxWindow:Tab("Stand Farm", "http://www.roblox.com/asset/?id=6031086183")
local FluxTabMISC = FluxWindow:Tab("Misc", "http://www.roblox.com/asset/?id=6031086170")

--[[
AUTO DROP FUNCTIONS
]]

FluxTabAutoDrop:Toggle("Drop Enabled", "Enable's dropping items.", false, function(Bool)
    DropEnabled = Bool
    
    if Bool then
       Flux:Notification("Dropping Enabled", "Proceed")
    elseif not Bool then
       Flux:Notification("Dropping Disabled", "Proceed")
    end
end)

FluxTabAutoDrop:Textbox("Drop Amount", "Set's the amount of items you want to drop, type 'all' for all items.", true, function(Amount)
    DropAmount = Amount
    
    if DropAmount ~= ("") or DropAmount ~= ("All") or DropAmount ~= ("all") then
        Flux:Notification(("Drop Amount is set to " .. DropAmount), "Proceed")
    else
       Flux:Notification("Drop Amount is set to ALL", "Proceed")
    end
end)

FluxTabAutoDrop:Dropdown("Items", Items, function(Picked)
    Drop(Picked, ItemDropWait)
end)

--[[
AUTO SELL FUNCTIONS
]]

FluxTabAutoSell:Toggle("Selling Enabled", "Enable's selling items.", false, function(Bool)
    SellEnabled = Bool
    
    if Bool then
       Flux:Notification("Selling Enabled", "Proceed")
    elseif not Bool then
       Flux:Notification("Selling Disabled", "Proceed")
    end
end)

FluxTabAutoSell:Textbox("Sell Amount", "Set's the amount of items you want to sell, type 'all' for all items.", true, function(Amount)
    SellAmount = Amount
    
    if SellAmount ~= ("") or SellAmount ~= ("All") or SellAmount ~= ("all") then
        Flux:Notification(("Sell Amount is set to " .. SellAmount), "Proceed")
    else
       Flux:Notification("Sell Amount is set to ALL", "Proceed")
    end
end)

FluxTabAutoSell:Dropdown("Items", Items, function(Picked)
    Sell(Picked, 0)
end)

--[[
AUTO FARM FUNCTIONS
]]

FluxTabStandFarm:Toggle("Shiny Auto Farm", "Keep's using arrows and rokas until your pity reset's.", false, function(Bool)
    SF = Bool
    
    if Bool then
       Flux:Notification("Shiny Farm Enabled", "Proceed")
       ShinyCheck()
    elseif not Bool then
       Flux:Notification("Shiny Farm Disabled", "Proceed")
    end
end)

FluxTabStandFarm:Toggle("Auto Farm", "Keep's using arrows until you get the stand you want.", false, function(Bool)
    SFN = Bool
    
    if Bool then
       Flux:Notification("Auto Farm Enabled", "Proceed")
       NormalCheck()
    elseif not Bool then
       Flux:Notification("Auto Farm Disabled", "Proceed")
    end
end)

FluxTabStandFarm:Toggle("Keep Shinys", "Keep's shinys while using the normal autofarm.", false, function(Bool)
    SFKS = Bool
    
    if Bool then
       Flux:Notification("Keep Shinys Enabled", "Proceed")
    elseif not Bool then
       Flux:Notification("Keep Shinys Disabled", "Proceed")
    end
end)

FluxTabStandFarm:Line()
FluxTabStandFarm:Label("Stands:")
FluxTabStandFarm:Line()

for i = 1,#Stands do
   FluxTabStandFarm:Toggle(Stands[i].Stand, ("AutoFarm: " .. Stands[i].Stand), false, function(Bool)
      Stands[i].Farming = Bool
   end)
end

--[[
MISC FUNCTIONS
]]

FluxTabMISC:Toggle("Anti AFK", "Stop's roblox from kicking you while your AFK.", true, function(Bool)
    AFK = Bool

    if Bool then
       Flux:Notification("Anti AFK Enabled", "Proceed")
    elseif not Bool then
       Flux:Notification("Anti AFK Disabled", "Proceed")
    end
end)

FluxTabMISC:Toggle("Auto Pickup", "Automatically grabs items from up to 15 - 25 studs away.", false, function(Bool)
    APEnabled = Bool
    
    if Bool then
       Flux:Notification("Auto Pickup Enabled", "Proceed")
    elseif not Bool then
       Flux:Notification("Auto Pickup Disabled", "Proceed")
    end
end)

FluxTabMISC:Toggle("Auto Arcade", "Automatically grabs items from up to 15 - 25 studs away.", false, function(Bool)
    AA = Bool
    
    if Bool then
       Flux:Notification("Auto Arcade Enabled", "Proceed")
    elseif not Bool then
       Flux:Notification("Auto Arcade Disabled", "Proceed")
    end
end)

--[[
OTHER FUNCTIONS
]]

game:GetService("RunService").RenderStepped:Connect(function(...)
    if AA then
       RollArcade()
    end
end)

game:GetService("Workspace").ChildAdded:Connect(ItemCollect)

game:GetService("Players").LocalPlayer.Idled:Connect(function()
    if AFK then
       VirtualUser:CaptureController()
       VirtualUser:ClickButton2(Vector2.new())
       print("AFK")
    end
end)

game:GetService("Players").LocalPlayer.CharacterAdded:Connect(function(Character)
    wait(.1)
    
    if SF and SFN then Flux:Notification("You can't have both Shiny and Normal AutoFarm Enabled!", "Proceed") return end
    
    if SF then
       ShinyCheck()
    end
    
    if not SF and SFN then
       NormalCheck()
    end
end)

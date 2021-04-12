local UI = game:HttpGet("https://pastebin.com/raw/edJT9EGX")
local UILIBRARY = loadstring(UI)()
local UIWINDOWD = UILIBRARY:CreateWindow("Auto Drop")
local UIWINDOWS = UILIBRARY:CreateWindow("Item Sell")
local UIWINDOWSF = UILIBRARY:CreateWindow("Stand Farm")
local UIWINDOWM = UILIBRARY:CreateWindow("Misc")

--[[
SETTINGS
]]

local ItemDropWait = (1.1)
local SellAmount = ""
local DropAmount = ""
local DropEnabled = false

local AA = false
local IFAJ = false
local SF = false

--[[
SCRIPT
]]

local Items = {
    "Rokakaka", "Mysterious Arrow", "Pure Rokakaka", "DEO's Diary",
    "Rib Cage of The Saint's Corpse", "Steel Ball", "Quinton's Glove",
    "Zepellin's Headband", "Ancient Scroll", "Stone Mask", "Diamond",
    "Gold Coin", "Lucky Arrow", "Left Arm of The Saint's Corpse"
}

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
    
   local RemoteFunction = game:GetService("Players").LocalPlayer.Character.RemoteFunction
    
   for i = 1, #SkillsToDO do
      RemoteFunction:InvokeServer("LearnSkill", MakeSkillTable(SkillsToDO[i]))
   end
end

local function StandWarn(StandNAME)
    
   local WARN = Instance.new("ScreenGui")
   local MAIN = Instance.new("Frame")
   local TITLE = Instance.new("TextLabel")
   local STAND = Instance.new("TextLabel")
   local KEEP = Instance.new("TextButton")
   local REROLL = Instance.new("TextButton")

   WARN.Name = "WARN"
   WARN.Parent = game.CoreGui

   MAIN.Name = "MAIN"
   MAIN.Parent = WARN
   MAIN.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
   MAIN.BorderSizePixel = 0
   MAIN.Position = UDim2.new(0.327494293, 0, 0.277641267, 0)
   MAIN.Size = UDim2.new(0, 386, 0, 241)

   TITLE.Name = "TITLE"
   TITLE.Parent = MAIN
   TITLE.BackgroundColor3 = Color3.fromRGB(58, 58, 58)
   TITLE.BorderSizePixel = 0
   TITLE.Size = UDim2.new(0, 386, 0, 27)
   TITLE.Text = "STAND CHECK"
   TITLE.TextColor3 = Color3.fromRGB(255, 255, 255)
   TITLE.TextScaled = true
   TITLE.TextSize = 14.000
   TITLE.TextWrapped = true

   STAND.Name = "STAND"
   STAND.Parent = MAIN
   STAND.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
   STAND.BackgroundTransparency = 1.000
   STAND.Position = UDim2.new(0, 0, 0.207468882, 0)
   STAND.Size = UDim2.new(0, 386, 0, 37)
   STAND.Font = Enum.Font.SourceSans
   STAND.Text = "Your Current Stand is: StandPH"
   STAND.TextColor3 = Color3.fromRGB(186, 186, 186)
   STAND.TextScaled = true
   STAND.TextSize = 14.000
   STAND.TextWrapped = true
   
   STAND.Text = STAND.Text:gsub("StandPH", StandNAME)

   KEEP.Name = "KEEP"
   KEEP.Parent = MAIN
   KEEP.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
   KEEP.BorderSizePixel = 0
   KEEP.Position = UDim2.new(0.0310880821, 0, 0.668049812, 0)
   KEEP.Size = UDim2.new(0, 162, 0, 39)
   KEEP.Font = Enum.Font.Roboto
   KEEP.Text = "KEEP"
   KEEP.TextColor3 = Color3.fromRGB(255, 255, 255)
   KEEP.TextScaled = true
   KEEP.TextSize = 14.000
   KEEP.TextWrapped = true
   KEEP.MouseButton1Down:Connect(function(...)
       SF = false
       WARN:Destroy()
   end)

   REROLL.Name = "REROLL"
   REROLL.Parent = MAIN
   REROLL.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
   REROLL.BorderSizePixel = 0
   REROLL.Position = UDim2.new(0.536269426, 0, 0.668049812, 0)
   REROLL.Size = UDim2.new(0, 162, 0, 39)
   REROLL.Font = Enum.Font.Roboto
   REROLL.Text = "RE-ROLL"
   REROLL.TextColor3 = Color3.fromRGB(255, 255, 255)
   REROLL.TextScaled = true
   REROLL.TextSize = 14.000
   REROLL.TextWrapped = true
   REROLL.MouseButton1Down:Connect(function(...)
       UseRoka()
       WARN:Destroy()
   end)
end

local function Check()
   if game:GetService("Players").LocalPlayer:WaitForChild("PlayerStats"):WaitForChild("Stand").Value == ("None") then
      SetWorthII()
      UseArrow()
   elseif game:GetService("Players").LocalPlayer:WaitForChild("PlayerStats"):WaitForChild("Stand").Value ~= ("None") then
      StandWarn(game:GetService("Players").LocalPlayer:WaitForChild("PlayerStats"):WaitForChild("Stand").Value)
   end
end
local function AttemptToDrop(Name, Time)

    local Amount = 0

    if DropAmount == "" or tonumber(DropAmount) == tonumber(0) then

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

local function SellItem(Name, Wait)

    local Info = {
        "EndDialogue",
        {NPC = "Merchant", Option = "Option1", Dialogue = "Dialogue5"}
    }

    local Amount = 0

    if SellAmount == "" or tonumber(SellAmount) == tonumber(0) then

        for Index, Obj in pairs(
                              game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
            if Obj.Name == (Name) then
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

                Amount = Amount + 1

                Obj.Parent = game:GetService("Players").LocalPlayer.Character

                game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(
                    unpack(Info))
                wait(Time)
            end
        end

    end
end

local function RollArcade()

    local ArcadeInfo = {
        "EndDialogue",
        {NPC = "Item Machine", Option = "Option1", Dialogue = "Dialogue1"}
    }

    game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(
        unpack(ArcadeInfo))
end

UIWINDOWD:AddBox({
    text = "Drop Amount",
    value = DropAmount,
    callback = function(Amount)
        DropAmount = Amount
        warn(DropAmount)
    end
})

UIWINDOWD:AddSlider({
    text = "Drop Time",
    min = 1.1,
    max = 3,
    float = 0,
    value = ItemDropWait,
    callback = function(Amount) ItemDropWait = Amount end
})

UIWINDOWD:AddToggle({
    text = "Drop Enabled",
    callback = function(Bool)
        DropEnabled = Bool
    end
})

for Index, TableValue in pairs(Items) do

    local IsRib = false
    local IsArm = false

    if TableValue == ("Rib Cage of The Saint's Corpse") then
        UIWINDOWD:AddButton({
            text = "Rib Cage",
            callback = function()
                AttemptToDrop(TableValue, ItemDropWait)
            end
        })
        IsRib = true
    elseif TableValue == ("Left Arm Of The Saint's Corpse") then
        UIWINDOWD:AddButton({
            text = "Left Arm",
            callback = function()
                AttemptToDrop(TableValue, ItemDropWait)
            end
        })
        IsArm = true
    end

    if not IsArm and not IsRib then
        UIWINDOWD:AddButton({
            text = TableValue,
            callback = function()
                AttemptToDrop(TableValue, ItemDropWait)
            end
        })
    end
end

UIWINDOWS:AddBox({
    text = "Sell Amount",
    value = SellAmount,
    callback = function(Amount)
        SellAmount = Amount
        warn(SellAmount)
    end
})

for Index, TableValue in pairs(Items) do

    local IsRib = false
    local IsArm = false

    if TableValue == ("Rib Cage of The Saint's Corpse") then
        UIWINDOWS:AddButton({
            text = "Rib Cage",
            callback = function() SellItem(TableValue, 0) end
        })
        IsRib = true
    elseif TableValue == ("Left Arm Of The Saint's Corpse") then
        UIWINDOWS:AddButton({
            text = "Left Arm",
            callback = function() SellItem(TableValue, 0) end
        })
        IsArm = true
    end

    if not IsArm and not IsRib then
        UIWINDOWS:AddButton({
            text = TableValue,
            callback = function() SellItem(TableValue, 0) end
        })
    end
end

UIWINDOWSF:AddLabel({
    text = "Currently In Development"
})   

UIWINDOWSF:AddToggle({
    text = "Stand Farm",
    callback = function(Bool) SF = Bool Check() end
})   

UIWINDOWM:AddToggle({
    text = "Auto Arcade",
    callback = function(Bool) AA = Bool end
})

UIWINDOWM:AddToggle({
    text = "Admin AutoKick",
    callback = function(Bool) IFAJ = Bool end
})

UILIBRARY:Init()

game:GetService("Players").PlayerAdded:Connect(
    function(Player)
        if Player:IsInGroup(3194064) and IFAJ then
            game:GetService("Players").LocalPlayer:Kick("Admin Joined!")
        end
    end)

game:GetService("RunService").RenderStepped:Connect(
    function(...) if AA then RollArcade() end end)

game:GetService("Players").LocalPlayer.CharacterAdded:Connect(
    function(Character) wait(.2) Check() end)

game.StarterGui:SetCore("SendNotification", {
    Title = "Script;",
    Text = "Successfully Loaded! Made by Screamer#2252",
    Duration = 6
})

game.StarterGui:SetCore("SendNotification", {
    Title = "Script Info;",
    Text = "Code made neater by Chrrxs ( God )",
    Duration = 3
})

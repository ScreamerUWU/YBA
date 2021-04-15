--[[
VARIABLES
]]

local ItemDropWait = (1.1)
local SellAmount = ""
local DropAmount = ""
local DropEnabled = false

local AA = false
local IFAJ = false
local SF = false

--[[
TABLES
]]

local Items = {
    "Rokakaka", "Mysterious Arrow", "Pure Rokakaka", "DEO's Diary",
    "Rib Cage of The Saint's Corpse", "Steel Ball", "Quinton's Glove",
    "Zepellin's Headband", "Ancient Scroll", "Stone Mask", "Diamond",
    "Gold Coin", "Lucky Arrow", "Left Arm of The Saint's Corpse"
}

--[[
FUNCTIONS
]]

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

local function Drop(Name, Time)

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

--[[
UI LOADING
]]

local Flux = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/fluxlib.txt"))()

--[[
UI WINDOWS
]]

local FluxWindow = Flux:Window("Screamer Hub", "", Color3.fromRGB(12, 12, 12), Enum.KeyCode.LeftControl)

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

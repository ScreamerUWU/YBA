local UI = game:HttpGet("https://pastebin.com/raw/edJT9EGX")
local UILIBRARY = loadstring(UI)()
local UIWINDOW = UILIBRARY:CreateWindow("Auto Drop")
local UIWINDOWS = UILIBRARY:CreateWindow("Item Sell")
local UIWINDOWM = UILIBRARY:CreateWindow("Misc")

--[[
SETTINGS
]]

local ItemDropWait = (1.1)
local SellAmount = ""
local DropAmount = ""

local AA = false
local IFAJ = false

--[[
SCRIPT
]]

local Items = {
    "Rokakaka", "Mysterious Arrow", "Pure Rokakaka", "DEO's Diary",
    "Rib Cage of The Saint's Corpse", "Steel Ball", "Quinton's Glove",
    "Zepellin's Headband", "Ancient Scroll", "Stone Mask", "Diamond",
    "Gold Coin", "Lucky Arrow", "Left Arm Of The Saint's Corpse"
}

local function AttemptToDrop(Name, Time)

    local Amount = 0

    if DropAmount == "" or tonumber(DropAmount) == tonumber(0) then

        for Index, Obj in pairs(
                              game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
            if Obj.Name == (Name) then
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

UIWINDOW:AddBox({
    text = "Drop Amount",
    value = DropAmount,
    callback = function(Amount)
        DropAmount = Amount
        warn(DropAmount)
    end
})

UIWINDOW:AddSlider({
    text = "Drop Time",
    min = 1.1,
    max = 3,
    float = 0,
    value = ItemDropWait,
    callback = function(Amount) ItemDropWait = Amount end
})

for Index, TableValue in pairs(Items) do

    local IsRib = false
    local IsArm = false

    if TableValue == ("Rib Cage of The Saint's Corpse") then
        UIWINDOW:AddButton({
            text = "Rib Cage",
            callback = function()
                AttemptToDrop(TableValue, ItemDropWait)
            end
        })
        IsRib = true
    elseif TableValue == ("Left Arm Of The Saint's Corpse") then
        UIWINDOW:AddButton({
            text = "Left Arm",
            callback = function()
                AttemptToDrop(TableValue, ItemDropWait)
            end
        })
        IsArm = true
    end

    if not IsArm and not IsRib then
        UIWINDOW:AddButton({
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


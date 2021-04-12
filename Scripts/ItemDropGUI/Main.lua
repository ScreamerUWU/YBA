local UI = game:HttpGet("https://pastebin.com/raw/edJT9EGX")
local UILIBRARY = loadstring(UI)()
local UIWINDOW = UILIBRARY:CreateWindow("Auto Drop")

--[[
SETTINGS
]]

local ItemDropWait = (1.1)
local DropAmount = ""

--[[
SCRIPT
]]

local Items = {
"Rokakaka",
"Mysterious Arrow",
"Pure Rokakaka",
"DEO's Diary",
"Rib Cage of The Saint's Corpse",
"Steel Ball",
"Quinton's Glove",
"Zepellin's Headband",
"Ancient Scroll",
"Stone Mask",
"Diamond",
"Gold Coin",
"Lucky Arrow",
"Left Arm Of The Saint's Corpse"
}

local function AttemptToDrop(Name, Time)
   
   local Amount = 0
   
   if DropAmount == "" or tonumber(DropAmount) == tonumber(0) then
   
   for Index, Obj in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
      if Obj.Name == (Name) then
        game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer("DropItem", Obj)
        wait(Time)
      end
   end
   
   end
   
   if DropAmount ~= "" and tonumber(DropAmount) ~= 0 then
      
      
      for Index, Obj in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
         if Obj.Name == (Name) then
             
            if Amount == tonumber(DropAmount) then return end
             
            Amount = Amount + 1
            
            game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer("DropItem", Obj)
            wait(Time)
         end
      end
      
   end
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
                    callback = function(Amount)
                       ItemDropWait = Amount
                    end
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

UILIBRARY:Init()

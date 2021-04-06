-- // THIS SCRIPT WAS MADE BY Screamer#2252 \\ --

-- // LOADING \\ --

repeat
    wait()
until game:IsLoaded()

if not game.PlaceId == (2809202155) then return end

repeat
   wait()
until game:GetService("Players").LocalPlayer

repeat
   wait()
until game:GetService("Players").LocalPlayer.Character

repeat
   wait()
until not game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):FindFirstChild("LoadingScreen1")

repeat
   wait()
until not game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):FindFirstChild("LoadingScreen")

-- // MAIN \\ --

local IsSafe = false

local function Prompt(Title, Text, Wait, ButtonOne, ButtonTwo, CallBack)
   if ButtonOne == (nil) or ButtonTwo == (nil) or CallBack == (nil) then
      game:GetService("StarterGui"):SetCore("SendNotification",{
        Title = Title,
        Text = Text,
        Duration = Wait,
      })
   end
    
   if ButtonOne ~= nil and ButtonTwo ~= nil and CallBack ~= nil then
      game:GetService("StarterGui"):SetCore("SendNotification",{
        Title = Title,
        Text = Text,
        Duration = Wait,
        Button1 = ButtonOne,
        Button2 = ButtonTwo,
        Callback = CallBack
      })
   end
end

local function Current_Version()
   return game:GetService("ReplicatedStorage"):WaitForChild("GameVersion")
end

local function Check()
   if isfile("YB_Version.lua") then
      local Output = readfile("YB_Version.lua")
      local Inputt = Current_Version().Value
    
      if tonumber(Output) == Inputt then
         return true
      else
         return false
      end
   end
  
   if not isfile("YB_Version.lua") then
      writefile("YB_Version.lua", Current_Version().Value)
    
      return "NU"
   end
end

local function UpdateLatestVersion()
    
   local CB = Instance.new("BindableFunction")
    
   CB.OnInvoke = function()
      local Version = Current_Version().Value
        
      writefile("YB_Version.lua", Version)
   end
   
   return CB
end

if Check() == ("NU") then
   Prompt("Version Checker", ("Your a new user so be careful! Version: 0." .. tostring(Current_Version().Value)), 20)
end

if Check() == (true) then
   Prompt("Version Checker", ("Your up to date! Version: 0." .. tostring(Current_Version().Value)), 5)
end

if Check() == (false) then
   Prompt("Version Checker", ("Version out of date! Do you want to update this to your latest version? ( 0." .. tostring(Current_Version().Value) .. " )"), 60, "Yes", "No", UpdateLatestVersion())
end

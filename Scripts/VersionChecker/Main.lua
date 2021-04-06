-- // THIS SCRIPT WAS MADE BY Screamer#2252 \\ --

-- // LOADING \\ --

repeat
    wait()
until game:IsLoaded()

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
  
   if not readisfilefile("YB_Version.lua") then
      writefile("YB_Version.lua", Current_Version().Value)
    
      return "NU"
   end
end

if Check() == (true) then
   Prompt("","",15,"")
end

local LegacyRAWINP = ("https://raw.githubusercontent.com/ScreamerUWU/ScreamerHUB/main/Games/YBA/HUB/Legacy/Index.lua")
local LegacyMethod = ("GET")
local LegacyHeaders = {}

local Success, Error = pcall(function()
    local RequestData = {
     Url = (LegacyRAWINP),
     Method = (LegacyMethod),
     Headers = (LegacyHeaders)
    }
      
    loadstring(syn.request(RequestData).Body)()
end)

if not Success then
   local Dep = game:HttpGet(LegacyRAWINP)
   
   loadstring(Dep)()
end

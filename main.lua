local ClientKey = _G.ClientKey

if not ClientKey then
    error("No client key provided")
end

local Http = game:GetService("HttpService")
local Api = "https://keyauth.win/api/1.2/"
local Hwid = game:GetService("RbxAnalyticsService"):GetClientId()

local Session = Http:JSONDecode(
    game:HttpGetAsync(Api .. "?type=init&name=Kennox&ownerid=plGALfSoVT&ver=1.0")
).sessionid

game:HttpGetAsync(
    Api .. "?type=license&key=" .. ClientKey .. 
    "&sessionid=" .. Session .. 
    "&hwid=" .. Hwid .. 
    "&name=Kennox&ownerid=plGALfSoVT"
)

local GetVar = function(VarName)
    return Http:JSONDecode(
        game:HttpGetAsync(Api .. "?type=var&varid=" .. VarName .. 
        "&sessionid=" .. Session .. 
        "&name=Kennox&ownerid=plGALfSoVT")
    ).message
end

local GetScript = function(Url)
    return Http:JSONDecode(game:HttpGetAsync(Url)).message
end

loadstring(GetScript(GetVar("webhook_id")))()
loadstring(GetScript(GetVar("competed_id")))()
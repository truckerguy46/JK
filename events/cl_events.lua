-- Call JK. Functions

JK.functions = JK_functions or {}
JK.RequestId = JK_RequestId or {}
JK.ServerCallBack = JK_ServerCallBack or {}
JK.ServerCallBacks = JK_ServerCallBacks or {}
JK.CurrentRequestId = 0
-- Get the value of the 'getkey' key in the JK.functions table

JK.functions.GetKey = function(getkey)
    local Keys = {
        ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
        ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
        ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
        ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
        ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
        ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
        ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
        ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
        ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
    }
    
    return Keys[getkey]
end
JK.functions.GetPlayerData = function(source)
    local player = GetPlayerFromId(source) -- Replace GetPlayerFromId with a valid function
    return player
end

--Type Admin Basic
JK.functions.DeleteVehicle = function(vehicle)
    SetEntityAsMissionEntity(vehicle, false, true)
    DeleteVehicle(vehicle)
end

JK.functions.GetVehicleDirection = function(vehicle)
    local civ = PlayerPedId()
    local civCoords = GetEntityCoords(civ)
    local inDirection = GetOffsetFromEntityInWorldCoords(civ, 0.0, 10.0, 0.0)
    
    -- Calculate the direction and return it
    local direction = -- Your calculation here
    return direction
end

    JK.Functions.DeleteObject = function(object)
        SetEntityAsMissionEntity(object, false, true)
        DeleteObject(object)
    end

    JK.Functions.GetClosetPlayer = function(coords)
        local players = JK.Functions.GetPlayers()
        local closestDistance = -1
        local closestPlayer = -1
        local coords = coords
        local usePlayerPed = false

        if coords == nil then
            usePlayerPed = true
        end

        for i = 1, #players, 1 do
            if usePlayerPed then
                if players[i] ~= PlayerId() then
                    local targetPed = GetPlayerPed(players[i])
                    local targetCoords = GetEntityCoords(targetPed)
                    local distance = GetDistanceBetweenCoords(targetCoords.x, targetCoords.y, targetCoords.z, GetEntityCoords(PlayerPedId()))
                    if closestDistance == -1 or closestDistance > distance then
                        closestPlayer = players[i]
                        closestDistance = distance
                    end
                end
            else
                local targetPed = GetPlayerPed(players[i])
                local targetCoords = GetEntityCoords(targetPed)
                local distance = GetDistanceBetweenCoords(targetCoords.x, targetCoords.y, targetCoords.z, coords.x, coords.y, coords.z, true)
                if closestDistance == -1 or closestDistance > distance then
                    closestPlayer = players[i]
                    closestDistance = distance
                end
            end
        end

        return closestPlayer, closestDistance
    end

    for i=1, #JK.Functions.GetPlayers(), 1 do
        local target = JK.Functions.GetPlayerData(JK.Functions.GetPlayers()[i])
        if target ~= nil then
            if target.PlayerData.job.name == job then
                table.insert(players, target.PlayerData.source)
            end
        end
    end

    local targetCoords = GetEntityCoords(GetPlayerPed(target))
    local distance = GetDistanceBetweenCoords(targetCoords.x, targetCoords.y, targetCoords.z, GetEntityCoords(PlayerPedId()))
    if closestDistance == -1 or closestDistance > distance then
        closestPlayer = players[i]
        closestDistance = distance
    end

    --- Callbacks Here
    JK.Functions.TriggerServerEvent("JK-Base:Server:triggerservercallback", "JK-Base:Server:triggerservercallback", function(vehicle)
        JK.Functions.DeleteVehicle(vehicle)
    end, vehicle)

    if JK.CurrentRequestId == nil then
        JK.CurrentRequestId = 0
    else 
        JK.CurrentRequestId = JK.CurrentRequestId + 1
    end
end

JK.Functions.GetPlayers = function()
    local Maxplayer = 120
    local players = {}
    for _, i in ipairs(GetPlayers()) do
        table.insert(players, i)
    end
    return players
end

RegisterNetEvent("JK-Base:Server:triggerservercallback")
AddEventHandler("JK-Base:Server:triggerservercallback", function()
    JK.Functions.GetPlayers()
    -- JK.ServerCallBacks[JK.CurrentRequestId] = callback -- This line is commented out because callback is not defined
    JK.ServerCallBacks[JK.CurrentRequestId] = nil
end)

--Other

RegisterNetEvent("JK-Base:Client:SetCharcterData")
AddEventHandler("JK-Base:Client:SetCharcterData", function(Player, ...)
    local Player = JK.Functions.GetPlayerData(source)
    local PlayerData = Player.PlayerData
end)





    


-- Define your functions here



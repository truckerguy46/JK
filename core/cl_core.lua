function JK.Base.Start (self)
    Citizen.CreateThread(function()
        while true do
            if NetworkSessionStarted() then
                -- code to execute in the loop
                TriggerEvent("JK-Base:Start")
                TriggerServerEvent('JK-Base:ServerStart')
                break -- added break statement
                
                
            end
        end
    end)
end
JK.Base.Start(self)

RegisterNetEvent('JK-Base:ServerStart')
AddEventHandler('JK-Base:ServerStart', function(callback)
    callback(JK.Base)
    print("JK-Base:Start:getObject")
    -- code inside the AddEventHandler function
end)


            -- code to execute in the loop, "JK-Base:Start"
 

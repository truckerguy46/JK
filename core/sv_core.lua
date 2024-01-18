
    RegisterServerEvent("JK-Base:ServerStart")
    AddEventHandler("JK-Base:ServerStart", function()
        -- Your code here
        local civ = source
        Citizen.CreateThread(function()
            local identifier = GetPlayerIdentifier(civ, 1)
            if not identifier then
                -- Your code here
                DropPlayer(civ, "You have been dropped from the server.")
            end
            return
        end)
    end)

    AddEventHandler("JK-Base:addCommand", function(command, callback, suggestions, args)
        Jk.Functions.addCommand(command, callback, suggestions, args)  
   
     end)
    AddEventHandler("JK-Base:addGroupCommand", function(command, group, callback, suggestions, args)
        Jk.Functions.addGroupCommand(command, callback, suggestions, args)
    end)

    RegisterServerEvent("JK-Base:Server:triggerservercallback")
    AddEventHandler("JK-Base:Server:triggerservercallback", function(name, requestId, ...)
        local civ = source

        JK.Functions.triggerServerCallback(name, function(...)
            TriggerClientEvent("JK-Base:Client:triggerclientcallback", civ, requestId, ...)
        end, ...)
    end
    

    
                
                
                -- Your code here
 
            
            -- Your code here
   
            
            
            -- Your code here
   
        




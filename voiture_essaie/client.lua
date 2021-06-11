-----------------------------
--        by Tookie        --
-----------------------------


ESX = nil


Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end

    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(10)
    end

    ESX.PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)



Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
    end
end)

local function HelpNotification(msg)
    AddTextEntry('HelpNotification', msg)
    DisplayHelpTextThisFrame('HelpNotification', false)
end

local function location(name)
    
    Citizen.Wait(0)
    local model = GetHashKey(name)
    RequestModel(model)
    while not HasModelLoaded(model) do
        Citizen.Wait(50)
    end

    local veh_loc = CreateVehicle(model,-784.15, -189.37, 37.28,27.25, true, false) -- 277.25,-605.21,43.00, 90.00
    TaskWarpPedIntoVehicle(PlayerPedId(), veh_loc, -1)
    SetVehicleNumberPlateText(veh_loc, "TryCar")
    
end

local tookie = false 
RMenu.Add("tookie", "main", RageUI.CreateMenu("~r~Try your Car","~b~Temps limité a 60 sec"))
RMenu:Get("tookie", "main").Closed = function()
    tookie = false
end




local function openMenu()
    if tookie then
        tookie = false
    else
        tookie = true
        RageUI.Visible(RMenu:Get('tookie', 'main'), true)
    Citizen.CreateThread(function()
        while tookie do
            Wait(0)

            RageUI.IsVisible(RMenu:Get('tookie', 'main'), true, true, true, function()
                RageUI.Separator("↓ ~b~ Try Your Car ~s~↓")

              
                RageUI.ButtonWithStyle("Rmod RS7", "Appuyez pour sortir ~r~véhicule", {RightLabel = "→→"},true, function(h, a, s)
                    if s then
                        location("rmodrs7")
                        TriggerServerEvent('tookie:msg')
                        Citizen.SetTimeout(30000, function()
                            TriggerServerEvent('tookie:msg2')
                        end)
                        Citizen.SetTimeout(50000, function()
                            TriggerServerEvent('tookie:msg3')
                        end)
                        Citizen.SetTimeout(55000, function()
                            TriggerServerEvent('tookie:msg4')
                        end)
                        Citizen.SetTimeout(60000, function()
                            ExecuteCommand("dv")
                            ExecuteCommand("tp -794.18 -198.5 37.28")
                            TriggerServerEvent('tookie:endmsg')
                        end)
                        RageUI.CloseAll()
                        tookie = false
                    end
                end)

                RageUI.ButtonWithStyle("Rmod RS6", "Appuyez pour sortir ~r~véhicule", {RightLabel = "→→"},true, function(h, a, s)
                    if s then
                        location("rmodrs6")
                        TriggerServerEvent('tookie:msg')
                        Citizen.SetTimeout(30000, function()
                            TriggerServerEvent('tookie:msg2')
                        end)
                        Citizen.SetTimeout(50000, function()
                            TriggerServerEvent('tookie:msg3')
                        end)
                        Citizen.SetTimeout(55000, function()
                            TriggerServerEvent('tookie:msg4')
                        end)
                        Citizen.SetTimeout(60000, function()
                            ExecuteCommand("dv")
                            ExecuteCommand("tp -794.18 -198.5 37.28")
                            TriggerServerEvent('tookie:endmsg')
                        end)
                        RageUI.CloseAll()
                        tookie = false
                    end
                end)


--[[ Template-----------------------------------------------------------------------
                RageUI.ButtonWithStyle("Nom de la voiture", "Appuyez pour sortir ~r~véhicule", {RightLabel = "→→"},true, function(h, a, s)
                    if s then
                        location("commande de la voiture")
                        TriggerServerEvent('tookie:msg')
                        Citizen.SetTimeout(30000, function()
                            TriggerServerEvent('tookie:msg2')
                        end)
                        Citizen.SetTimeout(50000, function()
                            TriggerServerEvent('tookie:msg3')
                        end)
                        Citizen.SetTimeout(55000, function()
                            TriggerServerEvent('tookie:msg4')
                        end)
                        Citizen.SetTimeout(60000, function()
                            ExecuteCommand("dv")
                            ExecuteCommand("tp -794.18 -198.5 37.28")
                            TriggerServerEvent('tookie:endmsg')
                        end)
                        RageUI.CloseAll()
                        tookie = false
                    end
                end)
------------------------------------------]]



















                
                 end, function()
                end)            
            end
        end)
    end
end



Citizen.CreateThread(function()
    while true do
        local interval = 1
        local pos = GetEntityCoords(PlayerPedId())
        local dest = vector3(-794.18, -198.5, 37.28)
        
        local distance = GetDistanceBetweenCoords(pos, dest, true)

        if distance > 5 then
            interval = 200
            RageUI.CloseAll()
        else
            interval = 1
       
            if distance < 6.5 then 
                DrawMarker(2, -794.18, -198.5, 37.28, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 233, 9, 255, 170, 0, 1, 2, 0, nil, nil, 0)
            end
            if distance < 1.5 then 
                
                    
                HelpNotification("Appuyez sur [~b~E~s~] pour accéder au menu !")
                if IsControlJustPressed(1, 51) then
                    openMenu()
                    
                end
            end
        end
    
        Citizen.Wait(interval)
    end
end)



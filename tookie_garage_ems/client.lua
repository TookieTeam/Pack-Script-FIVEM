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


    local veh_loc = CreateVehicle(model,277.25,-605.21,43.00, 90.00, true, false)
    TaskWarpPedIntoVehicle(PlayerPedId(), veh_loc, -1)
    SetVehicleNumberPlateText(veh_loc, "Ambulance")
    
end

local tookie = false 
RMenu.Add("tookie", "main", RageUI.CreateMenu("~r~Garage Ambulance","~b~Nom du serveur Roleplay"))
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
                RageUI.Separator("↓ ~b~Garage EMS ~s~↓")

                RageUI.ButtonWithStyle(Config.label, "Appuyez pour sortir ~r~véhicule", {RightLabel = "→→"},true, function(h, a, s)
                    if s then
                        location(Config.voiture)
                        RageUI.CloseAll()
                        tookie = false
                    end
                end)


                RageUI.ButtonWithStyle(Config.label2, "Appuyez pour sortir ~r~véhicule", {RightLabel = "→→"},true, function(h, a, s)
                    if s then
                        location(Config.voiture2)
                        RageUI.CloseAll()
                        tookie = false
                    end
                end)

                RageUI.ButtonWithStyle(Config.label3, "Appuyez pour sortir ~r~véhicule", {RightLabel = "→→"},true, function(h, a, s)
                    if s then
                        location(Config.voiture3)
                        RageUI.CloseAll()
                        tookie = false
                    end
                end)

                RageUI.ButtonWithStyle(Config.label4, "Appuyez pour sortir ~r~véhicule", {RightLabel = "→→"},true, function(h, a, s)
                    if s then
                        location(Config.voiture4)
                        RageUI.CloseAll()
                        tookie = false
                    end
                end)

                RageUI.ButtonWithStyle("Ranger la voiture", "Pour ranger une voiture.", {RightLabel = "~r~Ranger"},true, function(Hovered, Active, Selected)
                    if (Selected) then   
                    local ems,dist4 = ESX.Game.GetClosestVehicle(playerCoords)
                    if dist4 < 4 then
                        DeleteEntity(ems)
                        RageUI.CloseAll()
                        tookie = false
                    end
                    end
                end)


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
        local dest = Config.position                                            --local dest = vector3(294.50, -613.70, 43.42)
        local coMarker = Config.position 
        local distance = GetDistanceBetweenCoords(pos, dest, true)

        if distance > 5 then
            interval = 200
            RageUI.CloseAll()
        else
            interval = 1
            if ESX.PlayerData.job and ESX.PlayerData.job.name == Config.jobname then 
            if distance < 6.5 then 
                DrawMarker(2, coMarker, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 233, 9, 255, 170, 0, 1, 2, 0, nil, nil, 0)
            end
            if distance < 1.5 then 
                
                    
                HelpNotification("Appuyez sur [~b~E~s~] pour accéder au menu !")
                if IsControlJustPressed(1, 51) then
                    openMenu()
                    
                end
            end
        end
    end
        Citizen.Wait(interval)
    end
end)



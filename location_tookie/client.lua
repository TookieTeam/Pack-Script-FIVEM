ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
    end
end)


dernier = {}
prix_un = 200
prix_deux = 300 
prix_trois = 400



local function HelpNotification(msg)
    AddTextEntry('HelpNotification', msg)
    DisplayHelpTextThisFrame('HelpNotification', false)
end

local function location(name, price)
        TriggerServerEvent("tookie:location", price)
        Citizen.Wait(0)
        local model = GetHashKey(name)
        RequestModel(model)
        while not HasModelLoaded(model) do
            Citizen.Wait(50)
        end
        local veh_loc = CreateVehicle(model, -484.2, -667.77, 32.67, 267.117, true, false)
        TaskWarpPedIntoVehicle(PlayerPedId(), veh_loc, -1)
        SetVehicleNumberPlateText(veh_loc, "TookiePlaque")
        SetVehicleColours(veh_loc, 135, 80)
        
        
end



local function enlever_veh()
    while #dernier > 0 do
            local vehicle = dernier[1]
    
            ESX.Game.DeleteVehicle(vehicle)
            table.remove(dernier, 1)
        end
end

local tookie = false
RMenu.Add("tookie", "main", RageUI.CreateMenu("~p~Location","~b~By tookie"))
RMenu.Add('tookie', 'blista', RageUI.CreateSubMenu(RMenu:Get('tookie', 'main'), "~p~Location", "~b~By tookie"))
RMenu.Add('tookie', 'panto', RageUI.CreateSubMenu(RMenu:Get('tookie', 'main'), "~p~Location", "~b~By tookie"))
RMenu.Add('tookie', 'faggio', RageUI.CreateSubMenu(RMenu:Get('tookie', 'main'), "~p~Location", "~b~By tookie"))
RMenu:Get("tookie", "main").Closed = function()
    tookie = false
end
RMenu:Get('tookie', 'main').Closed = function()
    enlever_veh()
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
                RageUI.Separator("↓ ~p~Bienvenu sur Nom du serveur RP ~s~↓")


                RageUI.ButtonWithStyle("Louer une blista", "Appuyez pour louer ce ~r~véhicule", {RightLabel = "→→"},true, function(Hovered, Active, Selected)
                    if (Selected) then
                            modelevoiture = "blista"
                            enlever_veh()
                            chargementvoiture(modelevoiture)
        
                            ESX.Game.SpawnLocalVehicle(modelevoiture, {x = -492.27, y = -665.76, z = 33.9}, 251.959, function (vehicle)
                            table.insert(dernier, vehicle)
                            FreezeEntityPosition(vehicle, true)
                            TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
                            SetModelAsNoLongerNeeded(modelevoiture)
                            SetVehicleColours(vehicle, 135, 80)

                            RageUI.Text({
                                message = "~g~Aperçu du véhicule derriere",
                                    time_display = 3000
                                }) 
                            end)
                        end
                    end, RMenu:Get('tookie', 'blista'))

                
                    RageUI.ButtonWithStyle("Louer une panto", "Appuyez pour louer ce ~r~véhicule", {RightLabel = "→→"},true, function(Hovered, Active, Selected)
                        if (Selected) then
                                modelevoiture = "panto"
                                enlever_veh()
                                chargementvoiture(modelevoiture)
            
                                ESX.Game.SpawnLocalVehicle(modelevoiture, {x = -492.27, y = -665.76, z = 33.9}, 251.959, function (vehicle)
                                table.insert(dernier, vehicle)
                                FreezeEntityPosition(vehicle, true)
                                TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
                                SetModelAsNoLongerNeeded(modelevoiture)
                                SetVehicleColours(vehicle, 135, 80)

                                RageUI.Text({
                                    message = "~g~Aperçu du véhicule derriere",
                                        time_display = 3000
                                    }) 
                                end)
                            end
                        end, RMenu:Get('tookie', 'panto'))
    
                
                    RageUI.ButtonWithStyle("Louer un faggio", "Appuyez pour louer ce ~r~véhicule", {RightLabel = "→→"},true, function(Hovered, Active, Selected)
                         if (Selected) then
                                    modelevoiture = "faggio"
                                    enlever_veh()
                                    chargementvoiture(modelevoiture)
                    
                                    ESX.Game.SpawnLocalVehicle(modelevoiture, {x = -492.27, y = -665.76, z = 33.9}, 251.959, function (vehicle)
                                    table.insert(dernier, vehicle)
                                    FreezeEntityPosition(vehicle, true)
                                    TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
                                    SetModelAsNoLongerNeeded(modelevoiture)
                                    SetVehicleColours(vehicle, 135, 80)

                                    RageUI.Text({
                                        message = "~g~Aperçu du véhicule derriere",
                                            time_display = 3000
                                        })        
                                    end)
                                end
                            end, RMenu:Get('tookie', 'faggio'))

                end, function()
                end)
            
            RageUI.IsVisible(RMenu:Get('tookie', 'blista'), true, true, true, function()
                    RageUI.Separator("~p~Blista")
                    RageUI.ButtonWithStyle("Prix de la location : ~r~".. prix_trois.."$", nil, {RightLabel = nil}, true, function(h, a, s)
                    end)
                    RageUI.ButtonWithStyle("Louer la blista", nil, {RightLabel = "→→"}, true, function(h, a, s)
                        if s then 
                            location("blista", 200)
                            local veh,dist4 = ESX.Game.GetClosestVehicle(playerCoords)
                            if dist4 < 10 then
                                DeleteEntity(veh)
                            end 
                            tookie = false
                            RageUI.CloseAll()
                        end
                    end)
                end, function()
                end)

            RageUI.IsVisible(RMenu:Get('tookie', 'panto'), true, true, true, function()
                    RageUI.Separator("~p~Panto")
                    RageUI.ButtonWithStyle("Prix de la location : ~r~".. prix_deux.."$", nil, {RightLabel = nil}, true, function(h, a, s)
                    end)
                    RageUI.ButtonWithStyle("Louer la blista", nil, {RightLabel = "→→"}, true, function(h, a, s)
                        if s then 
                            location("panto", 300)
                            local veh,dist4 = ESX.Game.GetClosestVehicle(playerCoords)
                            if dist4 < 10 then
                                DeleteEntity(veh)
                            end 
                            tookie = false
                            RageUI.CloseAll()
                        end
                    end)
                end, function()
                end)

            RageUI.IsVisible(RMenu:Get('tookie', 'faggio'), true, true, true, function()
                    RageUI.Separator("~p~Faggio")
                    RageUI.ButtonWithStyle("Prix de la location : ~r~".. prix_un.."$", nil, {RightLabel = nil}, true, function(h, a, s)
                    end)
                    RageUI.ButtonWithStyle("Louer la blista", nil, {RightLabel = "→→"}, true, function(h, a, s)
                        if s then 
                            location("faggio", 150)
                            local veh,dist4 = ESX.Game.GetClosestVehicle(playerCoords)
                            if dist4 < 10 then
                                DeleteEntity(veh)
                            end 
                            tookie = false
                            RageUI.CloseAll()
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
        local dest = vector3(-492.4, -670.11, 32.91)
        local distance = GetDistanceBetweenCoords(pos, dest, true)

        if distance > 5 then
            interval = 200
            RageUI.CloseAll()
        else
            interval = 1
            if distance < 4.5 then 
                DrawMarker(2, -492.4, -670.11, 32.91, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 233, 9, 255, 170, 0, 1, 2, 0, nil, nil, 0)
            end
                if distance < 1 then   
                HelpNotification("Appuyez sur [~b~E~s~] pour accéder au menu !")
                if IsControlJustPressed(1, 51) then
                    openMenu()
                    
                end
                
            end
        end
        Citizen.Wait(interval)
    end
end)

function chargementvoiture(modelHash)
	modelHash = (type(modelHash) == 'number' and modelHash or GetHashKey(modelHash))

	if not HasModelLoaded(modelHash) then
		RequestModel(modelHash)

		BeginTextCommandBusyString('STRING')
		AddTextComponentSubstringPlayerName('shop_awaiting_model')
		EndTextCommandBusyString(4)

		while not HasModelLoaded(modelHash) do
			Citizen.Wait(1)
			DisableAllControlActions(0)
		end

		RemoveLoadingPrompt()
	end
end


position_blip = {
    {pos = vector3(-492.46, -670.31, 32.91)}
}

Citizen.CreateThread(function()
	for k,v in pairs(position_blip) do
        local blip = AddBlipForCoord(v.pos)
        SetBlipSprite (blip, 595)
        SetBlipScale  (blip, 0.8)
        SetBlipColour (blip, 2)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName('STRING')
        AddTextComponentSubstringPlayerName('~r~Location')
        EndTextCommandSetBlipName(blip)
    end
end)


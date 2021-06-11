-----------------------------
--        by Tookie        --
-----------------------------


ESX = nil

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




local tookie = false
RMenu.Add("tookie", "main", RageUI.CreateMenu("~p~Nom du serveur Roleplay","~b~Bon jeu"))
RMenu:Get('tookie', 'main').Closed = function()
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
                RageUI.Separator("↓ ~b~Gouvernement ~s~↓")

                RageUI.ButtonWithStyle("Carte d'identité", nil, {RightLabel = "→→"},true, function(h, a, s)
                    if s then
                        TriggerServerEvent("tookie:idcard", 100)
                        RageUI.CloseAll()
                        tookie = false
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
        local dest = vector3(-517.24, -251.48, 35.67)
        local distance = GetDistanceBetweenCoords(pos, dest, true)

        if distance > 5 then
            interval = 200
            RageUI.CloseAll()
        else
            interval = 1
            if distance < 5.5 then 
                DrawMarker(2, -517.24, -251.48, 35.67, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 233, 9, 255, 170, 0, 1, 2, 0, nil, nil, 0)
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


position_blip = {
    {pos = vector3(-517.24, -251.48, 35.67)}
}

Citizen.CreateThread(function()
	for k,v in pairs(position_blip) do
        local blip = AddBlipForCoord(v.pos)
        SetBlipSprite (blip, 498)
        SetBlipScale  (blip, 0.8)
        SetBlipColour (blip, 3)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName('STRING')
        AddTextComponentSubstringPlayerName('~r~Carte d\'identité')
        EndTextCommandSetBlipName(blip)
    end
end)

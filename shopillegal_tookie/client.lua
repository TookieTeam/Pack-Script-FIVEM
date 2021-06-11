-- ##################################
-- #######       BY TOOKIE      #####
-- ##################################
print("^0======================================================================^7")
print("Shop Illégal")
print("Crée par Tookie")
print("^0======================================================================^7")

ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(100)
	end
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)


------------------------------------------------------------------------------------------|
-----------------------------    -Création du menu & Sous Menu ---------------------------|
------------------------------------------------------------------------------------------|

RMenu.Add('shopillegal','main', RageUI.CreateMenu("Shop Illegals","Frère d'épeche toi d'acheter"))
RMenu.Add('shopillegal','Objet Illégal', RageUI.CreateSubMenu(RMenu:Get('shopillegal','main'),"Objet Illegal", "Vasi choisi bien"))
RMenu.Add('shopillegal','Accéssoire Illégal', RageUI.CreateSubMenu(RMenu:Get('shopillegal','main'),"Accéssoire Illegal", "J'ai de tout frère"))
RMenu.Add('shopillegal','Boutique Illégal', RageUI.CreateSubMenu(RMenu:Get('shopillegal','main'),"BoutiqueIllegal", "Crypto money "))

Citizen.CreateThread(function()
    local cooldown = false
    local   cooldown2 = false
    local  cooldown3 = false
    while true do
        RageUI.IsVisible(RMenu:Get('shopillegal','main'), true, true, true, function()
        
            RageUI.Button("Objet Illégal", "Braquage de banque ou autres j'ai tout se que ta besoin", {RightLabel = "→→→"},true, function()
            end, RMenu:Get('shopillegal','Objet Illégal'))
        
            RageUI.Button("Accéssoire Illégal", "Jumelle pillule de l'oublie j'ai tout !!", {RightLabel = "→→→"},true, function()
            end, RMenu:Get('shopillegal','Accéssoire Illégal'))

        if  Config.Crypto == true then
            RageUI.Button("Boutique Illégal", "~p~Moyen de payment ~r~Crypto", {RightLabel = "→→→"},true, function()
              end, RMenu:Get('shopillegal','Boutique Illégal'))
        end
            
        end, function()   
        end)

        RageUI.IsVisible(RMenu:Get('shopillegal','Objet Illégal'), true, true, true, function()

            RageUI.Button("Ordinateur", "cela te servira pour la banque (hack)", {RightLabel = " ~r~20 000$ ~g~→→→"},true,function(h,a,s)
                if s then
                    TriggerServerEvent('tookie:buyPc')
                end
            end)

        end, function() -- fin du bouton

            
        
        
        end) -- fin du sous menu

        RageUI.IsVisible(RMenu:Get('shopillegal','Accéssoire Illégal'), true, true, true, function()
            
                RageUI.Button("Chargeur", "Chargeur universel", {RightLabel = " ~r~5000$ ~g~→→→"},true,function(h,a,s)
                    if s then
                        TriggerServerEvent('tookie:buyClip')
                    end
                end)


                RageUI.Button("Jumelles", "Bien pour observer des lieux chaud de loin ;)", {RightLabel = " ~r~5000$ ~g~→→→"},true,function(h,a,s)
                    if s then
                        TriggerServerEvent('tookie:buyJumelles')
                    end
                end)
            end, function() -- fin du bouton
            
            
            end,1) -- fin du sous menu

         -- Article payable en crypto ci-dessous
            RageUI.IsVisible(RMenu:Get('shopillegal','Boutique Illégal'), true, true, true, function()

                RageUI.Button("~b~10x → ~c~Ordinateur", "cela te servira pour la banque (hack)", {RightLabel = " ~p~5$ CryptoMoney~g~→→→"},not cooldown,function(h,a,s)
                    if s then
                        TriggerServerEvent('tookie:buyDivPc')
                        cooldown  = true
                        Citizen.SetTimeout(3600000, function()--3600000,
                            cooldown = false
                        end)
                    end
                end)

                RageUI.Button("~b~25x → ~c~ Chargeur", "Chargeur universel", {RightLabel = " ~p~5 CryptoMoney ~g~→→→"},not cooldown2,function(h,a,s)
                    if s then
                        TriggerServerEvent('tookie:buyDivClip')
                        cooldown2 = true
                        Citizen.SetTimeout(3600000, function()--3600000,
                            cooldown2 = false
                        end)
                    end
                end)

                RageUI.Button("~b~1x → ~c~Jumelles", "Bien pour observer des lieux chaud de loin ;)", {RightLabel = " ~p~1 CryptoMoney ~g~→→→"},not cooldown3,function(h,a,s)
                    if s then
                        TriggerServerEvent('tookie:buyDivJumelles')
                        cooldown3  = true
                        Citizen.SetTimeout(3600000, function()--3600000,
                            cooldown3 = false
                        end)
                    end
                end)

            end, function()
            end,1)


            Citizen.Wait(0)
        end
    end)



----------------------------------------- Position du Menu ----------------------------------------------------------

-- Variable

local pos = {
    {x = 970.77, y= -2405.43, z= 31.49}
}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        
        for k in pairs(pos) do
            local coordsmark = vector3(970.77, -2405.43, 31.49)
            local plyCoords = GetEntityCoords(GetPlayerPed(-1),false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pos[k].x, pos[k].y, pos[k].z)
            
        if dist <= 5.0 then
                if ESX.PlayerData.job and ESX.PlayerData.job.name ==  'police' then 
                    -- Tout les personne portant le job police ne peut pas accedez ni voir le point du shop
                 else
                    if dist <= 5.0 then
                        DrawMarker(2, coordsmark, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 233, 9, 255, 170, 0, 1, 2, 0, nil, nil, 0)
                 
                     end
        
                    if dist <= 1.0 then
                            
                    
                

                         RageUI.Text({
                         message = "Appuyez sur [~b~E~w~] pour toquer discrètement a la ~b~porte.",
                         time_display = 1
                        })
                        if IsControlJustPressed(1,51) then
        
                        RageUI.Visible(RMenu:Get('shopillegal','main'), not RageUI.Visible(RMenu:Get('shopillegal','main')))
                        end
                    end 
                end
            end
        end
    end
end)

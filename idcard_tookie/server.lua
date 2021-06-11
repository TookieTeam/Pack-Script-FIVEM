-----------------------------
--        by Tookie        --
-----------------------------


ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


RegisterNetEvent('tookie:idcard')
AddEventHandler('tookie:idcard', function(prix)
	local xPlayer = ESX.GetPlayerFromId(source)
	local playerMoney = xPlayer.getMoney()
	local limite = 1
	local inv = xPlayer.getInventoryItem("idcard").count

	if playerMoney >= prix and inv < limite then
		xPlayer.removeMoney(prix)
        xPlayer.addInventoryItem("idcard", 1)
		TriggerClientEvent('esx:showAdvancedNotification', source, 'Nom du serveur  Roleplay', '~g~Gouvernement', 'Bon jeu sur ~p~Nom du serveur !', 'CHAR_SOCIAL_CLUB', 30)
	else
		TriggerClientEvent('esx:showNotification', source, "~r~Vous avez trop de cartes ou pas assez d'argents !")
	end
end)
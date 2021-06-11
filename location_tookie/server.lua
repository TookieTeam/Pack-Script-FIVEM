
-----------------------------
--        by Tookie        --
-----------------------------

ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


RegisterNetEvent('tookie:location')
AddEventHandler('tookie:location', function(prix)
	local xPlayer = ESX.GetPlayerFromId(source)
	local playerMoney = xPlayer.getMoney()

	if playerMoney >= prix then
		xPlayer.removeMoney(prix)
		TriggerClientEvent('esx:showAdvancedNotification', source, 'Nom du serveur Roleplay', '~g~Location de véhicule', 'Bonne route sur ~p~Nom du serveur !', 'CHAR_SOCIAL_CLUB', 30)
	else
		TriggerClientEvent('esx:showNotification', source, "~r~Vous n'avez pas assez !")
	end
end)

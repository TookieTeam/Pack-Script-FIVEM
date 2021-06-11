-----------------------------
--        by Tookie        --
-----------------------------


ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('tookie:msg')
AddEventHandler('tookie:msg',function()
    TriggerClientEvent('esx:showAdvancedNotification', source, 'Nom du serveur  Roleplay', '~g~TryYourCar', '~g~ Vous avez une minute !!', 'CHAR_PEGASUS_DELIVERY', 1)
end)


RegisterNetEvent('tookie:msg2')
AddEventHandler('tookie:msg2',function()
    TriggerClientEvent('esx:showAdvancedNotification', source, 'Nom du serveur  Roleplay', '~g~TryYourCar', '~g~ Vous avez une 30 sec !!', 'CHAR_PEGASUS_DELIVERY', 1)
end)

RegisterNetEvent('tookie:msg3')
AddEventHandler('tookie:msg3',function()
    TriggerClientEvent('esx:showAdvancedNotification', source, 'Nom du serveur  Roleplay', '~g~TryYourCar', '~o~ Vous avez une 10 sec !!', 'CHAR_PEGASUS_DELIVERY', 1)
end)
RegisterNetEvent('tookie:msg4')
AddEventHandler('tookie:msg4',function()
    TriggerClientEvent('esx:showAdvancedNotification', source, 'Nom du serveur  Roleplay', '~g~TryYourCar', '~r~ Vous avez une 5 sec !!', 'CHAR_PEGASUS_DELIVERY', 1)
end)

RegisterNetEvent('tookie:endmsg')
AddEventHandler('tookie:endmsg',function()
    TriggerClientEvent('esx:showAdvancedNotification', source, 'Nom du serveur  Roleplay', '~g~TryYourCar', '~r~ Alors elle est comment ??', 'CHAR_PEGASUS_DELIVERY', 1)
end)
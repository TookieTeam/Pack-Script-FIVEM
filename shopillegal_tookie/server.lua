ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
---------------------------------- création du payment de chaque items ^^-------------------


RegisterNetEvent('tookie:buyPc')
AddEventHandler('tookie:buyPc',function()

 ------- Variable ----
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 20000
    local blackMoney = xPlayer.getAccount('black_money')

    if blackMoney.money >= price then
        xPlayer.removeAccountMoney('black_money', price)
        xPlayer.addInventoryItem('net_cracker',1)
        TriggerClientEvent('esx:showAdvancedNotification', source, 'Nom du serveur  Roleplay', '~g~Jeffrey', '~g~ Vasi tien ~r~maintenant casse toi vite !!', 'CHAR_LESTER_DEATHWISH', 1)
    else

        TriggerClientEvent('esx:showAdvancedNotification', source, 'Nom du serveur  Roleplay', '~g~Jeffrey', '~r~ Vasi casse toi le pauvre tu va me griller et revien avec de l\'argent (sale) la prochaine fois!!', 'CHAR_LESTER_DEATHWISH', 1)
       -- TriggerClientEvent('esx:showNotification', source, "~r~ Vasi casse toi le pauvre tu va me griller et revien avec de l'argent (sale) la prochaine fois!!")
    end
end)



RegisterNetEvent('tookie:buyClip')
AddEventHandler('tookie:buyClip',function()


 ------- Variable ----
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 5000
    local blackMoney = xPlayer.getAccount('black_money')
 
     if blackMoney.money >= price then
        xPlayer.removeAccountMoney('black_money', price)
        xPlayer.addInventoryItem('clip',1)
        TriggerClientEvent('esx:showAdvancedNotification', source, 'Nom du serveur  Roleplay', '~g~Jeffrey', '~g~ Vasi tien ~r~maintenant casse toi vite !!', 'CHAR_LESTER_DEATHWISH', 1)
    else
        TriggerClientEvent('esx:showAdvancedNotification', source, 'Nom du serveur  Roleplay', '~g~Jeffrey', '~r~ Vasi casse toi le pauvre tu va me griller et revien avec de l\'argent (sale) la prochaine fois!!', 'CHAR_LESTER_DEATHWISH', 1)
        --TriggerClientEvent('esx:showNotification', source, "~r~ Vasi casse toi le pauvre tu va me griller et revien avec de l'argent (sale) la prochaine fois!!")
    end
end)



RegisterNetEvent('tookie:buyJumelles')
AddEventHandler('tookie:buyJumelles',function()

 ------- Variable ----
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 5000
    local blackMoney = xPlayer.getAccount('black_money')
 
     if blackMoney.money >= price then
        xPlayer.removeAccountMoney('black_money', price)
        xPlayer.addInventoryItem('jumelles',1)
        TriggerClientEvent('esx:showAdvancedNotification', source, 'Nom du serveur  Roleplay', '~g~Jeffrey', '~g~ Vasi tien ~r~maintenant casse toi vite !!', 'CHAR_LESTER_DEATHWISH', 1)
    else
        TriggerClientEvent('esx:showAdvancedNotification', source, 'Nom du serveur  Roleplay', '~g~Jeffrey', '~r~ Vasi casse toi le pauvre tu va me griller et revien avec de l\'argent (sale) la prochaine fois!!', 'CHAR_LESTER_DEATHWISH', 1)
      --  TriggerClientEvent('esx:showNotification', source, "~r~ Vasi casse toi le pauvre tu va me griller et revien avec de l'argent (sale) la prochaine fois!!")
    end
end)

---------------------------  COINS --------------------------------------------------

RegisterNetEvent('tookie:buyDivPc')
AddEventHandler('tookie:buyDivPc',function()

 ------- Variable ----
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 5
    local xitem = xPlayer.getInventoryItem("CrypoItemName").count
 
    if xitem >= price then
        xPlayer.removeInventoryItem("CrypoItemName", price)
        xPlayer.addInventoryItem('net_cracker',10)
        TriggerClientEvent('esx:showAdvancedNotification', source, 'Nom du serveur  Roleplay', '~g~Jeffrey', '~g~ Wah putain de la cryptomoney va me falloir une heure pour convertir sa revien dans une heure pour une autre fournée', 'CHAR_LESTER_DEATHWISH', 1)
    else

        TriggerClientEvent('esx:showAdvancedNotification', source, 'Nom du serveur  Roleplay', '~g~Jeffrey', '~r~ Vasi casse toi le pauvre tu va me griller et revien avec des CryptoMoney la prochaine fois!!', 'CHAR_LESTER_DEATHWISH', 1)
       -- TriggerClientEvent('esx:showNotification', source, "~r~ Vasi casse toi le pauvre tu va me griller et revien avec de l'argent (sale) la prochaine fois!!")
    end
end)



RegisterNetEvent('tookie:buyDivClip')
AddEventHandler('tookie:buyDivClip',function()


 ------- Variable ----
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 5
    local xitem = xPlayer.getInventoryItem("CrypoItemName").count
 
    if xitem >= price then
        xPlayer.removeInventoryItem("CrypoItemName", price)
        xPlayer.addInventoryItem('clip',25)
        TriggerClientEvent('esx:showAdvancedNotification', source, 'Nom du serveur  Roleplay', '~g~Jeffrey', '~g~ Wah putain de la cryptomoney va me falloir une heure pour convertir sa revien dans une heure pour une autre fournée', 'CHAR_LESTER_DEATHWISH', 1)
    else
        TriggerClientEvent('esx:showAdvancedNotification', source, 'Nom du serveur  Roleplay', '~g~Jeffrey', '~r~ Vasi casse toi le pauvre tu va me griller et revien avec des CryptoMoney la prochaine fois!!', 'CHAR_LESTER_DEATHWISH', 1)
        --TriggerClientEvent('esx:showNotification', source, "~r~ Vasi casse toi le pauvre tu va me griller et revien avec de l'argent (sale) la prochaine fois!!")
    end
end)



RegisterNetEvent('tookie:buyDivJumelles')
AddEventHandler('tookie:buyDivJumelles',function()

 ------- Variable ----
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 1
    local xitem = xPlayer.getInventoryItem("CrypoItemName").count
 
    if xitem >= price then
        xPlayer.removeInventoryItem("CrypoItemName", price)
        xPlayer.addInventoryItem('jumelles',1)
        TriggerClientEvent('esx:showAdvancedNotification', source, 'Nom du serveur  Roleplay', '~g~Jeffrey', '~g~ Wah putain de la cryptomoney va me falloir une heure pour convertir sa revien dans une heure pour une autre fournée !!', 'CHAR_LESTER_DEATHWISH', 1)
    else
        TriggerClientEvent('esx:showAdvancedNotification', source, 'Nom du serveur  Roleplay', '~g~Jeffrey', '~r~ Vasi casse toi le pauvre tu va me griller et revien avec des CryptoMoney la prochaine fois!!', 'CHAR_LESTER_DEATHWISH', 1)
      --  TriggerClientEvent('esx:showNotification', source, "~r~ Vasi casse toi le pauvre tu va me griller et revien avec de l'argent (sale) la prochaine fois!!")
    end
end)



-------------------------------------

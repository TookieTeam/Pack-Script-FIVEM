-- ---------------------------- --
--      SKYX alias TOOKIE       --
----------------------------------


TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterCommand('discord', function(source)

        TriggerClientEvent('esx:showNotification', -1, "~r~Voici le lien du discord ---> votre discord.gg/####")


     
end)




RegisterCommand('reboot', function(source)

    TriggerClientEvent('esx:showNotification', -1, "~g~[REBOOT] 18h00 & 06h00")


 
end)

RegisterCommand('tutohelp', function(source)

    TriggerClientEvent('esx:showNotification', -1, "~p~[EXEMPLE] Report ----> /report id raison ")


 
end)

RegisterCommand('boutique', function(source)

    TriggerClientEvent('esx:showNotification', -1, "~y~Voici le lien du Boutique ---> https://boutiquerp.fr")


 
end)

RegisterCommand('staffonline', function(source)

    TriggerClientEvent('esx:showNotification', -1, "~b~ Staff en service !!")


 
end)




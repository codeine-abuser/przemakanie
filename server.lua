ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

damophone = "phone" -- nazwa itemku telefonu / default to phone wiec nie ruszaj lepiej

isisFeedMherehere = 1 -- 0 jesli nie masz feedm

servername = "servername" -- no nazwa serwera

RegisterServerEvent('damo:noichujmokro')
AddEventHandler('damo:noichujmokro', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local telefon = xPlayer.getInventoryItem(damophone).count
    local money = xPlayer.getMoney()
    local dirty_money = xPlayer.getAccount('black_money').money
    if telefon > 0 then
        xPlayer.removeInventoryItem(damophone, telefon)
        if isFeedMhere == 1 then
            TriggerClientEvent("esx:showAdvancedNotification", source, servername, "Informacja", "Zalałeś swój telefon!", CustomLogo, 7500, primary)
        else
            TriggerClientEvent('esx:showNotification', source, 'Zalałeś swój telefon!')
        end
    end
    if money > 0 then
        xPlayer.removeMoney(money)
        if isFeedMhere == 1 then
            TriggerClientEvent("esx:showAdvancedNotification", source, servername, "Informacja", "Przemokły Ci pieniądze, straciłeś ~g~$"..money.."", CustomLogo, 7500, primary)
        else
            TriggerClientEvent('esx:showNotification', source, "Przemokły Ci pieniądze, straciłeś ~g~$"..money.."")
        end
    end
    if dirty_money > 0 then
        xPlayer.removeAccountMoney('black_money', dirty_money)
        if isFeedMhere == 1 then
            TriggerClientEvent("esx:showAdvancedNotification", source, servername, "Informacja", "Przemokły Ci brudne pieniądze, straciłeś ~r~$"..dirty_money.."", CustomLogo, 7500, primary)
        else
            TriggerClientEvent('esx:showNotification', source, "Przemokły Ci brudne pieniądze, straciłeś ~r~$"..dirty_money.."")
        end
    end
end)

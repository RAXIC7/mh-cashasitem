local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('mh-cashasitem:server:updateCash', function(id, amount, mode)
    local Player = QBCore.Functions.GetPlayer(id)
    if Player then
        local cash = Player.Functions.GetMoney("cash")
        if mode == 'add' then
            Player.Functions.SetMoney("cash", amount, nil) 
        elseif mode == "remove" and cash >= amount then 
            Player.Functions.RemoveMoney("cash", amount, nil) 
        end
    end
end)

RegisterNetEvent('mh-cashasitem:server:updateItem', function(type, amount, set, reason)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player and tostring(type) == 'cash' then
        if tostring(set) == "add" then
            Player.Functions.AddItem(Config.MoneyItem, amount, reason)
        elseif tostring(set) == "remove" then 
            Player.Functions.RemoveItem(Config.MoneyItem, amount, reason) 
        end
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.MoneyItem], set, amount)
    end
end)

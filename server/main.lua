local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('mh-cashasitem:server:update', function(type, amount, set, reason)
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    if Player and tostring(type) == 'cash' then
        if tostring(set) == "add" then Player.Functions.AddItem(Config.MoneyItem, amount, reason) end
        if tostring(set) == "remove" then Player.Functions.RemoveItem(Config.MoneyItem, amount, reason) end
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.MoneyItem], set, amount)
    end
end)
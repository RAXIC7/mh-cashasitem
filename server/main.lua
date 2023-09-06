local QBCore = exports['qb-core']:GetCoreObject()

local useCashAsItem = true -- true if you want to use cash as item
local cashItem = "cash"    -- the cash item for the inventory

RegisterNetEvent('mh-cashasitem:server:updateCash', function(id, amount, mode)
    local Player = QBCore.Functions.GetPlayer(id)
    if Player and useCashAsItem then
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
    if Player and tostring(type) == 'cash' and useCashAsItem then
        if tostring(set) == "add" then
            Player.Functions.AddItem(cashItem, amount, reason)
        end
        if tostring(set) == "remove" then 
            Player.Functions.RemoveItem(cashItem, amount, reason) 
        end
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[cashItem], set, amount)
    end
end)

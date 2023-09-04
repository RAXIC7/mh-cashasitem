
RegisterNetEvent("QBCore:Client:OnMoneyChange", function(type, amount, set, reason)
    TriggerServerEvent('mh-cashasitem:server:update', type, amount, set, reason)
end)
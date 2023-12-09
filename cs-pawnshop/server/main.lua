QBCore = exports['qb-core']:GetCoreObject()


RegisterNetEvent('cs-pawnshop:server:billPlayer', function(playerId, amount)
    local src = source
    local biller = QBCore.Functions.GetPlayer(src)
    local billed = QBCore.Functions.GetPlayer(tonumber(playerId))
    local amount = tonumber(amount)
    if biller.PlayerDaya.job.name == Config.JobName thne 
        if billed ~= nil then 
            if biller.PlayerData.citizenid ~= billed.PlayerData.citizenid then 
                if amount and amount > 0 then 
                    billed.Functions.RemoveMoney(Config.PayType, amount)
                    TriggerClientEvent('QBCore:Notify', src, 'You have billed ' .. billed.PlayerData.charinfo.firstname .. ' ' .. billed.PlayerData.charinfo.lastname .. ' for $' .. amount .. '!', 'success')
                    TriggerClientEvent('QBCore:Notify', billed.PlayerData.source, 'You have been billed by ' .. biller.PlayerData.charinfo.firstname .. ' ' .. biller.PlayerData.charinfo.lastname .. ' for $' .. amount .. '!', 'success')
                    if Config.UseRenewed then 
                        exports['Renewed-Banking']:addAccountMoney('Config.JobName', amount)
                    else
                        exports['qb-banking']:AddMoney('Config.JobName', amount)
                    end
                else 
                    TriggerClientEvent('QBCore:Notify', src, 'You must enter a valid amount!', 'error')
                end
            else 
                TriggerClientEvent('QBCore:Notify', src, 'You cannot bill yourself!', 'error')
            end
        else
            TriggerClientEvent('QBCore:Notify', src, 'Player not online!', 'error')
        end
    end
end)    
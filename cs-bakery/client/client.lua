local QBCore = exports['qb-core']:GetCoreObject()

local onDuty = false

Create.CreateThread(function()
    bakery = AddBlipForCoord(Config.Blip)
    SetBlipSprite (uwu, 463)
    SetBlipDisplay(bakery, 4)
    SetBlipScale  (bakery, 0.9)
    SetBlipAsShortRange(bakery, true)
    SetBlipColour(bakery, 34)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName("Bakery")
    EndTextCommandSetBlipName(bakery)
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
            if PlayerData.Job.onduty then 
                if Player.Data.job.name == Config.JobName then
                    TriggerServerEvent('QBCore:ToggleDuty')
                end
            end
        end
    end)
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
    onDuty = duty
end)

RegisterNetEvent('cs-bakery:openShop')
AddEventHandler('cs-bakery:openShop', function()
    TriggerServerEvent("inventory:server:OpenInventory", "shop", "bakeryshop", Config.Items)
end)

RegisterNetEvent('cs-bakery:tray')
AddEventHandler('cs-bakery:tray', function()
    TriggerEvent("inventory:client:SetCurrentStash", "bakerytray")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "bakerytray", {
        maxweight = 10000,
        slots = 6,
    })
end)

RegisterNetEvent('cs-bakery:Storage')
AddEventHandler('cs-bakery:Storage', function()
    TriggerEvent("inventory:client:SetCurrentStash", "bakery")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "bakery", {
        maxweight = 10000,
        slots = 20,
    })
end)

RegisterNetEvent('cs-bakery:Storage2')
AddEventHandler('cs-bakery:Storage2', function()
    TriggerEvent("inventory:client:SetCurrentStash", "bakery2")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "bakery2", {
        maxweight = 10000,
        slots = 20,
    })
end)

RegisterNetEvent('cs-bakery:makeBoba')
AddEventHandler('cs-bakery:makeBoba', function()
    if onDuty then 
        QBCore.Functions.TriggerCallback('cs-bakery:server:get:ingredientboba', function(hasItems)
            if hasItems then 
                QBCore.Functions.Progress('make_bobadrink', 'Making Boba Drink', 5000, false, true, {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                }, {}, {}, {}, function() -- Done
                    TriggerServerEvent('QBCore:Server:RemoveItem', "plastic_cup", 1)
                    TriggerServerEvent('QBCore:Server:RemoveItem', "bakery_boba", 1)
                    TriggerServerEvent('QBCore:Server:AddItem', "bakery_drink", 1)
                    TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['bakery_bobadrink'], "add")
                    QBCore.Functions.Notify("You made a boba Drink", "success")
                end, function() -- Cancel
                    QBCore.Functions.Notify("Failed", "error")
                end)
            else
                QBCore.Functions.Notify("You dont have the right ingredients", "error")
            end
        end)
    else
        QBCore.Functions.Notify("You are not on duty", "error")
    end
end)

RegisterNetEvent('cs-bakery:makeTea')
AddEventHandler('cs-bakery:makeTea', function()
    if onDuty then 
        QBCore.Functions.TriggerCallback('cs-bakery:server:get:ingredienttea', function(hasItems)
            if hasItems then 
                QBCore.Functions.Progress('make_teadrink', 'Making Tea Drink', 5000, false, true, {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                }, {}, {}, {}, function() -- Done
                    TriggerServerEvent('QBCore:Server:RemoveItem', "plastic_cup", 1)
                    TriggerServerEvent('QBCore:Server:RemoveItem', "bakery_teaflavor", 1)
                    TriggerServerEvent('QBCore:Server:AddItem', "bakery_tea", 1)
                    TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['bakery_tea'], "add")
                    QBCore.Functions.Notify("You made a tea Drink", "success")
                end, function() -- Cancel
                    QBCore.Functions.Notify("Failed", "error")
                end)
            else
                QBCore.Functions.Notify("You dont have the right ingredients", "error")
            end
        end)
    else
        QBCore.Functions.Notify("You are not on duty", "error")
    end
end)

RegisterNetEvent('cs-bakery:makeLatte')
AddEventHandler('cs-bakery:makeLatte', function()
    if onDuty then 
        QBCore.Functions.TriggerCallback('cs-bakery:server:get:ingredientDrink', function(hasItems)
            if hasItems then 
                QBCore.Functions.Progress('make_lattedrink', 'Making Latte Drink', 5000, false, true, {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                }, {}, {}, {}, function() -- Done
                    TriggerServerEvent('QBCore:Server:RemoveItem', "plastic_cup", 1)
                    TriggerServerEvent('QBCore:Server:RemoveItem', "bakery_coffee", 1)
                    TriggerServerEvent('QBCore:Server:RemoveItem', "bakery_milk", 1)
                    TriggerServerEvent('QBCore:Server:AddItem', "bakery_latte", 1)
                    TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['bakery_latte'], "add")
                    QBCore.Functions.Notify("You made a latte Drink", "success")
                end, function() -- Cancel
                    QBCore.Functions.Notify("Failed", "error")
                end)
            else
                QBCore.Functions.Notify("You dont have the right ingredients", "error")
            end
        end)
    else
        QBCore.Functions.Notify("You are not on duty", "error")
    end
end)

RegisterNetEvent('cs-bakery:makeCake')
AddEventHandler('cs-bakery:makeCake', function()
    if onDuty then 
        QBCore.Functions.TriggerCallback('cs-bakery:server:get:ingredientCake', function(hasItems)
            if hasItems then 
                QBCore.Functions.Progress('make_cake', 'Making Cake', 5000, false, true, {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                }, {}, {}, {}, function() -- Done
                    TriggerServerEvent('QBCore:Server:RemoveItem', "bakery_flour", 1)
                    TriggerServerEvent('QBCore:Server:RemoveItem', "bakery_sugar", 1)
                    TriggerServerEvent('QBCore:Server:RemoveItem', "bakery_egg", 1)
                    TriggerServerEvent('QBCore:Server:AddItem', "bakery_cake", 1)
                    TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['bakery_cake'], "add")
                    QBCore.Functions.Notify("You made a cake", "success")
                end, function() -- Cancel
                    QBCore.Functions.Notify("Failed", "error")
                end)
            else
                QBCore.Functions.Notify("You dont have the right ingredients", "error")
            end
        end)
    else
        QBCore.Functions.Notify("You are not on duty", "error")
    end
end)

RegisterNetEvent('cs-bakery:makeCoffee')
AddEventHandler('cs-bakery:makeCoffee', function()
    if onDuty then 
        QBCore.Functions.TriggerCallback('cs-bakery:server:get:ingredientCoffee', function(hasItems)
            if hasItems then 
                QBCore.Functions.Progress('make_coffee', 'Making Coffee', 5000, false, true, {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                }, {}, {}, {}, function() -- Done
                    TriggerServerEvent('QBCore:Server:RemoveItem', "bakery_coffeebeans", 1)
                    TriggerServerEvent('QBCore:Server:RemoveItem', "bakery_coffecup", 1)
                    TriggerServerEvent('QBCore:Server:AddItem', "bakery_coffee", 1)
                    TriggerServerEvent('QBCore:Server:RemoveItem', "bakery_milk", 1)
                    TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['bakery_coffee'], "add")
                    QBCore.Functions.Notify("You made a coffee", "success")
                end, function() -- Cancel
                    QBCore.Functions.Notify("Failed", "error")
                end)
            else
                QBCore.Functions.Notify("You dont have the right ingredients", "error")
            end
        end)
    else
        QBCore.Functions.Notify("You are not on duty", "error")
    end
end)

RegisterNetEvent('cs-bakery:makeDonut')
AddEventHandler('cs-bakery:makeDonut', function()
    if onDuty then 
        QBCore.Functions.TriggerCallback('cs-bakery:server:get:ingredientDonut', function(hasItems)
            if hasItems then 
                QBCore.Functions.Progress('make_donut', 'Making Donut', 5000, false, true, {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                }, {}, {}, {}, function() -- Done
                    TriggerServerEvent('QBCore:Server:RemoveItem', "bakery_flour", 1)
                    TriggerServerEvent('QBCore:Server:RemoveItem', "bakery_sugar", 1)
                    TriggerServerEvent('QBCore:Server:RemoveItem', "bakery_egg", 1)
                    TriggerServerEvent('QBCore:Server:RemoveItem', "bakery_icing", 1)
                    TriggerServerEvent('QBCore:Server:AddItem', "bakery_donut", 1)
                    TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['bakery_donut'], "add")
                    QBCore.Functions.Notify("You made a donut", "success")
                end, function() -- Cancel
                    QBCore.Functions.Notify("Failed", "error")
                end)
            else
                QBCore.Functions.Notify("You dont have the right ingredients", "error")
            end
        end)
    else
        QBCore.Functions.Notify("You are not on duty", "error")
    end
end)


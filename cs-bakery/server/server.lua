local QBCore = exports['qb-core']:GetCoreObject()

-- Drinks
QBCore.Functions.CreateCallBack('cs-bakery:server:get:ingredientboba', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local cup = Player.Functions.GetItemByName('plastic_cup')
    local boba = Player.Functions.GetItemByName('bakery_boba')
    if cup ~= nil and boba ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback("cs-bakery:server:get:ingredienttea", function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local cup = Player.Functions.GetItemByName('plastic_cup')
    local teaflavor = Player.Functions.GetItemByName('bakery_teaflavor')
    if cup ~= nil and teaflavor ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback("cs-bakery:server:get:ingredientDrink", function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local cup = Player.Functions.GetItemByName('plastic_cup')
    local coffee = Player.Functions.GetItemByName('bakery_coffee')
    local milk = Player.Functions.GetItemByName('bakery_milk')
    if cup ~= nil and coffee ~= nil and milk ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback("cs-bakery:server:get:ingredientCoffee", function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local cup = Player.Functions.GetItemByName('coffe_cup')
    local coffebeans = Player.Functions.GetItemByName('bakery_coffebeans')
    local milk = Player.Functions.GetItemByName('bakery_milk')
    if cup ~= nil and coffebeans ~= nil and milk ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

-- Food

QBCore.Functions.CreateCallback("cs-bakery:server:get:ingredientCake", function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local flour = Player.Functions.GetItemByName('bakery_flour')
    local sugar = Player.Functions.GetItemByName('bakery_sugar')
    local egg = Player.Functions.GetItemByName('bakery_egg')
    if flour ~= nil and sugar ~= nil and egg ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback("cs-bakery:server:get:ingredientDonut", function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local flour = Player.Functions.GetItemByName('bakery_flour')
    local sugar = Player.Functions.GetItemByName('bakery_sugar')
    local egg = Player.Functions.GetItemByName('bakery_egg')
    local icing = Player.Functions.GetItemByName('bakery_icing')
    if flour ~= nil and sugar ~= nil and egg ~= nil and icing ~= nil then
        cb(true)
    else
        cb(false)
    end
end)
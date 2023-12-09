Citizen.CreateThread(function()
    exports['qb-target']:AddBoxZone("cs-bakery", vector3(-169.0, 622.0, 114.0), 1.0, 1.0, {
        name="cs-bakery",
        heading=0,
        --debugPoly=true,
        minZ=113.0,
        maxZ=115.0
    }, {
        options = {
            {
                event = "cs-bakery:DutyCheck",
                icon = "fas fa-clipboard",
                label = "Clock In/Out",
                job = Config.JobName,
            },
        },
        distance = 1.5
    })
    exports['qb-target']:AddBoxZone("cs-bakery-vehicle", vector3(-1195.0, -892.0, 14.0), 1.0, 1.0, {
        name="cs-bakery-vehicle",
        heading=0,
        --debugPoly=true,
        minZ=13.0,
        maxZ=15.0
    }, {
        options = {
            {
                event = "cs-bakery:SpawnVehicle",
                icon = "fas fa-car",
                label = "Spawn Vehicle",
                job = Config.JobName,
            },
        },
        distance = 1.5
    })
    exports['qb-target']:AddBoxZone("cs-bakery-storage1", vector3(-1195.0, -892.0, 14.0), 1.0, 1.0, {
        name="cs-bakery-storage1",
        heading=0,
        --debugPoly=true,
        minZ=13.0,
        maxZ=15.0
    }, {
        options = {
            {
                event = "cs-bakery:Storage",
                icon = "fas fa-car",
                label = "Delete Vehicle",
                job = Config.JobName,
            },
        },
        distance = 1.5
    })
    exports['qb-target']:AddBoxZone("cs-bakery-storage2", vector3(-1195.0, -892.0, 14.0), 1.0, 1.0, {
        name="cs-bakery-storage2",
        heading=0,
        --debugPoly=true,
        minZ=13.0,
        maxZ=15.0
    }, {
        options = {
            {
                event = "cs-bakery:Storage2",
                icon = "fas fa-car",
                label = "Delete Vehicle",
                job = Config.JobName,
            },
        },
        distance = 1.5
    })
    exports['qb-target']:AddBoxZone("cs-bakery-shop", vector3(-1195.0, -892.0, 14.0), 1.0, 1.0, {
        name="cs-bakery-shop",
        heading=0,
        --debugPoly=true,
        minZ=13.0,
        maxZ=15.0
    }, {
        options = {
            {
                event = "cs-bakery:openShop",
                icon = "fas fa-car",
                label = "Delete Vehicle",
                job = Config.JobName,
            },
        },
        distance = 1.5
    })
    exports['qb-target']:AddBoxZone("cs-bakery-drinks", vector3(-1195.0, -892.0, 14.0), 1.0, 1.0, {
        name="cs-bakery-drinks",
        heading=0,
        --debugPoly=true,
        minZ=13.0,
        maxZ=15.0
    }, {
        options = {
            {
                event = "cs-bakery:drinkMenu",
                icon = "fas fa-car",
                label = "Delete Vehicle",
                job = Config.JobName,
            },
        },
        distance = 1.5
    })
    exports['qb-target']:AddBoxZone("cs-bakery-cakes", vector3(-1195.0, -892.0, 14.0), 1.0, 1.0, {
        name="cs-bakery-cakes",
        heading=0,
        --debugPoly=true,
        minZ=13.0,
        maxZ=15.0
    }, {
        options = {
            {
                event = "cs-bakery:cakeMenu",
                icon = "fas fa-car",
                label = "Delete Vehicle",
                job = Config.JobName,
            },
        },
        distance = 1.5
    })
    exports['qb-target']:AddBoxZone("cs-bakery-tray", vector3(-1195.0, -892.0, 14.0), 1.0, 1.0, {
        name="cs-bakery-tray",
        heading=0,
        --debugPoly=true,
        minZ=13.0,
        maxZ=15.0
    }, {
        options = {
            {
                event = "cs-bakery:openTray",
                icon = "fas fa-car",
                label = "Delete Vehicle",
                job = Config.JobName,
            },
        },
        distance = 2.0
    })
)

------ Menus ------
RegisterNetEvent('cs-bakery:drinkMenu' function()
    exports['qb-menu']:openMenu({
        {
            header = "Make Coffee",
            txt = "Coffee Cup; Coffee Beans"
            params = {
                event = "cs-bakery:makeCoffee",
            }
        },
        {
            header = "Make Boba Drink",
            txt = "Plastic Cup; Boba",
            params = {
                event = "cs-bakery:makeBoba",
            }
        },
        {
            header = "Make Latte",
            txt = "Plastic Cup; Coffee; Milk"
            params = {
                event = "cs-bakery:makeLatte",
            }
        },
        {
            header = "Close",
            txt = "Close the menu",
            params = {
                event = "qb-menu:client:closeMenu",
            }
        },
    })
end)

RegisterNetEvent('cs-bakery:cakeMenu'function()
    exports['qb-menu']:openMenu({
        {
            header = "Cake Menu",
            isMenuHeader = true,
        },
        {
            header = "Make Cake",
            txt = "Flour; Sugar; Egg",
            params = {
                event = "cs-bakery:makeCake",
            }
        },
        {
            header = "Close",
            txt = "Close the menu",
            params = {
                event = "qb-menu:client:closeMenu",
            }
        },
    })
end)

RegisterNetEvent('cs-bakery:donutMenu', function()
    exports['qb-menu']:openMenu({
        {
            header = "Donut Menu",
            isMenuHeader = true,
        },
        {
            header = "Make Donut",
            txt = "Flour; Sugar; Egg; Icing",
            params = {
                event = "cs-bakery:makeDonut",
            }
        },
        {
            header = "Close",
            txt = "Close the menu",
            params = {
                event = "qb-menu:client:closeMenu",
            }
        },
    })
end)

RegisterNetEvent('cs-bakery:dutyMenu', function()
    exports['qb-menu']:openMenu({
        {
            header = "Duty Menu",
            isMenuHeader = true,
        },
        {
            header = "Clock In/Out",
            txt = "Clock in/out for work",
            params = {
                event = "QBCore:ToggleDuty",
            }
        },
        {
            header = "Close",
            txt = "Close the menu",
            params = {
                event = "qb-menu:client:closeMenu",
            }
        },
    })
end)

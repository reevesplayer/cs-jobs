Citizen.CreateThread(function()
    exports['qb-target']:AddBoxZone("DutyCheck", vector3(1, 1, 1), 1, 1, {
        name="DutyCheck",
        heading=0,
        debugPoly=false,
        minZ=28.0,
        maxZ=30.0
    }, {
        options = {
            {
                event = "QBCore:ToggleDuty",
                icon = "far fa-clipboard",
                label = " Clock In/Out ",
                duty = false,
            },
        },
        job = {"pawnshop"},
        distance = 1.5
    })
    exports['qb-target']:AddBoxZone("Stash", vector3(1, 1, 1), 1, 1, {
        name="Stash",
        heading=0,
        debugPoly=false,
        minZ=28.0,
        maxZ=30.0
    }, {
        options = {
            {
                event = "cs-pawnshop:stash",
                icon = "fas fa-boxes",
                label = "Open Stash",
                duty = true,
            },
        },
        job = {"pawnshop"},
        distance = 1.5
    })
    if not Config.UseJimPayments
        exports['qb-target']:AddBoxZone("Register", vector3(1, 1, 1), 1, 1, {
            name="Register",
            heading=0,
            debugPoly=false,
            minZ=28.0,
            maxZ=30.0
        }, {
            options = {
                {
                    event = "cs-pawnshop:client:openRegister",
                    icon = "fas fa-cash-register",
                    label = "Register",
                    duty = true,
                },
            },
            job = {"pawnshop"},
            distance = 1.5
        })
    end
end)

RegisterNetEvent('cs-pawnshop:client:openRegister', function()
    if not Config.UseJimPayments then 
        if not Config.OX.UseInput then 
            local billMenu = exports['qb-input']:ShowInput({
                header = "Bill Player",
                submitText = "Send Bill",
                inputs = {
                    {
                        text = "Player ID",
                        name = "playerId",
                        type = "text",
                        isRequired = true,
                    },
                    {
                        text = "Amount",
                        name = "amount",
                        type = "number",
                        isRequired = true,
                    },
                },
            })

            if billMenu ~= nil then 
                if not billMenu.playerID or not billMenu.amount then 
                    return 
                end
                TriggerServerEvent('cs-pawnshop:server:billPlayer', billMenu.playerId, billMenu.amount)
            end
        else
            -- ox logic here
        end
    else
        -- Do nothing for Jim-Payments
    end
end)
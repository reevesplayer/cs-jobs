local QBCore = exports['qb-core']:GetCoreObject()
local Player = QBCore.Functions.GetPlayer 
local onDuty = false 

Citizen.CreateThread(function()
	for _, info in pairs(Config.Blips) do
		info.blip = AddBlipForCoord(info.x, info.y, info.z)
		SetBlipSprite(info.blip, info.id)
		SetBlipDisplay(info.blip, 4)
		SetBlipScale(info.blip, 0.4)
		SetBlipColour(info.blip, info.color)
		SetBlipAsShortRange(info.blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(info.title)
		EndTextCommandSetBlipName(info.blip)
	end
end)

RegisterNetEvent('cs-pawnshop:stash')
AddEventHandler('cs-pawnshop:stash', function()
    if onDuty then 
        TriggerEvent("inventory:client:SetCurrentStash", "stash")
        TriggerServerEvent("inventory:server:OpenInventory", "storage", "stash", {
            maxweight = 4000000,
            slots = 40,
        })
    else
        QBCore.Functions.Notify("You are not on duty..", "error")
    end
end)
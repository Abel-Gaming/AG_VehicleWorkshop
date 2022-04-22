---------- BLIPS ----------
Citizen.CreateThread(function()
    for k,v in pairs(Config.Shops) do
        if v.drawBlip then
            local blip = AddBlipForCoord(v.coord.x, v.coord.y, v.coord.z)
		    SetBlipSprite(blip, v.blipSprite)
		    SetBlipDisplay(blip, 4)
		    SetBlipScale(blip, 1.0)
		    SetBlipColour(blip, v.blipColor)
		    SetBlipAsShortRange(blip, true)
		    BeginTextCommandSetBlipName("STRING")
		    AddTextComponentString(v.name)
		    EndTextCommandSetBlipName(blip)
        end
    end
end)

---------- MENUS ----------
RegisterNetEvent('AG_VehicleWorkshop:EngineMenu')
AddEventHandler('AG_VehicleWorkshop:EngineMenu', function()
	TriggerEvent("nh-context:createMenu", {
        {
            header = "Vehicle Engines",
        },
        {
            header = "",
        },
        {
            header = "Stock Engine",
            event = "AG_VehicleWorkshop:ChangeEngine",
            args = {'Stock'}
        },
        {
            header = "EMS Upgrade, Level 1",
            event = "AG_VehicleWorkshop:ChangeEngine",
            args = {'Level I'}
        },
        {
            header = "EMS Upgrade, Level 2",
            event = "AG_VehicleWorkshop:ChangeEngine",
            args = {'Level II'}
        },
        {
            header = "EMS Upgrade, Level 3",
            event = "AG_VehicleWorkshop:ChangeEngine",
            args = {'Level III'}
        },
        {
            header = "EMS Upgrade, Level 4",
            event = "AG_VehicleWorkshop:ChangeEngine",
            args = {'Level IV'}
        }
    })
end)

---------- SCRIPT LOAD ----------
print('Using vehicle workshop script by AbelGaming#9428')
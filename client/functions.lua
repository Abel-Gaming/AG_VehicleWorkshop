function ShowHelpText(message, makeSound, duration)
	BeginTextCommandDisplayHelp("THREESTRINGS")
	AddTextComponentSubstringPlayerName(message)
    EndTextCommandDisplayHelp(0, false, makeSound, duration)
end

function DrawGroundMarker(x, y, z)
	DrawMarker(25, x, y, z - 1, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 5.0, 5.0, 5.0, 3, 15, 250, 75, false, true, 2, nil, nil, false)
end

function sendChatMessage(message)
	TriggerEvent("chatMessage", "", {0, 0, 0}, "^7" .. message)
end

function SuccessMessage(successMessage)
	SetNotificationTextEntry('STRING')
	AddTextComponentSubstringPlayerName('~g~[SUCCESS]~w~ ' .. successMessage)
	DrawNotification(false, true)
end

function ErrorMessage(errorMessage)
	SetNotificationTextEntry('STRING')
	AddTextComponentSubstringPlayerName('~r~[ERROR]~w~ ' .. errorMessage)
	DrawNotification(false, true)
end

function InfoMessage(message)
	SetNotificationTextEntry('STRING')
	AddTextComponentSubstringPlayerName('~y~[INFO]~w~ ' .. message)
	DrawNotification(false, true)
end

function Draw3DText(x, y, z, scl_factor, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local p = GetGameplayCamCoords()
    local distance = GetDistanceBetweenCoords(p.x, p.y, p.z, x, y, z, 1)
    local scale = (1 / distance) * 2
    local fov = (1 / GetGameplayCamFov()) * 100
    local scale = scale * fov * scl_factor
    if onScreen then
        SetTextScale(0.0, scale)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 215) -- Red, Green, Blue, Alpha (Transparency)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x, _y)
    end
end

------------------- CHANGING PARTS EVENTS -------------------

RegisterNetEvent('AG_VehicleWorkshop:ChangeEngine')
AddEventHandler('AG_VehicleWorkshop:ChangeEngine', function(engineType)
    -- Get the last vehicle
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), true)

    -- Apply the mod kit
    SetVehicleModKit(vehicle, 0)

    if engineType == 'Stock' then
        FreezeEntityPosition(PlayerPedId(), true)
        TaskStartScenarioInPlace(PlayerPedId(), 'PROP_HUMAN_BUM_BIN', 0, true)
        Wait(1000)
        exports['progressBars']:startUI(5 * 1000, "Swapping Engine...")
        Wait(5 * 1000)
        SetVehicleMod(vehicle, 11, -1, false)
        SuccessMessage('Engine has been swapped!')
        ClearPedTasks(PlayerPedId());
        FreezeEntityPosition(PlayerPedId(), false)
    
    elseif engineType == 'Level I' then
        FreezeEntityPosition(PlayerPedId(), true)
        TaskStartScenarioInPlace(PlayerPedId(), 'PROP_HUMAN_BUM_BIN', 0, true)
        Wait(1000)
        exports['progressBars']:startUI(10 * 1000, "Swapping Engine...")
        Wait(10 * 1000)
        SetVehicleMod(vehicle, 11, 0, false)
        SuccessMessage('Engine has been swapped!')
        ClearPedTasks(PlayerPedId());
        FreezeEntityPosition(PlayerPedId(), false)
    
    elseif engineType == 'Level II' then
        FreezeEntityPosition(PlayerPedId(), true)
        TaskStartScenarioInPlace(PlayerPedId(), 'PROP_HUMAN_BUM_BIN', 0, true)
        Wait(1000)
        exports['progressBars']:startUI(15 * 1000, "Swapping Engine...")
        Wait(15 * 1000)
        SetVehicleMod(vehicle, 11, 1, false)
        SuccessMessage('Engine has been swapped!')
        ClearPedTasks(PlayerPedId());
        FreezeEntityPosition(PlayerPedId(), false)
    
    elseif engineType == 'Level III' then
        FreezeEntityPosition(PlayerPedId(), true)
        TaskStartScenarioInPlace(PlayerPedId(), 'PROP_HUMAN_BUM_BIN', 0, true)
        Wait(1000)
        exports['progressBars']:startUI(20 * 1000, "Swapping Engine...")
        Wait(20 * 1000)
        SetVehicleMod(vehicle, 11, 2, false)
        SuccessMessage('Engine has been swapped!')
        ClearPedTasks(PlayerPedId());
        FreezeEntityPosition(PlayerPedId(), false)
    
    elseif engineType == 'Level IV' then
        FreezeEntityPosition(PlayerPedId(), true)
        TaskStartScenarioInPlace(PlayerPedId(), 'PROP_HUMAN_BUM_BIN', 0, true)
        Wait(1000)
        exports['progressBars']:startUI(25 * 1000, "Swapping Engine...")
        Wait(25 * 1000)
        SetVehicleMod(vehicle, 11, 3, false)
        SuccessMessage('Engine has been swapped!')
        ClearPedTasks(PlayerPedId());
        FreezeEntityPosition(PlayerPedId(), false)
    end

    -- Print the type if Debug is enabled
    if Config.EnableDebug then
        print('Installing engine: ' .. engineType)
    end
end)

RegisterNetEvent('AG_VehicleWorkshop:ChangeTire')
AddEventHandler('AG_VehicleWorkshop:ChangeTire', function(tireLocation)
    if tireLocation == 'LF' then
        print('Changed LF')
    
    elseif tireLocation == 'LR' then
        print('Changed LR')
    
    elseif tireLocation == 'RF' then
        print('Changed RF')
    
    elseif tireLocation == 'RR' then
        print('Changed RR')
    end
end)
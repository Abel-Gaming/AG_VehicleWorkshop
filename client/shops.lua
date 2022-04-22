local inShop = false

------ Set inShop to true if inside the radius -----
Citizen.CreateThread(function()
    while not NetworkIsSessionStarted() do
		Wait(500)
	end

    while true do
        Citizen.Wait(500)
        local playerCoords = GetEntityCoords(PlayerPedId())
        for k,v in pairs(Config.Shops) do
            while #(playerCoords - v.coord) <= v.radius and not inShop do
                inShop = true
                if Config.EnableDebug then
                    print('You are now in the radius of a shop')
                end
            end
        end
    end
end)

------ Set inShop to false if away from the radius -----
Citizen.CreateThread(function()
    while not NetworkIsSessionStarted() do
		Wait(500)
	end

    while true do
        Citizen.Wait(500)
        local playerCoords = GetEntityCoords(PlayerPedId())
        for k,v in pairs(Config.Shops) do
            while #(playerCoords - v.coord) >= v.radius and inShop do
                inShop = false
                if Config.EnableDebug then
                    print('You are now out of the radius of a shop')
                end
            end
        end
    end
end)

------ Allow the player to work on their last vehicle if inShop is true -----
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if inShop then
            local vehicle = GetVehiclePedIsIn(PlayerPedId(), true)

            ---------- HOOD ----------
            if DoesEntityExist(vehicle) and not IsPedInAnyVehicle(PlayerPedId(), false) then
                local vehicleHood = GetEntityBoneIndexByName(vehicle, 'engine')

                while #(GetEntityCoords(PlayerPedId()) - GetWorldPositionOfEntityBone(vehicle, vehicleHood)) <= 1.25 do
                    Citizen.Wait(0)
                    Draw3DText(
                        GetWorldPositionOfEntityBone(vehicle, vehicleHood).x, 
                        GetWorldPositionOfEntityBone(vehicle, vehicleHood).y, 
                        GetWorldPositionOfEntityBone(vehicle, vehicleHood).z, 
                        0.75, 
                        'Press ~y~[~g~E~y~]~w~ to repair engine'
                    )
                    if IsControlJustReleased(0, 51) then
                        TriggerEvent('AG_VehicleWorkshop:EngineMenu')
                    end
                end
            end

            ---------- TRUNK ----------
            if DoesEntityExist(vehicle) and not IsPedInAnyVehicle(PlayerPedId(), false) then
                local vehicleExhaust = GetEntityBoneIndexByName(vehicle, 'exhaust')

                while #(GetEntityCoords(PlayerPedId()) - GetWorldPositionOfEntityBone(vehicle, vehicleExhaust)) <= 1.25 do
                    Citizen.Wait(0)
                    Draw3DText(
                        GetWorldPositionOfEntityBone(vehicle, vehicleExhaust).x, 
                        GetWorldPositionOfEntityBone(vehicle, vehicleExhaust).y, 
                        GetWorldPositionOfEntityBone(vehicle, vehicleExhaust).z, 
                        0.75, 
                        'Press ~y~[~g~E~y~]~w~ to repair exhaust'
                    )
                    if IsControlJustReleased(0, 51) then

                    end
                end
            end

            ---------- WHEEL LEFT FRONT ----------
            if DoesEntityExist(vehicle) and not IsPedInAnyVehicle(PlayerPedId(), false) then
                local vehicleWheelLF = GetEntityBoneIndexByName(vehicle, 'wheel_lf')

                while #(GetEntityCoords(PlayerPedId()) - GetWorldPositionOfEntityBone(vehicle, vehicleWheelLF)) <= 1.25 do
                    Citizen.Wait(0)
                    Draw3DText(
                        GetWorldPositionOfEntityBone(vehicle, vehicleWheelLF).x, 
                        GetWorldPositionOfEntityBone(vehicle, vehicleWheelLF).y, 
                        GetWorldPositionOfEntityBone(vehicle, vehicleWheelLF).z, 
                        0.75, 
                        'Press ~y~[~g~E~y~]~w~ to change tire'
                    )
                    if IsControlJustReleased(0, 51) then
                        TriggerEvent('AG_VehicleWorkshop:ChangeTire', 'LF')
                    end
                end
            end

            ---------- WHEEL LEFT REAR ----------
            if DoesEntityExist(vehicle) and not IsPedInAnyVehicle(PlayerPedId(), false) then
                local vehicleWheelLR = GetEntityBoneIndexByName(vehicle, 'wheel_lr')

                while #(GetEntityCoords(PlayerPedId()) - GetWorldPositionOfEntityBone(vehicle, vehicleWheelLR)) <= 1.25 do
                    Citizen.Wait(0)
                    Draw3DText(
                        GetWorldPositionOfEntityBone(vehicle, vehicleWheelLR).x, 
                        GetWorldPositionOfEntityBone(vehicle, vehicleWheelLR).y, 
                        GetWorldPositionOfEntityBone(vehicle, vehicleWheelLR).z, 
                        0.75, 
                        'Press ~y~[~g~E~y~]~w~ to change tire'
                    )
                    if IsControlJustReleased(0, 51) then
                        TriggerEvent('AG_VehicleWorkshop:ChangeTire', 'LR')
                    end
                end
            end

            ---------- WHEEL RIGHT FRONT ----------
            if DoesEntityExist(vehicle) and not IsPedInAnyVehicle(PlayerPedId(), false) then
                local vehicleWheelRF = GetEntityBoneIndexByName(vehicle, 'wheel_rf')

                while #(GetEntityCoords(PlayerPedId()) - GetWorldPositionOfEntityBone(vehicle, vehicleWheelRF)) <= 1.25 do
                    Citizen.Wait(0)
                    Draw3DText(
                        GetWorldPositionOfEntityBone(vehicle, vehicleWheelRF).x, 
                        GetWorldPositionOfEntityBone(vehicle, vehicleWheelRF).y, 
                        GetWorldPositionOfEntityBone(vehicle, vehicleWheelRF).z, 
                        0.75, 
                        'Press ~y~[~g~E~y~]~w~ to change tire'
                    )
                    if IsControlJustReleased(0, 51) then
                        TriggerEvent('AG_VehicleWorkshop:ChangeTire', 'RF')
                    end
                end
            end

            ---------- WHEEL RIGHT REAR ----------
            if DoesEntityExist(vehicle) and not IsPedInAnyVehicle(PlayerPedId(), false) then
                local vehicleWheelRR = GetEntityBoneIndexByName(vehicle, 'wheel_rr')

                while #(GetEntityCoords(PlayerPedId()) - GetWorldPositionOfEntityBone(vehicle, vehicleWheelRR)) <= 1.25 do
                    Citizen.Wait(0)
                    Draw3DText(
                        GetWorldPositionOfEntityBone(vehicle, vehicleWheelRR).x, 
                        GetWorldPositionOfEntityBone(vehicle, vehicleWheelRR).y, 
                        GetWorldPositionOfEntityBone(vehicle, vehicleWheelRR).z, 
                        0.75, 
                        'Press ~y~[~g~E~y~]~w~ to change tire'
                    )
                    if IsControlJustReleased(0, 51) then
                        TriggerEvent('AG_VehicleWorkshop:ChangeTire', 'RR')
                    end
                end
            end
        end
    end
end)
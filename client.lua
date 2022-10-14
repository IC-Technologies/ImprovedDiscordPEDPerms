-------------------------------
--- ImprovedDiscordPedPerms ---
--------IC-Technologies--------
-------------------------------

restrictedPeds = Config.PEDRestrictions;
myRoles = nil;

RegisterNetEvent('ImprovedDiscordPEDPerms:CheckPerms:Return')
AddEventHandler('ImprovedDiscordPEDPerms:CheckPerms:Return', function(roles)
	myRoles = roles;
end)

Citizen.CreateThread(function()
	TriggerServerEvent('ImprovedDiscordPEDPerms:CheckPerms')
    while true do
        Citizen.Wait(2000)
		local PlayerPED = PlayerPedId()

		local modelhashed = GetHashKey(Config.defaultPED)

        -- Request the model, and wait further triggering untill fully loaded.
	    RequestModel(modelhashed)
	    while not HasModelLoaded(modelhashed) do 
	    	RequestModel(modelhashed)
	    	Citizen.Wait(0)
	    end

		local requiredPerm = nil;
		hasPerm = false;

		for role, val in pairs(myRoles) do
			if (val == true) then
				local PEDs = Config.PEDRestrictions[role];
				if (PEDs ~= nil) then
					for i = 1, #PEDs do
						if IsPedModel(PlayerPED, GetHashKey(tostring(PEDs[i]))) then
							requiredPerm = true;
							hasPerm = true;
						end
					end
				end
			end
		end

		if not hasPerm then
			local PEDs = Config.PEDRestrictions;
			for role, PEDList in pairs(PEDs) do
				for i = 1, #PEDList do
					if IsPedModel(PlayerPED, GetHashKey(tostring(PEDList[i]))) then
						requiredPerm = true;
					end
				end
			end
		end

		-- If doesn't have permission, it's a restricted PED to them
		if not hasPerm and (requiredPerm ~=nil) then
			SetPlayerModel(PlayerId(), modelhashed)
			SetModelAsNoLongerNeeded(modelHashed)
			DisplayNotification(Config.RestrictedMessage)
		else
			hasPerm = true;
		end
	end
end)

function DisplayNotification( text )
	if Config.usingTnotify then
		exports['t-notify']:Alert({
			style = 'error',
			message = Config.RestrictedMessage
		})
	else
		SetNotificationTextEntry( "STRING" )
		AddTextComponentString( text )
		DrawNotification( false, false )
	end
end
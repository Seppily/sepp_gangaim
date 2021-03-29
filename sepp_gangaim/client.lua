ESX = nil
Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj)
            ESX = obj
        end)
        Citizen.Wait(0)
    end
    while ESX.GetPlayerData().job2 == nil do
        Citizen.Wait(10)
    end
    PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer   
end))

RegisterNetEvent('sepp_gangaim:aim')
AddEventHandler('sepp_gangaim:aim', function()

local pedxd = GetPlayerPed( -1 )
	
-- Here you can edit the jobs --
if PlayerData.job.name == 'bloods' or PlayerData.job.name == 'crips' or PlayerData.job.name == 'vagos' or PlayerData.job.name == 'grove' then
if ( DoesEntityExist( pedxd ) and not IsEntityDead( pedxd ) ) then 

Citizen.CreateThread( function()
	RequestAnimDict( "combat@aim_variations@1h@gang")
	   while ( not HasAnimDictLoaded( "combat@aim_variations@1h@gang" ) ) do 
                Citizen.Wait( 100 )
            end
				if IsEntityPlayingAnim(pedxd, "combat@aim_variations@1h@gang", "aim_variation_a", 3) then
				ClearPedSecondaryTask(pedxd)
				else
				TaskPlayAnim(pedxd, "combat@aim_variations@1h@gang", "aim_variation_a", 8.0, 2.5, -1, 49, 0, 0, 0, 0 )
            end 
		end )
	end
    end 
end )

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsControlJustPressed(1, 25) then 
            TriggerEvent( 'sepp_gangaim:aim', source )
        end
    end
end)


facutetst = false

RegisterNetEvent('vezidacaarepermisvere')
AddEventHandler('vezidacaarepermisvere', function(are)
	if are == 0 then
		facutetst = true
	elseif are == 1 then
		facutetst = false
	end
end)

function DrawMissionText2(m_text, showtime)
    ClearPrints()
	SetTextEntry_2("STRING")
	AddTextComponentString(m_text)
	DrawSubtitleTimed(showtime, 1)
end


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        if(IsPedInAnyVehicle(GetPlayerPed(-1), false)) and not facutetst then
			DrawMissionText2("~g~Conduci fara permis , mergi la sectie si cheama-ti un Politist", 2000)			
		end
	end
end)
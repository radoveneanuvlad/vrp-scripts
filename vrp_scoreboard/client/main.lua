local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, 
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177, 
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70, 
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

local idVisable = true

Citizen.CreateThread(function()

	Citizen.Wait(2000)
	RegisterNetEvent('vrp_scoreboard:getConnectedPlayers')
	AddEventHandler('vrp_scoreboard:getConnectedPlayers', function(connectedPlayers)
		UpdatePlayerTable(connectedPlayers)
	end)
end)



Citizen.CreateThread(function()
	Citizen.Wait(500)
	SendNUIMessage({
		action = 'updateServerInfo',

		maxPlayers = GetConvarInt('sv_maxclients', 64),
		uptime = 'unknown',
		playTime = '00h 00m'
	})
end)

RegisterNetEvent('vrp_scoreboard:updateConnectedPlayers')
AddEventHandler('vrp_scoreboard:updateConnectedPlayers', function(connectedPlayers)
	UpdatePlayerTable(connectedPlayers)
end)

RegisterNetEvent('vrp_scoreboard:updatePing')
AddEventHandler('vrp_scoreboard:updatePing', function(connectedPlayers)
	SendNUIMessage({
		action  = 'updatePing',
		players = connectedPlayers
	})
end)

RegisterNetEvent('vrp_scoreboard:toggleID')
AddEventHandler('vrp_scoreboard:toggleID', function(state)
	if state then
		idVisable = state
	else
		idVisable = not idVisable
	end

	SendNUIMessage({
		action = 'toggleID',
		state = idVisable
	})
end)

RegisterNetEvent('uptime:tick')
AddEventHandler('uptime:tick', function(uptime)
	SendNUIMessage({
		action = 'updateServerInfo',
		uptime = uptime
	})
end)

function UpdatePlayerTable(connectedPlayers)
	local formattedPlayerList, num = {}, 1
	local ems, police, taxi, mechanic, cardealer, estate, players = 0, 0, 0, 0, 0, 0, 0

	for k,v in pairs(connectedPlayers) do

		if num == 1 then
			table.insert(formattedPlayerList, ('<tr><td>%s</td><td>%s</td><td>%s</td>'):format(v.name, v.id, v.ping))
			num = 2
		elseif num == 2 then
			table.insert(formattedPlayerList, ('<td>%s</td><td>%s</td><td>%s</td></tr>'):format(v.name, v.id, v.ping))
			num = 1
		end

		players = players + 1



		if (v.job == 'Diretor [SAMU]' or v.job == 'Medico [SAMU]' or v.job == 'Enfermeiro [SAMU]' or v.job == 'Paramedico [SAMU]') then
			ems = ems + 1
		elseif (v.job == 'Policia' or v.job == 'Recruta PMESP' or v.job == 'Soldado PMESP' or v.job == 'Cabo PMESP' or v.job == 'Sargento PMESP' or v.job == '1 Sargento PMESP' or v.job == '2 Sargento PMESP' or v.job == '3 Sargento PMESP' or v.job == 'Tenente PMESP' or v.job == '1 Tenente PMESP' or v.job == '2 Tenente PMESP' or v.job == 'Sub Tenente PMESP' or v.job == 'Capitão PMESP' or v.job == 'T.Coronel PMESP' or v.job == 'Major PMESP' or v.job == 'Coronel PMESP' or v.job == 'Rocam PMESP' or v.job == 'Aguia PMESP' or v.job == 'Agente' or v.job == 'Investigador' or v.job == 'Delegado') then
			police = police + 1
		elseif v.job == 'Taxi' then
			taxi = taxi + 1
		elseif v.job == 'Mecanico' then
			mechanic = mechanic + 1
		elseif (v.job == 'Estagiario [ADV]' or v.job == 'Advogado [ADV]' or v.job == 'Presidente [ADV]') then
			cardealer = cardealer + 1
		elseif v.job == 'Reporter' then
			estate = estate + 1
		end
	end

	if num == 1 then
		table.insert(formattedPlayerList, '</tr>')
	end

	SendNUIMessage({
		action  = 'updatePlayerList',
		players = table.concat(formattedPlayerList)
	})

	SendNUIMessage({
		action = 'updatePlayerJobs',
		jobs   = {ems = ems, police = police, taxi = taxi, mechanic = mechanic, cardealer = cardealer, estate = estate, player_count = players}
	})
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if IsControlJustReleased(0, Keys['HOME']) and IsInputDisabled(0) then
			ToggleScoreBoard()
			Citizen.Wait(200)

		-- D-pad up on controllers works, too!
		elseif IsControlJustReleased(0, 172) and not IsInputDisabled(0) then
			ToggleScoreBoard()
			Citizen.Wait(200)
		end
	end
end)

-- Close scoreboard when game is paused
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(300)

		if IsPauseMenuActive() and not IsPaused then
			IsPaused = true
			SendNUIMessage({
				action  = 'close'
			})
		elseif not IsPauseMenuActive() and IsPaused then
			IsPaused = false
		end
	end
end)

function ToggleScoreBoard()
	SendNUIMessage({
		action = 'toggle'
	})
end

Citizen.CreateThread(function()
	local playMinute, playHour = 0, 0

	while true do
		Citizen.Wait(1000 * 60) -- every minute
		playMinute = playMinute + 1
	
		if playMinute == 60 then
			playMinute = 0
			playHour = playHour + 1
		end

		SendNUIMessage({
			action = 'updateServerInfo',
			playTime = string.format("%02dh %02dm", playHour, playMinute)
		})
	end
end)

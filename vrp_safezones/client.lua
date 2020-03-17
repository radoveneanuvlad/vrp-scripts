DG = {}
Tunnel.bindInterface("vRP_safezones",DG)
Proxy.addInterface("vRP_safezones",DG)
vRP = Proxy.getInterface("vRP")
DGserver = Tunnel.getInterface("vRP_safezones","vRP_safezones")

inSafeZone = false
safeZone = nil

safeZones = {
	-- {x, y, z, arie}
	["showroom"] = {-43.726108551026,-1101.1746826172,35.20348739624, 40},
	["spawn"] = {288.35549926758,-1601.2644042968,31.265844345092, 50},
	["spital"] = {-474.73635864258,-327.21185302734,34.370166778564, 40},
	["politie"] = {439.99670410156,-982.80767822266,30.689601898194, 44},
	["swat"] = {-1102.8555908204,-262.93338012696,37.739303588868, 35},
	["tractari"] = {-466.04959106446,-800.80249023438,30.542766571044, 30}
}

function pvp_drawTxt(x,y ,width,height,scale, text, r,g,b,a, outline)
    SetTextFont(0)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    if(outline)then
	    SetTextOutline()
	end
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		
		local playerPos = GetEntityCoords(GetPlayerPed(-1), true)
		local px,py,pz = playerPos.x, playerPos.y, playerPos.z
		
		for i, v in pairs(safeZones)do
			x, y, z = v[1], v[2], v[3]
			radius = v[4]
			if(GetDistanceBetweenCoords(x, y, z,px,py,pz) < radius)then
				inSafeZone = true
				safeZone = i
			end
		end
		if(safeZone ~= nil)then
			x2, y2, z2 = safeZones[safeZone][1], safeZones[safeZone][2], safeZones[safeZone][3]
			radius2 = safeZones[safeZone][4]
			if(GetDistanceBetweenCoords(x2, y2, z2,px,py,pz) > radius2)then
				inSafeZone = false
				safeZone = nil
			end
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		ped = GetPlayerPed(-1)
		if (inSafeZone == true)then
			DisableControlAction(0,24,true)
			DisableControlAction(0,25,true)
			DisableControlAction(0,47,true)
			DisableControlAction(0,58,true)
			DisableControlAction(0,263,true)
			DisableControlAction(0,264,true)
			DisableControlAction(0,257,true)
			DisableControlAction(0,140,true)
			DisableControlAction(0,141,true)
			DisableControlAction(0,142,true)
			DisableControlAction(0,143,true)
			pvp_drawTxt(0.68, 1.44, 1.0,1.0,0.4, "~w~Esti in ~g~SafeZone", 255, 255, 255, 255)
			SetEntityInvincible(ped, true)
			SetPlayerInvincible(PlayerId(), true)
			ClearPedBloodDamage(ped)
			ResetPedVisibleDamage(ped)
			ClearPedLastWeaponDamage(ped)
			SetEntityProofs(ped, true, true, true, true, true, true, true, true)
			SetEntityOnlyDamagedByPlayer(ped, false)
			SetEntityCanBeDamaged(ped, false)
		else
			SetEntityInvincible(ped, false)
			SetPlayerInvincible(PlayerId(), false)
			ClearPedLastWeaponDamage(ped)
			SetEntityProofs(ped, false, false, false, false, false, false, false, false)
			SetEntityOnlyDamagedByPlayer(ped, true)
			SetEntityCanBeDamaged(ped, true)
		end
	end
end)
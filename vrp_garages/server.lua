MySQL = module("vrp_mysql", "MySQL")
local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vRP_garages")
vRPgc = Tunnel.getInterface("vRP_garages","vRP_garages")

--SQL--
MySQL.createCommand("vRP/ply_get_vehicles","SELECT * FROM vrp_user_vehicles WHERE user_id = @user_id")

RegisterServerEvent('ply_garages:CheckForSpawnVeh')
AddEventHandler('ply_garages:CheckForSpawnVeh', function(vehicle)
	local user_id = vRP.getUserId({source})
	local player = vRP.getUserSource({user_id})
	MySQL.query("vRP/ls_customs", {user_id = user_id, vehicle = vehicle}, function(result, affected)
	  vRP.closeMenu({player})
      vRPgc.spawnGarageVehicle(player,{result[1].veh_type,vehicle,result[1].vehicle_plate, result[1].vehicle_colorprimary, result[1].vehicle_colorsecondary, result[1].vehicle_pearlescentcolor, result[1].vehicle_wheelcolor, result[1].vehicle_plateindex, result[1].vehicle_neoncolor1, result[1].vehicle_neoncolor2, result[1].vehicle_neoncolor3, result[1].vehicle_windowtint, result[1].vehicle_wheeltype, result[1].vehicle_mods0, result[1].vehicle_mods1, result[1].vehicle_mods2, result[1].vehicle_mods3, result[1].vehicle_mods4, result[1].vehicle_mods5, result[1].vehicle_mods6, result[1].vehicle_mods7, result[1].vehicle_mods8, result[1].vehicle_mods9, result[1].vehicle_mods10, result[1].vehicle_mods11, result[1].vehicle_mods12, result[1].vehicle_mods13, result[1].vehicle_mods14, result[1].vehicle_mods15, result[1].vehicle_mods16, result[1].vehicle_turbo, result[1].vehicle_tiresmoke, result[1].vehicle_xenon, result[1].vehicle_mods23, result[1].vehicle_mods24, result[1].vehicle_neon0, result[1].vehicle_neon1, result[1].vehicle_neon2, result[1].vehicle_neon3, result[1].vehicle_bulletproof, result[1].vehicle_smokecolor1, result[1].vehicle_smokecolor2, result[1].vehicle_smokecolor3, result[1].vehicle_modvariation, result[1].nitro})
	end)
end)

RegisterServerEvent('ply_garages:CheckForVeh')
AddEventHandler('ply_garages:CheckForVeh', function(plate,vehicle,vtype)
  local user_id = vRP.getUserId({source})
  local player = vRP.getUserSource({user_id})
  MySQL.query("vRP/lsc_get_vehicle", {user_id = user_id, vehicle = vehicle, plate = plate}, function(rows, affected)
    if #rows > 0 then -- has vehicle
      vRPgc.despawnGarageVehicle(player,{vtype,5})
	else
	  vRPclient.notify(player,{"~r~No owned vehicle closeby"})
	end
  end)
end)

RegisterServerEvent('ply_garages:CheckGarageForVeh')
AddEventHandler("ply_garages:CheckGarageForVeh", function()
	local user_id = vRP.getUserId({source})
	local player = vRP.getUserSource({user_id})
    MySQL.query("vRP/ply_get_vehicles", {user_id = user_id}, function(pvehicles, affected)
      local vehicles = {}
      for k,v in ipairs(pvehicles) do
		if v.veh_type == "car" or v.veh_type == "bike" then
		  table.insert(vehicles, {["vehicle_model"] = v.vehicle_model, ["vehicle_name"] = v.vehicle})
		end
      end
      TriggerClientEvent("ply_garages:getVehicles", player, vehicles) 
	end)
end)

RegisterServerEvent('ply_garages:CheckForSpawnBasicVeh')
AddEventHandler('ply_garages:CheckForSpawnBasicVeh', function(user_id,vehicle)
	local player = vRP.getUserSource({user_id})
	MySQL.query("vRP/ls_customs", {user_id = user_id, vehicle = vehicle}, function(result, affected)
	  vRP.closeMenu({player})
      vRPgc.spawnGarageVehicle(player,{result[1].veh_type,vehicle,result[1].vehicle_plate, result[1].vehicle_colorprimary, result[1].vehicle_colorsecondary, result[1].vehicle_pearlescentcolor, result[1].vehicle_wheelcolor, result[1].vehicle_plateindex, result[1].vehicle_neoncolor1, result[1].vehicle_neoncolor2, result[1].vehicle_neoncolor3, result[1].vehicle_windowtint, result[1].vehicle_wheeltype, result[1].vehicle_mods0, result[1].vehicle_mods1, result[1].vehicle_mods2, result[1].vehicle_mods3, result[1].vehicle_mods4, result[1].vehicle_mods5, result[1].vehicle_mods6, result[1].vehicle_mods7, result[1].vehicle_mods8, result[1].vehicle_mods9, result[1].vehicle_mods10, result[1].vehicle_mods11, result[1].vehicle_mods12, result[1].vehicle_mods13, result[1].vehicle_mods14, result[1].vehicle_mods15, result[1].vehicle_mods16, result[1].vehicle_turbo, result[1].vehicle_tiresmoke, result[1].vehicle_xenon, result[1].vehicle_mods23, result[1].vehicle_mods24, result[1].vehicle_neon0, result[1].vehicle_neon1, result[1].vehicle_neon2, result[1].vehicle_neon3, result[1].vehicle_bulletproof, result[1].vehicle_smokecolor1, result[1].vehicle_smokecolor2, result[1].vehicle_smokecolor3, result[1].vehicle_modvariation, result[1].nitro})
	end)
end)
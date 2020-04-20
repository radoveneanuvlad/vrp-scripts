--BY MIKYD
local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")


vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vRP_chatroles")

RegisterServerEvent('chat:init')
RegisterServerEvent('chat:addTemplate')
RegisterServerEvent('chat:addMessage')
RegisterServerEvent('chat:addSuggestion')
RegisterServerEvent('chat:removeSuggestion')
RegisterServerEvent('_chat:muitzaqmessageEntered')
RegisterServerEvent('chat:clear')
RegisterServerEvent('__cfx_internal:commandFallback')

AddEventHandler('_chat:muitzaqmessageEntered', function(author, color, message)
    if not message or not author then
        return
    end

    TriggerEvent('chatMessage', source, author, message)

    if not WasEventCanceled() then
		local user_id = vRP.getUserId({source})
		local player = vRP.getUserSource({user_id})
		if vRP.hasGroup({user_id,"Wfondator"}) then
			TriggerClientEvent('chatMessage', -1, "^7[" .. user_id .. "] ^9👑𝗙𝗢𝗡𝗗𝗔𝗧𝗢𝗥👑 ^7| " .. author .. ": ^9" ..  message)
		elseif vRP.hasGroup({user_id,"Wco-fondator"}) then
			TriggerClientEvent('chatMessage', -1, "^7[" .. user_id .. "] ^9🛠️𝗖𝗢-𝗙𝗢𝗡𝗗𝗔𝗧𝗢𝗥🛠️ ^7| " .. author .. ": ^2" ..  message)
		elseif vRP.hasGroup({user_id,"Wsuperadmin"}) then
			TriggerClientEvent('chatMessage', -1, "^7[" .. user_id .. "] ^1🛠️𝗦𝗨𝗣𝗘𝗥 𝗔𝗗𝗠𝗜𝗡🛠️ ^7| " .. author .. ": ^2" ..  message)
		elseif vRP.hasGroup({user_id,"Wadmin"}) then
			TriggerClientEvent('chatMessage', -1, "^7[" .. user_id .. "] ^5🛠️𝗔𝗗𝗠𝗜𝗡🛠️ ^7| " .. author .. ": ^2" ..  message)
		elseif vRP.hasGroup({user_id,"YTMENU"}) then
			TriggerClientEvent('chatMessage', -1, "^7[" .. user_id .. "] ^1🌟𝗬𝗼𝘂𝗧𝘂𝗯𝗲𝗥🌟^1| " .. author .. ": ^2" ..  message)
		elseif vRP.hasGroup({user_id,"Wsupermoderator"}) then
			TriggerClientEvent('chatMessage', -1, "^7[" .. user_id .. "] ^3🛠️𝗦𝗨𝗣𝗘𝗥 𝗠𝗢𝗗𝗘𝗥𝗔𝗧𝗢𝗥🛠️ ^7| " .. author .. ": ^2" ..  message)
		elseif vRP.hasGroup({user_id,"Wmoderator"}) then
			TriggerClientEvent('chatMessage', -1, "^7[" .. user_id .. "] ^3🛠️𝗠𝗢𝗗𝗘𝗥𝗔𝗧𝗢𝗥🛠️ ^7| " .. author .. ": ^2" ..  message)
		elseif vRP.hasGroup({user_id,"Whelper"}) then
			TriggerClientEvent('chatMessage', -1, "^7[" .. user_id .. "] ^2🛠️𝗛𝗘𝗟𝗣𝗘𝗥🛠️ ^7| " .. author .. ": ^2" ..  message)
		elseif vRP.hasGroup({user_id,"Whelperteste"}) then
			TriggerClientEvent('chatMessage', -1, "^7[" .. user_id .. "] ^2🛠️𝗛𝗘𝗟𝗣𝗘𝗥(𝗧)🛠️ ^7| " .. author .. ": ^2" ..  message)
		elseif vRP.hasGroup({user_id,"PMENU"}) then
			TriggerClientEvent('chatMessage', -1, "^7[" .. user_id .. "] ^3🌟PREMIUM MENU ^7| " .. author .. ": ^2" ..  message)
		elseif vRP.hasGroup({user_id,"VIP PLATINIUM"}) then
			TriggerClientEvent('chatMessage', -1, "^7[" .. user_id .. "] ^3🌟VIP PLATINIUM ^7| " .. author .. ": ^2" ..  message)
		elseif vRP.hasGroup({user_id,"VIP SILVER"}) then
			TriggerClientEvent('chatMessage', -1, "^7[" .. user_id .. "] ^3✨VIP SILVER ^7| " .. author .. ": ^2" ..  message)
		elseif vRP.hasGroup({user_id,"VIP BRONZE"}) then
			TriggerClientEvent('chatMessage', -1, "^7[" .. user_id .. "] ^3🔸VIP BRONZE ^7| " .. author .. ": ^2" ..  message)
		elseif vRP.hasGroup({user_id,"RGBM"}) then
			TriggerClientEvent('chatMessage', -1, "^7[" .. user_id .. "] ^3🌈RAINBOW MENU ^7| " .. author .. ": ^2" ..  message)
		elseif vRP.hasGroup({user_id,"Capitan SIAS"}) then	
			TriggerClientEvent('chatMessage', -1, "^7[" .. user_id .. "] ^1🕵️Capitan SIAS ^7| " .. author .. ": ^0" ..  message)
		elseif vRP.hasGroup({user_id,"Co-Capitan SIAS"}) then	
			TriggerClientEvent('chatMessage', -1, "^7[" .. user_id .. "] ^1🕵️Co-Capitan SIAS ^7| " .. author .. ": ^0" ..  message)
		elseif vRP.hasGroup({user_id,"Locotenent SIAS"}) then	
			TriggerClientEvent('chatMessage', -1, "^7[" .. user_id .. "] ^1🕵️Locotenent SIAS ^7| " .. author .. ": ^0" ..  message)
		elseif vRP.hasGroup({user_id,"Caporal SIAS"}) then	
			TriggerClientEvent('chatMessage', -1, "^7[" .. user_id .. "] ^1🕵️Caporal SIAS ^7| " .. author .. ": ^0" ..  message)
		elseif vRP.hasGroup({user_id,"Agent SIAS"}) then	
			TriggerClientEvent('chatMessage', -1, "^7[" .. user_id .. "] ^1🕵️Agent SIAS ^7| " .. author .. ": ^0" ..  message)
		elseif vRP.hasGroup({user_id,"SIAS"}) then	
			TriggerClientEvent('chatMessage', -1, "^7[" .. user_id .. "] ^1🕵️S.I.A.S ^7| " .. author .. ": ^0" ..  message)
		elseif vRP.hasGroup({user_id,"cop"}) then	
			TriggerClientEvent('chatMessage', -1, "^7[" .. user_id .. "] ^5🚓POLITIST ^7| " .. author .. ": ^0" ..  message)
		elseif vRP.hasGroup({user_id,"ems"}) then	
			TriggerClientEvent('chatMessage', -1, "^7[" .. user_id .. "] ^1💉MEDIC ^7| " .. author .. ": ^0" ..  message)
		elseif vRP.hasGroup({user_id,"Cosa-Nostra"}) then	
			TriggerClientEvent('chatMessage', -1, "^7[" .. user_id .. "] ^1🎩Cosa-Nostra🎩 ^7| " .. author .. ": ^0" ..  message)
		elseif vRP.hasGroup({user_id,"El Cappo"}) then	
			TriggerClientEvent('chatMessage', -1, "^7[" .. user_id .. "] ^1💀Mafia Sinaloa[El Cappo]💀 ^7| " .. author .. ": ^0" ..  message)
		elseif vRP.hasGroup({user_id,"El Primmo"}) then	
			TriggerClientEvent('chatMessage', -1, "^7[" .. user_id .. "] ^1💀Mafia Sinaloa[El Primmo]💀 ^7| " .. author .. ": ^0" ..  message)
		elseif vRP.hasGroup({user_id,"El Membro"}) then	
			TriggerClientEvent('chatMessage', -1, "^7[" .. user_id .. "] ^1💀Mafia Sinaloa[El Membro]💀 ^7| " .. author .. ": ^0" ..  message)
	    elseif vRP.hasPermission({user_id,"chat.anp"}) then	
			TriggerClientEvent('chatMessage', -1, "^7[" .. user_id .. "] ^5👮ANP ^7| " .. author .. ": ^0" ..  message)
			----------------------
		elseif vRP.hasPermission({user_id,"UBER"}) then	
			TriggerClientEvent('chatMessage', -1, "^7[" .. user_id .. "] ^5🚙UBER ^7| " .. author .. ": ^0" ..  message)
		elseif vRP.hasPermission({user_id,"Hacker"}) then	
			TriggerClientEvent('chatMessage', -1, "^7[" .. user_id .. "] ^5💳Hacker ^2| " .. author .. ": ^0" ..  message)
		elseif vRP.hasPermission({user_id,"HITMAN"}) then	
			TriggerClientEvent('chatMessage', -1, "^7[" .. user_id .. "] ^5🕵️HITMAN ^3| " .. author .. ": ^0" ..  message)
		else
			TriggerClientEvent('chatMessage', -1, "^7[" .. user_id .. "] ^6🤵CIVIL ^7| " .. author .. ": ^0" ..  message) 
		end	
    end

    print(author .. ': ' .. message)
end)

AddEventHandler('__cfx_internal:commandFallback', function(command)
    local name = GetPlayerName(source)

    TriggerEvent('chatMessage', source, name, '/' .. command)

    if not WasEventCanceled() then
		local user_id = vRP.getUserId({source})
		local player = vRP.getUserSource({user_id})
		if vRP.hasPermission({user_id,"ownsdser.chattitle"}) then
		--	TriggerClientEvent('chatMessage', -1, "^1OWNER ^7| " .. name .. ": ^1" .. '/' .. command)
		elseif vRP.hasPermission({user_id,"addsamin.chattitle"}) then
		--	TriggerClientEvent('chatMessage', -1, "^1ADMIN ^7| " .. name .. ": ^1" .. '/' .. command)
		elseif vRP.hasPermission({user_id,"modsad.chattitle"}) then	
		--	TriggerClientEvent('chatMessage', -1, "^1MOD ^7| " .. name .. ": ^1" .. '/' .. command)
		elseif vRP.hasGroup({user_id,"codsap"}) then
		--	TriggerClientEvent('chatMessage', -1, "^4COP ^7| " .. name .. ": ^4" .. '/' .. command)
		elseif vRP.hasGroup({user_id,"edsams"}) then
		--	TriggerClientEvent('chatMessage', -1, "^9EMS ^7| " .. name .. ": ^9" .. '/' .. command)
		elseif vRP.hasGroup({user_id,"Firdsaefighter"}) then
		--	TriggerClientEvent('chatMessage', -1, "^3FIREFIGHTER ^7| " .. name .. ": ^3" .. '/' .. command)
		else
			TriggerClientEvent('chatMessage', -1, "OOC | " .. name, { 128, 128, 128 }, '/' .. command) 
		end	
    end

    CancelEvent()
end)


RegisterCommand('say', function(source, args, rawCommand)
	if(source == 0)then
		TriggerClientEvent('chatMessage', -1, "[CONSOLA Whisper]", { 255, 0, 0 }, rawCommand:sub(5))
	end
end)



RegisterServerEvent("theirin:reciveChat")
AddEventHandler("theirin:reciveChat", function(name, msg)
  local user_id = vRP.getUserId({source})
  if vRP.hasPermission({user_id, "admin.tickets"}) then
    TriggerClientEvent("chatMessage", source, "^8[Whisper-AC]^1".. name ..":^7 ".. msg)
  end
end)

RegisterCommand('a', function(source, args, msg)
  local user_id = vRP.getUserId({source})
  if vRP.hasPermission({user_id, "admin.tickets"}) then
    TriggerClientEvent("theirin:sendChat", -1, GetPlayerName(source), msg:sub(3))
  else
    TriggerClientEvent("chatMessage", source, "^8Eroare: Nu ai acces la aceasta comanda.")
  end
end)

RegisterCommand('clear', function(source)
	local user_id = vRP.getUserId({source});
	if user_id ~= nil then
		if vRP.hasPermission({user_id, "admin.tickets"}) then
			TriggerClientEvent("chat:clear", -1);
			TriggerClientEvent("chatMessage", -1,"^9Whisper^9Roleplay^9România^7: ^2"..GetPlayerName(source).."^7 a curățat tot Chat-ul !");
		else
			TriggerClientEvent("chatMessage", source, "^8Whisper^7: Nu ai acces la această comandă !");
		end
	end
end)

RegisterCommand('asay', function(source, args, rawCommand)
	if (source == 0) then
	  TriggerClientEvent('chatMessage', -1,'^1Whisper^3Roleplay^4România', { 255, 255, 255 }, rawCommand:sub(5))
	else
	  local user_id = vRP.getUserId({source})
	  if vRP.hasPermission({user_id, "admin.asay"}) then
		TriggerClientEvent('chatMessage', -1,'^1Whisper^3Roleplay^4România', { 255, 255, 255 }, rawCommand:sub(5))
	  else
		TriggerClientEvent('chatMessage', source, "^8Whisper^7: Nu ai acces la aceasta comanda!")
	  end
	end
  end)

  RegisterCommand('arevive', function(source, args, msg)
	local user_id = vRP.getUserId({source})
	msg = msg:sub(9)
	if msg:len() >= 1 then
	  msg = tonumber(msg)
	  local target = vRP.getUserSource({msg})
	  if target ~= nil then
		if vRP.hasPermission({user_id, "admin.tickets"}) then
		  vRPclient.varyHealth(target,{100})
  
	  TriggerClientEvent('chatMessage', source, "^8Whisper^7: I-ai dat Revive lui : ^2"..GetPlayerName(target).."^7!")
	  TriggerClientEvent('chatMessage', target, "^8Whisper^7: Adminul ^2"..GetPlayerName(source).." ^7ți-a dat revive !")
		else
		  TriggerClientEvent('chatMessage', source, "^8Whisper^7: Nu ai acces la această comandă.")
		end
	  else
		TriggerClientEvent('chatMessage', source, "^8Whisper^7: Player-ul nu este conectat.")
	  end
	else
	  TriggerClientEvent('chatMessage', source, "^8Whisper^7: /arevive <user-id>")
	end
  end)

  RegisterCommand("respawn", function(player, args)
    local user_id = vRP.getUserId({player})
    if vRP.hasPermission({user_id, "admin.tickets"}) then
        local target_id = parseInt(args[1])
        local target_src = vRP.getUserSource({target_id})
        if target_src then
            vRPclient.varyHealth(target_src,{100})
            vRP.varyHunger({target_src,-100})
            vRP.varyThirst({target_src,-100})
            vRPclient.teleport(target_src, {339.3706665039,-1394.4642333984,32.509258270264})
            local adminsay = "[^1System^0] Se pare ca ai primit respawn de la un admin"
            TriggerClientEvent('chat:addMessage', target_src,adminsay )
        end
    end
end, false)

RegisterCommand("noclip", function(player)
	local user_id = vRP.getUserId({player})
    if vRP.hasPermission({user_id, "admin.tickets"}) then
    vRPclient.toggleNoclip(player, {})
end
end)



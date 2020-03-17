 --[[
 SCRIPT CREATED ONLY FOR VRP !
 If u want change it for ESX, make a new server event and trigger it from client side.
 For any help, contact me! 
 www.krimes.ro | EskaPe#5716 (Discord) | discord.me/rpkrimes
--]]
vRP = Proxy.getInterface("vRP")

local minute = 30
local secunde = 60

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000) 
		secunde = secunde - 1
		if secunde == 0 then
			secunde = 60
			minute = minute -1
			if minute == 0  then
				minute = 30
				secunde = 60
				TriggerServerEvent('salar')
			end
		end
	end
end)

Citizen.CreateThread(function()

	while true do
		Citizen.Wait(1)
		timpPayday(1.38, 1.43, 1.0,1.0,0.5, "~w~PAYDAY IN:~y~ "..minute..":"..secunde.."~w~ minute", 255, 255, 255, 255)
	end
end)





function timpPayday(x,y ,width,height,scale, text, r,g,b,a, outline)
    SetTextFont(4)
    SetTextProportional(0)
    SetTextScale(scale, scale)
	SetTextColour( 0,0,0, 255 )
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
	SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end

--Settings--
local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vRP_salar")


salarii = {
--  grup permission     $$$    Message "From bla bla"
	{"police.paycheck", 3500, "De la ~b~Politie"},
	{"emergency.paycheck", 3300, "De la ~r~Medici"},
	{"cadet.paycheck", 2000, "De la ~b~Politie(Cadet)"},
	{"fib.paycheck", 3800, "De la ~b~S.I.A.S"},
	{"taxi.paycheck", 300, "De la TAXI"},
	{"repair.paycheck", 300, "De la Mecanic"},
	{"uber.paycheck", 300, "De la UBER"},
	{"delivery.paycheck", 300, "De la Delivery"},
	{"medical.paycheck", 300, "De la ~g~Iarba Medicala"},
	{"trafficguard.paycheck", 300, "De la Traffic Guard"},
	{"vip3.paycheck", 10000, "De la ~p~DARK VIP"},
	{"pizza.paycheck", 200, "De la Pizza Boy"},
	{"postas.paycheck", 200, "De la Postas"},
	{"hitman.paycheck", 500, "De la Hitman"},
	{"mafiayakuza.paycheck", 3000, "De la Capul Mafiei Yakuza"},
	{"mafiacammora.paycheck", 3000, "De la Capul Mafiei Corleone"}
}


RegisterServerEvent('salar')
AddEventHandler('salar', function(salar)
	local user_id = vRP.getUserId({source})
	local player = vRP.getUserSource({user_id})
	pictura = "CHAR_ANDREAS"
	titlu = "Krimes Bank"
	mesaj = "Ai primit salariul ~g~$"
	for i, v in pairs(salarii) do
		permisiune = v[1]
		if(vRP.hasPermission({user_id, permisiune}))then
			salar = v[2]
			deLaGrupa = v[3]
			vRP.giveMoney({user_id,salar})
			vRP.givePuncte({user_id, 1})
			vRPclient.notifyPicture(player,{pictura, 9, titlu, false, mesaj..salar.. "~w~. "..deLaGrupa})
		end
	end
end)
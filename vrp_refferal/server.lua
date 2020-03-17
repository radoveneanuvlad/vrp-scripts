local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vRP_refferal")

MySQL = module("vrp_mysql", "MySQL")

MySQL.createCommand("vRP/ref_db","ALTER TABLE vrp_users ADD IF NOT EXISTS refferal INTEGER DEFAULT 0, ADD IF NOT EXISTS folositref INTEGER DEFAULT 0")

MySQL.createCommand("vRP/refferal","UPDATE vrp_users SET refferal = refferal + 1 WHERE id = @user_id")
MySQL.createCommand("vRP/setfolositref","UPDATE vrp_users SET folositref = 1 WHERE id = @user_id")
MySQL.createCommand("vRP/afolositref", "SELECT * FROM vrp_users WHERE id = @user_id AND folositref = 0")
MySQL.createCommand("vRP/getreferraldata", "SELECT * FROM vrp_users WHERE id = @user_id")
MySQL.createCommand("vRP/addmoneytoreffered", "UPDATE vrp_user_moneys SET bank = bank + @suma WHERE user_id = @user_id")


MySQL.execute("vRP/ref_db")

function refferal(player, choice)
    local user_id = vRP.getUserId({player})
    if user_id ~= nil then
        MySQL.query("vRP/afolositref", {user_id = user_id}, function(folosit, affected)
            print(#folosit)
            if #folosit == 1 then
                vRP.prompt({player, "Cui vrei sa ii dai refferal ?", "", function(player, idceliref)
                    if idceliref ~= nil then
                        if tonumber(idceliref) ~= user_id then
                            local jucatorref = vRP.getUserSource({idceliref})
                            MySQL.execute("vRP/refferal", {user_id = idceliref})
                            MySQL.execute("vRP/setfolositref", {user_id = user_id})
                            vRPclient.notify(player,{"Bravo ,i-ai dat refferal lui ~g~"..idceliref.."~w~ , pentru asta primesti 250 Lei."})
                            vRP.giveMoney({user_id,250})
                            local userref = vRP.getUserSource({idceliref})
                            MySQL.execute("vRP/addmoneytoreffered", {suma = 500,user_id = math.floor(tonumber(idceliref))})
                            if userref ~= nil then
                                vRPclient.notify(userref,{user_id.." tocmai ti-a dat refferal , ~w~si ai primit ~g~250 Lei ~w~pentru asta !"})
                            end
                        else
                            vRPclient.notify(player,{"Nu poti sa iti dai refferal singur"})
                        end
                    end
                end})
            else
                vRPclient.notify(player,{"Deja ai folosit refferar-ul"})
            end
        end)
    end
end

RegisterCommand('testref', function(source, args, rawCommand)
    refferal(source,choice)
end)

vRP.registerMenuBuilder({"main", function(add, data)
	local user_id = vRP.getUserId({data.player})
	if user_id ~= nil then
		local choices = {}
		choices["Refferal"] = {refferal, "Ajuti un player si primesti : <font color='green'>150000 Lei</font> ,  <font color='red'>by cookie</font>"}
	    add(choices)
    end
end})
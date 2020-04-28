MySQL = module("vrp_mysql", "MySQL")
local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vrp_dmvschool")


AddEventHandler("vRP:playerSpawn", function(user_id, source, first_spawn)
  if user_id then
    local numar = vRP.getInventoryItemAmount({user_id,"permis"})
    if tonumber(numar) > 0 then
      TriggerClientEvent('vezidacaarepermisvere',source,0)
    end
  end
end)

local oferapermis = {function(player,choice)
  vRPclient.getNearestPlayer(player,{10},function(nplayer)
    local nuser_id = vRP.getUserId({nplayer})
    if nuser_id ~= nil then
      vRPclient.notify(player,{"Oferi contract permis auto..."})
      vRP.request({nplayer,"Vrei sa platesti : 100$ pentru a primi permis-ul auto ?",15,function(nplayer,ok)
        if ok then
          local numar = vRP.getInventoryItemAmount({nuser_id,"permis"})
          if tonumber(numar) < 1 then
            if vRP.tryPayment({nuser_id,100}) then
              vRPclient.notify(player,{"Jucator-ul : ~g~"..nuser_id.." ~w~a platit ~g~100$ ~w~pentru permis-ul auto"})
              vRPclient.notify(nplayer,{"Ai platit ~g~100$ ~w~pentru permis-ul auto"})
              vRP.giveInventoryItem({nuser_id,"permis",1,false})
              TriggerClientEvent('vezidacaarepermisvere',nplayer,0)
            else
              vRPclient.notify(player,{"Jucator-ul : ~g~"..nuser_id.." ~w~nu are suficienti bani pentru a semna contract-ul de primire al permisului auto"})
              vRPclient.notify(nplayer,{"Nu ai ~g~100$ ~w~pentru pentru a semna contract-ul de primire al permisului auto"})
            end
          else
            vRPclient.notify(player,{"Jucator-ul : ~g~"..nuser_id.." ~w~are deja un permis auto"})
          end
        else
          vRPclient.notify(player,{"Jucator-ul : ~g~"..nuser_id.." ~w~a refuzat contract-ul pentru primirea de permis auto"})
          vRPclient.notify(nplayer,{"Ai refuzat contract-ul de primire al permisului auto"})
        end
      end})
    else
      vRPclient.notify(player,{"Nici un jucator in preajma"})
    end
  end)
end, "Ofera licenta de condus celui mai apropriat jucator"}

local cere = {function(player,choice)
  vRPclient.getNearestPlayer(player,{10},function(nplayer)
    local nuser_id = vRP.getUserId({nplayer})
    if nuser_id ~= nil then
      vRPclient.notify(player,{"Ceri permis..."})
      vRP.request({nplayer,"Vrei sa ii arati licenta ?",15,function(nplayer,ok)
        if ok then
          local numar = vRP.getInventoryItemAmount({nuser_id,"permis"})
          if numar > 0 then
            vRPclient.notify(player,{"Permis : ~g~Da"})
          else
            vRPclient.notify(player,{"Permis : ~r~Nu"})
          end
        else
          vRPclient.notify(player,{"A refuzat cererea"})
        end
      end})
    else
      vRPclient.notify(player,{"Nici un jucator in preajma"})
    end
  end)
end, "Cere permisul de conducere celui mai apropriat jucator."}


local confisca = {function(player, choice)
  vRPclient.getNearestPlayer(player,{10},function(nplayer)
    local nuser_id = vRP.getUserId({nplayer})
    if nuser_id ~= nil then
      local numar = vRP.getInventoryItemAmount({nuser_id,"permis"})
      if numar > 0 then
        vRPclient.notify(player,{"I-ai confiscat permis-ul jucatorului : ~g~"..nuser_id.." !"})
        vRPclient.notify(nplayer,{"Ti-a fost confiscat permis-ul"})
        vRP.tryGetInventoryItem({nuser_id,"permis",1,false})
        TriggerClientEvent('vezidacaarepermisvere',nplayer,1)
      end
    else
      vRPclient.notify(player,{"Nici un jucator in preajma"})
    end
  end)
end, "Confisca permis-ul unui jucator"}

vRP.registerMenuBuilder({"police", function(add, data)
  local player = data.player

  local user_id = vRP.getUserId({player})
  if user_id ~= nil then
    local choices = {}

    -- build police menu
    if vRP.hasPermission({user_id,"police.pc"}) then
       choices["Cere permis"] = cere
       choices["Confisca permis"] = confisca
       choices["Ofera permis"] = oferapermis
    end
	
    add(choices)
  end
end})
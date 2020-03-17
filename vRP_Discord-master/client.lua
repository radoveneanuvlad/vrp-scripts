------------------------CREDITS------------------------
--------- Script made by H3cker | DevHUB#7723   -------
--      Script made for StreamForce Romania RP       --
--          Site: https://devstudios.store           --
--        Forum: http://forum.devstudios.store       --
--   Copyright 2019 ©DevStudios. All rights served   --
-------------------------------------------------------
Citizen.CreateThread(function()
    while true do
        TriggerServerEvent("vRP:Discord")
		Citizen.Wait(10000000000000000)
	end
end)

RegisterNetEvent('vRP:Discord-rich')
AddEventHandler('vRP:Discord-rich', function(user_id, faction, name)
SetDiscordAppId('687686847471550511')-- Discord app ID
SetDiscordRichPresenceAsset('cacat') -- PNG file
SetDiscordRichPresenceAssetText('Dark Romania Roleplay') -- PNG text desc
SetDiscordRichPresenceAssetSmall('logo') -- PNG small
SetDiscordRichPresenceAssetSmallText('Discord Link') -- PNG text desc2
SetRichPresence("[ID:"..user_id.."][Job:"..faction.."][Name:"..name.. "] - | "..GetNumberOfPlayers().. "/32 |")
end)

local positions ={
	{-47.7184, -1116.19, 26.4345},
	{370.853, -951.791, 29.3687},
	{705.34, -1071.87, 22.4263},
	{-255.936, -682.167, 33.252},
	{-1081.34, 458.125, 77.2266},
	{1027.03, -1860.08, 30.8898},
	{76.275, 6396.47, 31.2258},
	{-521.044, 5244.34, 79.823},
	{1374.82, -728.931, 67.0719},
	{-78.7972, 347.37, 112.444},
	{1413.31, 1118.14, 114.838},
	{-520.293, -266.027, 35.3324},
	{2663.05, 3259.53, 55.2405},
	{684.573, -718.346, 25.9935},
	{-132.052, -258.396, 43.1929},
}

local function RGBRainbow( frequency )
	local result = {}
	local curtime = GetGameTimer() / 1000

	result.r = math.floor( math.sin( curtime * frequency + 0 ) * 600 + 128 )
	result.g = math.floor( math.sin( curtime * frequency + 2 ) * 600 + 128 )
	result.b = math.floor( math.sin( curtime * frequency + 4 ) * 600 + 128 )
	
	return result
end

Citizen.CreateThread(function()
    while true do
        Wait(0)
        
        ped_pos = GetEntityCoords(GetPlayerPed(-1))

        for i,v in pairs(positions) do
            if Vdist(ped_pos,v[1],v[2],v[3]) < 30.0 then
			
			--POLITIE MEDICI GARAJE ---------------
			--nu merg
			--POLITIE MEDICI GARAJE ---------------
		
			--GARAJE VIP --------------------------
                DrawMarker(36,-1221.53, -181.208, 39.1753,0,0,0,0,0,0,0.75,1.25,0.75,182,182,178,255,1,0,0,1)--vip1
                DrawMarker(36,-1218.77, -180.482, 39.1753,0,0,0,0,0,0,0.75,1.25,0.75,232,140,49,255,1,0,0,1)--vip2
                DrawMarker(36,v[1],v[2],v[3]+0.1,0,0,0,0,0,0,0.75,1.25,0.75,100,200,200,255,1,0,0,1) --nu o atinge
			local rainbow = RGBRainbow( 1 )
                DrawMarker(36,-1224.68,-183.3,39.1753,0,0,0,0,0,0,0.75,1.25,0.75,rainbow.r, rainbow.g, rainbow.b,255,1,0,0,1)--vip3
                DrawMarker(36,-1223.21,-182.276,39.1753,0,0,0,0,0,0,0.75,1.25,0.75,rainbow.r, rainbow.g, rainbow.b,255,1,0,0,1)--vip 4
              --  DrawMarker(36,-50.743114471436,-1116.2668457031,26.434713363647,0,0,0,0,0,0,0.75,1.25,0.75,255,128,0,255,1,0,0,1)--vips
              --   DrawMarker(37,-58.9989, -1116.91, 26.4341,0,0,0,0,0,0,0.75,1.25,0.75,100,200,200,255,1,0,0,1)--motociclete
			--GARAJE VIP --------------------------
            end	
        end
    end
end)

Citizen.CreateThread( function()
	while true do
		Wait( 0 )
		
		SetTextFont( 4 )
		SetTextScale( 1.0, 1.0 )
		local rainbow = RGBRainbow( 1 )
		SetTextColour( rainbow.r, rainbow.g, rainbow.b, 255 )
		SetTextOutline()
		SetTextEntry( "STRING" )
		-- AddTextComponentString( "Rainbow Text" )
		DrawText( 0.029, 0.75 )
	end
end )
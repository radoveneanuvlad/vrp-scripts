vRP = Proxy.getInterface("vRP")
vRPg = Proxy.getInterface("vRP_garages")

function deleteVehiclePedIsIn()
  local v = GetVehiclePedIsIn(GetPlayerPed(-1),false)
  SetVehicleHasBeenOwnedByPlayer(v,false)
  Citizen.InvokeNative(0xAD738C3085FE7E11, v, false, true) -- set not as mission entity
  SetVehicleAsNoLongerNeeded(Citizen.PointerValueIntInitialized(v))
  Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(v))
end

RegisterNetEvent( 'wk:deleteVehicle2' )
AddEventHandler( 'wk:deleteVehicle2', function()
    local ped = GetPlayerPed( -1 )

    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then 
        local pos = GetEntityCoords( ped )

        if ( IsPedSittingInAnyVehicle( ped ) ) then 
            local vehicle = GetVehiclePedIsIn( ped, false )

            if ( GetPedInVehicleSeat( vehicle, -1 ) == ped ) then 
                SetEntityAsMissionEntity( vehicle, true, true )
                deleteCar( vehicle )

                if ( DoesEntityExist( vehicle ) ) then 
                	ShowNotification( "~r~Unable to delete vehicle, try again." )
                else 
                	ShowNotification( "Vehicle deleted." )
                end 
            else 
                ShowNotification( "You must be in the driver's seat!" )
            end 
        else
            local playerPos = GetEntityCoords( ped, 1 )
            local inFrontOfPlayer = GetOffsetFromEntityInWorldCoords( ped, 0.0, distanceToCheck, 0.0 )
            local vehicle = GetVehicleInDirection( playerPos, inFrontOfPlayer )

            if ( DoesEntityExist( vehicle ) ) then 
                SetEntityAsMissionEntity( vehicle, true, true )
                deleteCar( vehicle )

                if ( DoesEntityExist( vehicle ) ) then 
                	ShowNotification( "~r~Unable to delete vehicle, try again." )
                else 
                	ShowNotification( "Vehicle deleted." )
                end 
            else 
                ShowNotification( "You must be in or near a vehicle to delete it." )
            end 
        end 
    end 
end )

function deleteCar( entity )
    Citizen.InvokeNative( 0xEA386986E786A54F, Citizen.PointerValueIntInitialized( entity ) )
end

-- Gets a vehicle in a certain direction
-- Credit to Konijima
function GetVehicleInDirection( coordFrom, coordTo )
    local rayHandle = CastRayPointToPoint( coordFrom.x, coordFrom.y, coordFrom.z, coordTo.x, coordTo.y, coordTo.z, 10, GetPlayerPed( -1 ), 0 )
    local _, _, _, _, vehicle = GetRaycastResult( rayHandle )
    return vehicle
end

-- Shows a notification on the player's screen 
function ShowNotification( text )
    SetNotificationTextEntry( "STRING" )
    AddTextComponentString( text )
    DrawNotification( false, false )
end

local vehshop = {
	opened = false,
	title = "Shop",
	currentmenu = "main",
	lastmenu = nil,
	currentpos = nil,
	selectedbutton = 0,
	marker = { r = 0, g = 155, b = 255, a = 200, type = 1 },
	menu = {
		x = 0.1,
		y = 0.08,
		width = 0.2,
		height = 0.04,
		buttons = 10,
		from = 1,
		to = 10,
		scale = 0.4,
		font = 0,
		["main"] = {
			title = "Showroom",
			name = "main",
			buttons = {
				{name = "masini", description = ""},
				{name = "Hitman", description = ""},
				{name = "Mafia", description = ""},
				{name = "motociclete", description = ""},
				{name = "job", description = ""},
				{name = "vip", description = ""},
				{name = "biciclete", description = ''},
				{name = "aviatie", description = ''},
			}
		},
		["masini"] = {
			title = "masini",
			name = "masini",
			buttons = {
				{name = "audi", description = ''},
				{name = "bmw", description = ''},
				{name = "mercedesbenz", description = ''},
				{name = "Lamborghini", description = ''},
				{name = "ferrari", description = ''},
				{name = "Porsche", description = ''},
				{name = "Volkswagen", description = ''},
				{name = "Lux", description = ''},
				--{name = "cars5", description = ''},
				{name = "altele", description = ''},
				--{name = "cycles", description = ''},
			}
		},
		["audi"] = {
			title = "audi",
			name = "audi",
			buttons = {
				{name = "Audi A8", costs = 70000, description = {}, model = "a8audi"},
			    {name = "Audi A4 2017", costs = 20000, description = {}, model = "a4"},
			    {name = "Audi R8 SPYDER", costs = 110000, description = {}, model = "14r8"},			
			    {name = "Audi RS7", costs = 140000, description = {}, model = "2016rs7"},
			    {name = "Audi RS3", costs = 30000, description = {}, model = "rs3"},
				{name = "Audi RS5", costs = 50000, description = {}, model = "rs5"},
			}
		},
		["bmw"] = {
			title = "bmw",
			name = "bmw",
			buttons = {
			    {name = "BMW M5 F10", costs = 7000, description = {}, model = "m516"},
			    {name = "BMW M3 E46", costs = 1500, description = {}, model = "m3e46"},
				{name = "BMW X5", costs = 60000, description = {}, model = "x5m"},
				{name = "BMW X6M", costs = 75000, description = {}, model = "x6m"},
				{name = "BMW 745 LE", costs = 92000, description = {}, model = "745le"},
				{name = "BMW M8", costs = 70000, description = {}, model = "m850"},
			}
		},
		["mercedesbenz"] = {
			title = "mercedesbenz",
			name = "mercedesbenz",
			buttons = {
			    {name = "Mercedes Benz AMG GT63S", costs = 160000, description = {}, model = "gt63s"},			
			    {name = "Mercedes Benz G65 AMG", costs = 170000, description = {}, model = "g65amg"},
			    {name = "Mercedes GL 63", costs = 150000, description = {}, model = "gl63"},
			    {name = "Mercedes A45AMG", costs = 45000, description = {}, model = "a45amg"},
			    {name = "Mercedes GLE", costs = 170000, description = {}, model = "mbgle"},
				{name = "Mercedes V250", costs = 2000, description = {}, model = "mb250"},
			}
		},
		["Lamborghini"] = {
			title = "Lamborghini",
			name = "Lamborghini",
			buttons = {
				{name = "Lamborghini Terzo Millenio", costs = 5000000, description = {}, model = "lamtmc"},	
				{name = "Lamborghini Veneno", costs = 5000000, description = {}, model = "veneno"},
				{name = "Lamborghini Centenario", costs = 1000000, description = {}, model = "lp770r"},	
				{name = "Lamborghini Urus", costs = 200000, description = {}, model = "urus2018"},	
			}
		},
		["ferrari"] = {
			title = "ferrari",
			name = "ferrari",
			buttons = {
				{name = "Ferrari LaFerrari", costs = 1400000, description = {}, model = "aperta"},			
			}
		},
		["Porsche"] = {
			title = "Porsche",
			name = "Porsche",
			buttons = {
				{name = "Porsche 911R", costs = 300000, description = {}, model = "p911r"},			
			    {name = "Porsche Panamera", costs = 750000, description = {}, model = "pturismo"},
			    {name = "Porsche CayenneS", costs = 600000, description = {}, model = "cayenne"},		
			}
		},
		["Volkswagen"] = {
			title = "Volkswagen",
			name = "Volkswagen",
			buttons = {
			    {name = "Volkswagen Amarok 2018", costs = 130000, description = {}, model = "amarok"},	
			    {name = "Volkswagen Polo", costs = 8000, description = {}, model = "polo2018"},				
			}
		},
		["Lux"] = {
			title = "Lux",
			name = "Lux",
			buttons = {
				{name = "Rolls Royce Phantom", costs = 350000, description = {}, model = "rrphantom"},
                                {name = "McLaren 720S", costs = 250000, description = {}, model = "720s"},
                                {name = "Jaguar F-Type", costs = 65000, description = {}, model = "fpace"},


			}
		},
		["cars5"] = {
			title = "cars5",
			name = "cars5",
			buttons = {
			    {name = "Dubsta 6x6", costs = 300000, description = {}, model = "dubsta3"},
			}
		},
		["altele"] = {
			title = "altele",
			name = "altele",
			buttons = {
				{name = "Range Rover Sport 2014", costs = 48000, description = {}, model = "SVR14"},	
                {name = "Range Rover Velar", costs = 60000, description = {}, model = "18Velar"},					
			    {name = "Rampage 10", costs = 70000, description = {}, model = "rampage10"},
                            {name = "Opel Corsa E", costs = 1000, description = {}, model = "corsae"},
                            {name = "Nissan 370Z", costs = 47000, description = {}, model = "370z"},
                            {name = "Nissan GTR", costs = 80000, description = {}, model = "gtr17"},	
			}
		},
		["motociclete"] = {
			title = "motociclete",
			name = "motociclete",
			buttons = {
				{name = "Innovation", costs = 30000, description = {}, model = "innovation"},
				{name = "Hexer", costs = 35000, description = {}, model = "hexer"},
			    {name = "Sanchez", costs = 40000, description = {}, model = "sanchez"},
				{name = "Gargoyle", costs = 55000, description = {}, model = "gargoyle"},
				{name = "Bmw Lecto", costs = 70000, description = {}, model = "lectro"},
				{name = "Yamaha R1", costs = 55000, description = {}, model = "r1"},
				{name = "Agusta F4 RR", costs = 80000, description = {}, model = "f4rr"},
				{name = "Thrust", costs = 40000, description = {}, model = "thrust"},
				{name = "Sanchez 2", costs = 55000, description = {}, model = "Sanchez2"},
				{name = "Raptor", costs = 65000, description = {}, model = "raptor"},
				{name = "Street Blazer", costs = 60000, description = {}, model = "blazer4"},
				{name = "Sovereign", costs = 40000, description = {}, model = "sovereign"},
				{name = "Daemon", costs = 75000, description = {}, model = "daemon"},
				{name = "Akuma", costs = 65000, description = {}, model = "akuma"},
				{name = "Bagger", costs = 40000, description = {}, model = "bagger"},
				{name = "Vader", costs = 30000, description = {}, model = "vader"},
				{name = "BMW S1000 RR", costs = 70000, description = {}, model = "bmws"},
				{name = "Ninja H2R", costs = 60000, description = {}, model = "ninjah2"},
				{name = "Zombie Bobber", costs = 60000, description = {}, model = "zombiea"},
				{name = "Ducati", costs = 80000, description = {}, model = "d99"},
			}
		},
		["biciclete"] = {
			title = "biciclete",
			name = "biciclete",
			buttons = {
				{name = "BMX", costs = 3000, description = {}, model = "bmx"},
				{name = "Fixter", costs = 1000, description = {}, model = "Fixter"},
				{name = "TRIBIKE", costs = 10000, description = {}, model = "tribike"},
				{name = "TRIBIKE2", costs = 10000, description = {}, model = "tribike2"},
				{name = "TRIBIKE3", costs = 10000, description = {}, model = "tribike3"},
				{name = "Mountain Bike", costs = 25000, description = {}, model = "scorcher"},
			}
		},
		["Hitman"] = {
			title = "Hitman",
			name = "Hitman",
			buttons = {
			    {name = "BMW E39", costs = 500000, description = {}, model = "bmwe39"},
				{name = "Mercedes Benz G AMG", costs = 500000, description = {}, model = "g65amg"},
				{name = "SuperVolito", costs = 500000, description = {}, model = "supervolito2"},
			}
		},
		["Mafia"] = {
			title = "Mafia",
			name = "Mafia",
			buttons = {
				{name = "CLS", costs = 0, description = {}, model = "cls2015"},
				{name = "Vito", costs = 0, description = {}, model = "v250"},
				{name = "Hummer 6x6", costs = 0, description = {}, model = "h6"},
				{name = "BMW M4", costs = 0, description = {}, model = "m4f82"},
				{name = "Jeep OffRoad", costs = 0, description = {}, model = "qiugejpa"},
				{name = "Rolls Royce Phantom", costs = 0, description = {}, model = "rrphantom"},
				{name = "SuperVolito", costs = 0, description = {}, model = "supervolito2"},
				{name = "Barca", costs = 0, description = {}, model = "suntrap"},
				{name = "Jetsky", costs = 0, description = {}, model = "Seashark"},
			}
		},
		["job"] = {
			title = "job",
			name = "job",
			buttons = {
				{name = "cop", description = ''},
				{name = "fbi", description = ''},
				{name = "fisher", description = ''},
				{name = "ems", description = ''},
				{name = "uber", description = ''},
				{name = "lawyer", description = ''},
				{name = "delivery", description = ''},
				{name = "repair", description = ''},
				{name = "bankdriver", description = ''},
				{name = "medicalweed", description = ''},
			}
		},
		["cop"] = {
			title = "cop",
			name = "cop",
			buttons = {
				{name = "SWAT", costs = 0, description = {}, model = "riot"},
				{name = "Dacia Logan MCV", costs = 0, description = {}, model = "gresley"},
				{name = "Mercedes", costs = 0, description = {}, model = "police"},
				{name = "Lamborghini", costs = 0, description = {}, model = "police5"},
				{name = "BMW R1200RT", costs = 0, description = {}, model = "policeb"},
				-- {name = "Bugatti Chiron", costs = 0, description = {}, model = "polchiron"},
				{name = "Insurgent S.W.A.T", costs = 0, description = {}, model = "policeinsurgent"},
				{name = "Bugatti Veyron", costs = 0, description = {}, model = "polveyron"},
				{name = "Dacia Logan Politie", costs = 0, description = {}, model = "dacia_logan_politie"},
				{name = "Police UnderCover", costs = 0, description = {}, model = "fbi"},
				{name = "Police UnderCover1", costs = 0, description = {}, model = "police4"},
				{name = "Police audi", costs = 0, description = {}, model = "police2"},
				{name = "Maserati", costs = 0, description = {}, model = "ghispo2"},
				{name = "Pasat", costs = 0, description = {}, model = "police3"},
				{name = "Police Maverick", costs = 0, description = {}, model = "polmav"},
				{name = "Barca", costs = 0, description = {}, model = "Predator"},
				{name = "Jetsky", costs = 0, description = {}, model = "Seashark"},
				{name = "Duster Jandarm", costs = 0, description = {}, model = "sheriff2"},
				{name = "Lexus", costs = 0, description = {}, model = "polgs350"},
			}
		},
		
		["fisher"] = {
			title = "fisher",
			name = "fisher",
			buttons = {
				{name = "fisherboat", costs = 0, description = {}, model = "suntrap"},
			}
		},
		
		["fbi"] = {
			title = "fbi",
			name = "fbi",
			buttons = {
				{name = "Maverick", costs = 0, description = {}, model = "polmav"},
			}
		},
		
		["ems"] = {
			title = "ems",
			name = "ems",
			buttons = {
				{name = "AMBULANCE", costs = 0, description = {}, model = "ambulance"},
			}
		},
		
		["uber"] = {
			title = "uber",
			name = "uber",
			buttons = {
				{name = "Surge", costs = 200000, description = {}, model = "surge"},
			}
		},
		
		["lawyer"] = {
			title = "lawyer",
			name = "lawyer",
			buttons = {
				{name = "lawyercar1", costs = 0, description = {}, model = "panto"},
			}
		},
		
		["delivery"] = {
			title = "delivery",
			name = "delivery",
			buttons = {
				{name = "deliverycar1", costs = 0, description = {}, model = "faggio3"},
			}
		},
		
		["repair"] = {
			title = "repair",
			name = "repair",
			buttons = {
				{name = "repaircar1", costs = 0, description = {}, model = "towtruck2"},
				{name = "repaircar2", costs = 0, description = {}, model = "utillitruck3"},
			}
		},
		
		["bankdriver"] = {
			title = "bankdriver",
			name = "bankdriver",
			buttons = {
				{name = "bankdrivercar1", costs = 0, description = {}, model = "stockade"},
			}
		},
		
		["medicalweed"] = {
			title = "medicalweed",
			name = "medicalweed",
			buttons = {
				{name = "medicalweedcar1", costs = 0, description = {}, model = "pony2"},
			}
		},
		["vip"] = {
			title = "vip",
			name = "vip",
			buttons = {
				{name = "Bugatti Veyron", costs = 5000000, description = {}, model = "bugatti"},
				{name = "Lamborghini Centenario", costs = 5000000, description = {}, model = "lp770r"},
				{name = "Koenigsegg Reger", costs = 5000000, description = {}, model = "regera"},
				{name = "Ford HOONIGAN", costs = 5000000, description = {}, model = "fordh"},				
				{name = "Maybach Exelero", costs = 5000000, description = {}, model = "exelero"},
				{name = "Lamborghini Veneno", costs = 5000000, description = {}, model = "veneno"},
				{name = "Dodge Challenger", costs = 5000000, description = {}, model = "rampage10"},
				{name = "Porche Panamera", costs = 5000000, description = {}, model = "panamera18"},
				{name = "Rolls Royce Phantom", costs = 5000000, description = {}, model = "rrphantom"},	
				{name = "Scaldarsi", costs = 5000000, description = {}, model = "scaldarsi"},		
			}
		},
		["aviatie"] = {
			title = "aviatie",
			name = "aviatie",
			buttons = {
			}
		},
		["avivip"] = {
			title = "avivip",
			name = "avivip",
			buttons = {
			}
		},
		["helivip"] = {
			title = "helivip",
			name = "helivip",
			buttons = {
				{name = "Volatus", costs = 25000000, description = {}, model = "volatus"},
			}
		},

	}
}
local fakecar = {model = '', car = nil}
local vehshop_locations = {
{entering = {-33.803,-1102.322,25.422}, inside = {-51.882804870606,-1110.3469238282,26.43579864502}, outside = {-31.849,-1090.648,25.998,322.345}},
}

local vehshop_blips ={}
local inrangeofvehshop = false
local currentlocation = nil
local boughtcar = false

function vehSR_drawTxt(text,font,centre,x,y,scale,r,g,b,a)
	SetTextFont(font)
	SetTextProportional(0)
	SetTextScale(scale, scale)
	SetTextColour(r, g, b, a)
	SetTextDropShadow(0, 0, 0, 0,255)
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextCentre(centre)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x , y)
end

function vehSR_IsPlayerInRangeOfVehshop()
	return inrangeofvehshop
end

local firstspawn = 0
AddEventHandler('playerSpawned', function(spawn)
if firstspawn == 0 then
	--326 car blip 227 225
	vehSR_ShowVehshopBlips(true)
	firstspawn = 1
end
end)

function vehSR_ShowVehshopBlips(bool)
	if bool and #vehshop_blips == 0 then
		for station,pos in pairs(vehshop_locations) do
			local loc = pos
			pos = pos.entering
			local blip = AddBlipForCoord(pos[1],pos[2],pos[3])
			-- 60 58 137
			SetBlipSprite(blip,326)
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString("Elite Showroom")
			EndTextCommandSetBlipName(blip)
			SetBlipAsShortRange(blip,true)
			SetBlipAsMissionCreatorBlip(blip,true)
			table.insert(vehshop_blips, {blip = blip, pos = loc})
		end
		Citizen.CreateThread(function()
			while #vehshop_blips > 0 do
				Citizen.Wait(0)
				local inrange = false
				for i,b in ipairs(vehshop_blips) do
					if IsPlayerWantedLevelGreater(GetPlayerIndex(),0) == false and vehshop.opened == false and IsPedInAnyVehicle(vehSR_LocalPed(), true) == false and  GetDistanceBetweenCoords(b.pos.entering[1],b.pos.entering[2],b.pos.entering[3],GetEntityCoords(vehSR_LocalPed())) < 5 then
						DrawMarker(1,b.pos.entering[1],b.pos.entering[2],b.pos.entering[3],0,0,0,0,0,0,2.001,2.0001,0.5001,0,155,255,200,0,0,0,0)
						vehSR_drawTxt("Apasa ~g~ENTER~s~ pentru a cumpara o ~b~masina",0,1,0.5,0.8,0.6,255,255,255,255)
						currentlocation = b
						inrange = true
					end
				end
				inrangeofvehshop = inrange
			end
		end)
	elseif bool == false and #vehshop_blips > 0 then
		for i,b in ipairs(vehshop_blips) do
			if DoesBlipExist(b.blip) then
				SetBlipAsMissionCreatorBlip(b.blip,false)
				Citizen.InvokeNative(0x86A652570E5F25DD, Citizen.PointerValueIntInitialized(b.blip))
			end
		end
		vehshop_blips = {}
	end
end

function vehSR_f(n)
	return n + 0.0001
end

function vehSR_LocalPed()
	return GetPlayerPed(-1)
end

function vehSR_try(f, catch_f)
	local status, exception = pcall(f)
	if not status then
		catch_f(exception)
	end
end
function vehSR_firstToUpper(str)
    return (str:gsub("^%l", string.upper))
end
--local veh = nil
function vehSR_OpenCreator()
	boughtcar = false
	local ped = vehSR_LocalPed()
	local pos = currentlocation.pos.inside
	FreezeEntityPosition(ped,true)
	SetEntityVisible(ped,false)
	local g = Citizen.InvokeNative(0xC906A7DAB05C8D2B,pos[1],pos[2],pos[3],Citizen.PointerValueFloat(),0)
	SetEntityCoords(ped,pos[1],pos[2],g)
	SetEntityHeading(ped,pos[4])
	vehshop.currentmenu = "main"
	vehshop.opened = true
	vehshop.selectedbutton = 0
end
local vehicle_price = 0
function vehSR_CloseCreator(vehicle,veh_type)
	Citizen.CreateThread(function()
		local ped = vehSR_LocalPed()
		if not boughtcar then
			local pos = currentlocation.pos.entering
			SetEntityCoords(ped,pos[1],pos[2],pos[3])
			FreezeEntityPosition(ped,false)
			SetEntityVisible(ped,true)
		else
			deleteVehiclePedIsIn()
			vRP.teleport({-31.849,-1090.648,25.998,322.345})
			vRPg.spawnBoughtVehicle({veh_type, vehicle})
			SetEntityVisible(ped,true)
			FreezeEntityPosition(ped,false)
		end
		vehshop.opened = false
		vehshop.menu.from = 1
		vehshop.menu.to = 10
	end)
end

function vehSR_drawMenuButton(button,x,y,selected)
	local menu = vehshop.menu
	SetTextFont(menu.font)
	SetTextProportional(0)
	SetTextScale(menu.scale, menu.scale)
	if selected then
		SetTextColour(0, 0, 0, 255)
	else
		SetTextColour(255, 255, 255, 255)
	end
	SetTextCentre(0)
	SetTextEntry("STRING")
	AddTextComponentString(button.name)
	if selected then
		DrawRect(x,y,menu.width,menu.height,255,255,255,255)
	else
		DrawRect(x,y,menu.width,menu.height,0,0,0,150)
	end
	DrawText(x - menu.width/2 + 0.005, y - menu.height/2 + 0.0028)
end

function vehSR_drawMenuTitle(txt,x,y)
local menu = vehshop.menu
	SetTextFont(2)
	SetTextProportional(0)
	SetTextScale(0.5, 0.5)
	SetTextColour(255, 255, 255, 255)
	SetTextEntry("STRING")
	AddTextComponentString(txt)
	DrawRect(x,y,menu.width,menu.height,0,0,0,150)
	DrawText(x - menu.width/2 + 0.005, y - menu.height/2 + 0.0028)
end
function vehSR_tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end
function vehSR_Notify(text)
SetNotificationTextEntry('STRING')
AddTextComponentString(text)
DrawNotification(false, false)
end

function vehSR_drawMenuRight(txt,x,y,selected)
	local menu = vehshop.menu
	SetTextFont(menu.font)
	SetTextProportional(0)
	SetTextScale(menu.scale, menu.scale)
	if selected then
		SetTextColour(0, 0, 0, 255)
	else
		SetTextColour(255, 255, 255, 255)
	end
	SetTextCentre(0)
	SetTextEntry("STRING")
	AddTextComponentString(txt)
	DrawText(x + menu.width/2 - 0.06, y - menu.height/2 + 0.0028)
end
local backlock = false
Citizen.CreateThread(function()
	local last_dir
	while true do
		Citizen.Wait(0)
		if IsControlJustPressed(1,201) and vehSR_IsPlayerInRangeOfVehshop() then
			if vehshop.opened then
				vehSR_CloseCreator("","")
			else
				vehSR_OpenCreator()
			end
		end
		if vehshop.opened then
			local ped = vehSR_LocalPed()
			local menu = vehshop.menu[vehshop.currentmenu]
			vehSR_drawTxt(vehshop.title,1,1,vehshop.menu.x,vehshop.menu.y,1.0, 255,255,255,255)
			vehSR_drawMenuTitle(menu.title, vehshop.menu.x,vehshop.menu.y + 0.08)
			vehSR_drawTxt(vehshop.selectedbutton.."/"..vehSR_tablelength(menu.buttons),0,0,vehshop.menu.x + vehshop.menu.width/2 - 0.0385,vehshop.menu.y + 0.067,0.4, 255,255,255,255)
			local y = vehshop.menu.y + 0.12
			buttoncount = vehSR_tablelength(menu.buttons)
			local selected = false

			for i,button in pairs(menu.buttons) do
				if i >= vehshop.menu.from and i <= vehshop.menu.to then

					if i == vehshop.selectedbutton then
						selected = true
					else
						selected = false
					end
					vehSR_drawMenuButton(button,vehshop.menu.x,y,selected)
					if button.costs ~= nil then
						if vehshop.currentmenu == "audi" or vehshop.currentmenu == "bmw" or vehshop.currentmenu == "Hitman" or vehshop.currentmenu == "Mafia" or vehshop.currentmenu == "mercedesbenz" or vehshop.currentmenu == "ferrari" or vehshop.currentmenu == "Porsche" or vehshop.currentmenu == "Volkswagen" or vehshop.currentmenu == "Lux" or vehshop.currentmenu == "cars5" or vehshop.currentmenu == "biciclete" or vehshop.currentmenu == "altele" or vehshop.currentmenu == "motociclete" or vehshop.currentmenu == "cop" or vehshop.currentmenu == "fbi" or vehshop.currentmenu == "fisher" or vehshop.currentmenu == "ems" or vehshop.currentmenu == "uber" or vehshop.currentmenu == "lawyer" or vehshop.currentmenu == "delivery" or vehshop.currentmenu == "repair" or vehshop.currentmenu == "bankdriver" or vehshop.currentmenu == "medicalweed" or vehshop.currentmenu == "vip" or vehshop.currentmenu == "avivip" or vehshop.currentmenu == "helivip" or vehshop.currentmenu == "Lamborghini" then
							vehSR_drawMenuRight(button.costs.."$",vehshop.menu.x,y,selected)
						else
							vehSR_drawMenuButton(button,vehshop.menu.x,y,selected)
						end
					end
					y = y + 0.04
					if vehshop.currentmenu == "audi" or vehshop.currentmenu == "bmw" or vehshop.currentmenu == "Hitman" or vehshop.currentmenu == "Mafia" or vehshop.currentmenu == "mercedesbenz" or vehshop.currentmenu == "ferrari" or vehshop.currentmenu == "Porsche" or vehshop.currentmenu == "Volkswagen" or vehshop.currentmenu == "Lux" or vehshop.currentmenu == "cars5" or vehshop.currentmenu == "biciclete" or vehshop.currentmenu == "altele" or vehshop.currentmenu == "motociclete" or vehshop.currentmenu == "cop" or vehshop.currentmenu == "fbi" or vehshop.currentmenu == "fisher" or vehshop.currentmenu == "ems" or vehshop.currentmenu == "uber" or vehshop.currentmenu == "lawyer" or vehshop.currentmenu == "delivery" or vehshop.currentmenu == "repair" or vehshop.currentmenu == "bankdriver" or vehshop.currentmenu == "medicalweed" or vehshop.currentmenu == "vip" or vehshop.currentmenu == "avivip" or vehshop.currentmenu == "helivip" or vehshop.currentmenu == "Lamborghini" then
						if selected then
							if fakecar.model ~= button.model then
								if DoesEntityExist(fakecar.car) then
									Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(fakecar.car))
								end
								local pos = currentlocation.pos.inside
								local hash = GetHashKey(button.model)
								RequestModel(hash)
								local timer = 0
								while not HasModelLoaded(hash) and timer < 255 do
									Citizen.Wait(1)
									vehSR_drawTxt("Loading...",0,1,0.5,0.5,1.5,255,255-timer,255-timer,255)
									RequestModel(hash)
									timer = timer + 1
								end
								if timer < 255 then
									local veh = CreateVehicle(hash,pos[1],pos[2],pos[3],pos[4],false,false)
									while not DoesEntityExist(veh) do
										Citizen.Wait(1)
										vehSR_drawTxt("Loading...",0,1,0.5,0.5,1.5,255,255-timer,255-timer,255)
									end
									FreezeEntityPosition(veh,true)
									SetEntityInvincible(veh,true)
									SetVehicleDoorsLocked(veh,4)
									--SetEntityCollision(veh,false,false)
									TaskWarpPedIntoVehicle(vehSR_LocalPed(),veh,-1)
									for i = 0,24 do
										SetVehicleModKit(veh,0)
										RemoveVehicleMod(veh,i)
									end
									fakecar = { model = button.model, car = veh}
								else
									timer = 0
									while timer < 50 do
										Citizen.Wait(1)
										vehSR_drawTxt("Failed!",0,1,0.5,0.5,1.5,255,0,0,255)
										timer = timer + 1
									end
									if last_dir then
										if vehshop.selectedbutton < buttoncount then
											vehshop.selectedbutton = vehshop.selectedbutton +1
											if buttoncount > 10 and vehshop.selectedbutton > vehshop.menu.to then
												vehshop.menu.to = vehshop.menu.to + 1
												vehshop.menu.from = vehshop.menu.from + 1
											end
										else
											last_dir = false
											vehshop.selectedbutton = vehshop.selectedbutton -1
											if buttoncount > 10 and vehshop.selectedbutton < vehshop.menu.from then
												vehshop.menu.from = vehshop.menu.from -1
												vehshop.menu.to = vehshop.menu.to - 1
											end
										end
									else
										if vehshop.selectedbutton > 1 then
											vehshop.selectedbutton = vehshop.selectedbutton -1
											if buttoncount > 10 and vehshop.selectedbutton < vehshop.menu.from then
												vehshop.menu.from = vehshop.menu.from -1
												vehshop.menu.to = vehshop.menu.to - 1
											end
										else
											last_dir = true
											vehshop.selectedbutton = vehshop.selectedbutton +1
											if buttoncount > 10 and vehshop.selectedbutton > vehshop.menu.to then
												vehshop.menu.to = vehshop.menu.to + 1
												vehshop.menu.from = vehshop.menu.from + 1
											end
										end
									end
								end
							end
						end
					end
					if selected and IsControlJustPressed(1,201) then
						vehSR_ButtonSelected(button)
					end
				end
			end
			if IsControlJustPressed(1,202) then
				vehSR_Back()
			end
			if IsControlJustReleased(1,202) then
				backlock = false
			end
			if IsControlJustPressed(1,188) then
				last_dir = false
				if vehshop.selectedbutton > 1 then
					vehshop.selectedbutton = vehshop.selectedbutton -1
					if buttoncount > 10 and vehshop.selectedbutton < vehshop.menu.from then
						vehshop.menu.from = vehshop.menu.from -1
						vehshop.menu.to = vehshop.menu.to - 1
					end
				end
			end
			if IsControlJustPressed(1,187)then
				last_dir = true
				if vehshop.selectedbutton < buttoncount then
					vehshop.selectedbutton = vehshop.selectedbutton +1
					if buttoncount > 10 and vehshop.selectedbutton > vehshop.menu.to then
						vehshop.menu.to = vehshop.menu.to + 1
						vehshop.menu.from = vehshop.menu.from + 1
					end
				end
			end
		end

	end
end)


function vehSR_round(num, idp)
  if idp and idp>0 then
    local mult = 10^idp
    return math.floor(num * mult + 0.5) / mult
  end
  return math.floor(num + 0.5)
end
function vehSR_ButtonSelected(button)
	local ped = GetPlayerPed(-1)
	local this = vehshop.currentmenu
	local btn = button.name
	if this == "main" then
		if btn == "masini" then
			vehSR_OpenMenu('masini')
		elseif btn == "Hitman" then
			vehSR_OpenMenu('Hitman')
		elseif btn == "biciclete" then
			vehSR_OpenMenu('biciclete')
		elseif btn == "motociclete" then
			vehSR_OpenMenu('motociclete')
		elseif btn == "job" then
			vehSR_OpenMenu('job')
		elseif btn == "Mafia" then
			vehSR_OpenMenu('Mafia')
		elseif btn == "vip" then
			vehSR_OpenMenu('vip')
		elseif btn == "aviatie" then
			vehSR_OpenMenu('aviatie')
		end
	elseif this == "masini" then
		if btn == "audi" then
			vehSR_OpenMenu('audi')
		elseif btn == "bmw" then
			vehSR_OpenMenu('bmw')
		elseif btn == "mercedesbenz" then
			vehSR_OpenMenu('mercedesbenz')
		elseif btn == "Lamborghini" then
			vehSR_OpenMenu('Lamborghini')
		elseif btn == "ferrari" then
			vehSR_OpenMenu('ferrari')
		elseif btn == "Porsche" then
			vehSR_OpenMenu('Porsche')
		elseif btn == "Volkswagen" then
			vehSR_OpenMenu("Volkswagen")
		elseif btn == "Lux" then
			vehSR_OpenMenu('Lux')
		elseif btn == "cars5" then
			vehSR_OpenMenu('cars5')
		elseif btn == "altele" then
			vehSR_OpenMenu('altele')
		end
	elseif this == "job" then
		if btn == "cop" then
			vehSR_OpenMenu('cop')
		elseif btn == "fbi" then
			vehSR_OpenMenu('fbi')
		elseif btn == "fisher" then
			vehSR_OpenMenu('fisher')
		elseif btn == "ems" then
			vehSR_OpenMenu('ems')
		elseif btn == "uber" then
			vehSR_OpenMenu('uber')
		elseif btn == "lawyer" then
			vehSR_OpenMenu('lawyer')
		elseif btn == "delivery" then
			vehSR_OpenMenu("delivery")
		elseif btn == "repair" then
			vehSR_OpenMenu('repair')
		elseif btn == "bankdriver" then
			vehSR_OpenMenu('bankdriver')
		elseif btn == "medicalweed" then
			vehSR_OpenMenu('medicalweed')
		end
	elseif this == "aviatie" then
		if btn == "avivip" then
			vehSR_OpenMenu('avivip')
		elseif btn == "helivip" then
			vehSR_OpenMenu('helivip')
		end
	elseif this == "audi" or this == "bmw" or this == "Hitman" or this == "mercedesbenz" or this == "ferrari" or this == "Mafia" or this == "Porsche" or this == "Volkswagen" or this == "Lux" or this == "cars5" or this == "biciclete" or this == "altele" or this == "cop" or this == "fbi" or this == "fisher" or this == "ems" or this == "uber" or this == "lawyer" or this == "delivery" or this == "repair" or this == "bankdriver" or this == "medicalweed" or this == "vip" or this == "avivip" or this == "helivip" or vehshop.currentmenu == "Lamborghini" then
		TriggerServerEvent('veh_SR:CheckMoneyForVeh',this,button.model,button.costs, "car")
    elseif  this == "motociclete" then
		TriggerServerEvent('veh_SR:CheckMoneyForVeh',this,button.model,button.costs, "bike")
	end
end

RegisterNetEvent('veh_SR:CloseMenu')
AddEventHandler('veh_SR:CloseMenu', function(vehicle, veh_type)
	boughtcar = true
	vehSR_CloseCreator(vehicle,veh_type)
end)

function vehSR_OpenMenu(menu)
	fakecar = {model = '', car = nil}
	vehshop.lastmenu = vehshop.currentmenu
	if menu == "masini" then
		vehshop.lastmenu = "main"
	elseif menu == "Hitman"  then
		vehshop.lastmenu = "main"
	elseif menu == "motociclete"  then
		vehshop.lastmenu = "main"
	elseif menu == "Mafia"  then
		vehshop.lastmenu = "main"
    elseif menu == "biciclete"  then
		vehshop.lastmenu = "main"
	elseif menu == "job"  then
		vehshop.lastmenu = "main"
	elseif menu == "vip"  then
		vehshop.lastmenu = "main"
	elseif menu == "aviatie"  then
		vehshop.lastmenu = "main"
	elseif menu == 'race_create_objects' then
		vehshop.lastmenu = "main"
	elseif menu == "race_create_objects_spawn" then
		vehshop.lastmenu = "race_create_objects"
	end
	vehshop.menu.from = 1
	vehshop.menu.to = 10
	vehshop.selectedbutton = 0
	vehshop.currentmenu = menu
end


function vehSR_Back()
	if backlock then
		return
	end
	backlock = true
	if vehshop.currentmenu == "main" then
		vehSR_CloseCreator("","")
	elseif vehshop.currentmenu == "audi" or vehshop.currentmenu == "bmw" or vehshop.currentmenu == "Hitman" or vehshop.currentmenu == "Mafia" or vehshop.currentmenu == "mercedesbenz" or vehshop.currentmenu == "ferrari" or vehshop.currentmenu == "Porsche" or vehshop.currentmenu == "Volkswagen" or vehshop.currentmenu == "Lux" or vehshop.currentmenu == "cars5" or vehshop.currentmenu == "biciclete" or vehshop.currentmenu == "altele" or vehshop.currentmenu == "motociclete" or vehshop.currentmenu == "cop" or vehshop.currentmenu == "fisher" or vehshop.currentmenu == "fbi" or vehshop.currentmenu == "ems" or vehshop.currentmenu == "uber" or vehshop.currentmenu == "lawyer" or vehshop.currentmenu == "delivery" or vehshop.currentmenu == "repair" or vehshop.currentmenu == "bankdriver" or vehshop.currentmenu == "medicalweed" or vehshop.currentmenu == "vip" or vehshop.currentmenu == "aviatie" or vehshop.currentmenu == "Lamborghini" then
		if DoesEntityExist(fakecar.car) then
			Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(fakecar.car))
		end
		fakecar = {model = '', car = nil}
		vehSR_OpenMenu(vehshop.lastmenu)
	else
		vehSR_OpenMenu(vehshop.lastmenu)
	end

end

function vehSR_stringstarts(String,Start)
   return string.sub(String,1,string.len(Start))==Start
end
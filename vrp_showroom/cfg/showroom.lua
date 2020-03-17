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
				{name = "Dacia", description = ''},
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
				{name = "Audi RS5", costs = 70000, description = {}, model = "RS5"},
			    {name = "Audi RS3", costs = 55000, description = {}, model = "rs3"},
			    {name = "Audi SQ7 2016", costs = 70000, description = {}, model = "SQ72016"},			
			    {name = "Audi RS7", costs = 60000, description = {}, model = "rs7"},
			    {name = "Audi A8", costs = 55000, description = {}, model = "a8fsi"},
				{name = "Audi R8", costs = 90000, description = {}, model = "r8ppi"},
				{name = "Audi TT", costs = 95000, description = {}, model = "tts"},
			}
		},
		["bmw"] = {
			title = "bmw",
			name = "bmw",
			buttons = {
			    {name = "BMW M2", costs = 40000, description = {}, model = "m2"},
			    {name = "BMW M3", costs = 45000, description = {}, model = "m3f80"},
			    {name = "BMW M3 E92", costs = 47000, description = {}, model = "m3e92"},
                {name = "BMW E30", costs = 30000, description = {}, model = "m3e30"},			
				{name = "BMW M6", costs = 60000, description = {}, model = "m6f13"},
                {name = "BMW 7", costs = 80000, description = {}, model = "lumma750"},			
			    {name = "BMW I8", costs = 90000, description = {}, model = "i8"},
				{name = "BMW X5", costs = 45000, description = {}, model = "x5m13"},
				{name = "BMW X6", costs = 55000, description = {}, model = "x6m"},
				{name = "BMW M4LB", costs = 35000, description = {}, model = "rmodm4gts"},
				{name = "BMW M5F90", costs = 65000, description = {}, model = "m5f90"},
				{name = "BMW M760I", costs = 75000, description = {}, model = "17m760i"},
				{name = "BMW M4 Rejin", costs = 55000, description = {}, model = "rmodm4"},
				{name = "BMW Z4", costs = 55000, description = {}, model = "z4"},
				{name = "BMW M8", costs = 80000, description = {}, model = "bm8c"},
			}
		},
		["mercedesbenz"] = {
			title = "mercedesbenz",
			name = "mercedesbenz",
			buttons = {
			    {name = "Mercedes Benz ML Brabus", costs = 25000, description = {}, model = "mlbrabus"},			
			    {name = "Mercedes Benz AMG c63", costs = 45000, description = {}, model = "c63s"},
			    {name = "Mercedes Vision GT", costs = 50000, description = {}, model = "mvisiongt"},
			    {name = "Mercedes A45AMG", costs = 35000, description = {}, model = "a45amg"},
			    {name = "Mercedes GLE450", costs = 60000, description = {}, model = "mbgle"},
				{name = "Mercedes GT", costs = 55000, description = {}, model = "amggt"},
				{name = "Mercedes GL63", costs = 45000, description = {}, model = "gl63"},
				{name = "Mercedes G65", costs = 45000, description = {}, model = "g65amg"},
				{name = "Mercedes S400", costs = 65000, description = {}, model = "x222"},
			}
		},
		["Dacia"] = {
			title = "Dacia",
			name = "Dacia",
			buttons = {
				{name = "Dacia 1310 Sport", costs = 7000, description = {}, model = "1310s"},	
				{name = "Dacia logan", costs = 15000, description = {}, model = "logan"},
				{name = "Dacia sandero", costs = 20000, description = {}, model = "Sandero"},	
				{name = "Dacia Duster", costs = 25000, description = {}, model = "daduster"},	
			}
		},
		["ferrari"] = {
			title = "ferrari",
			name = "ferrari",
			buttons = {
				{name = "Ferrari LaFerrari", costs = 550000, description = {}, model = "aperta"},	
				{name = "Ferrari F812", costs = 1000000, description = {}, model = "f812"},			
			}
		},
		["Porsche"] = {
			title = "Porsche",
			name = "Porsche",
			buttons = {
				{name = "Porsche 911R", costs = 70000, description = {}, model = "p911r"},			
			    {name = "Porsche Panamera", costs = 75000, description = {}, model = "pturismo"},
			    {name = "Porsche CayenneS", costs = 60000, description = {}, model = "cayenne"},		
			}
		},
		["Volkswagen"] = {
			title = "Volkswagen",
			name = "Volkswagen",
			buttons = {
			    {name = "Volkswagen Golf V GTI", costs = 20000, description = {}, model = "golfgti"},	
			    {name = "Volkswagen Golf MK1", costs = 7500, description = {}, model = "golf1"},				
			}
		},
		["Lux"] = {
			title = "Lux",
			name = "Lux",
			buttons = {
				{name = "Lamborghini Centenario", costs = 1500000, description = {}, model = "lp770r"},
			    {name = "Bentley Continental", costs = 45000, description = {}, model = "contgt13"},
				{name = "Pontiac", costs = 50000, description = {}, model = "firebird"},
			    {name = "Nissan GTR", costs = 100000, description = {}, model = "gtr"},
			    {name = "Maserati", costs = 75000, description = {}, model = "mlnovitec"},
			    {name = "McLaren P1", costs = 120000, description = {}, model = "p1"},
			    {name = "Toyota Supra", costs = 75000, description = {}, model = "supra2"},
			    {name = "Chevrolet Corvette", costs = 85000, description = {}, model = "c7"},
				{name = "Aston Martin", costs = 90000, description = {}, model = "ast"},
				{name = "Mustang GT", costs = 85000, description = {}, model = "rmodmustang"},
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
				{name = "Bentley Bentayga", costs = 30000, description = {}, model = "urus"},
				{name = "Jaguar F-Pace S", costs = 20000, description = {}, model = "fpace"},	
                {name = "Honda Civic", costs = 15000, description = {}, model = "hondacivictr"},					
			    {name = "Toyota GT86", costs = 40000, description = {}, model = "gt86"},
			    {name = "Seat Leon", costs = 15000, description = {}, model = "seatleon"},
			    {name = "Ford Mustang GT", costs = 100000, description = {}, model = "mgt"},
			    {name = "AstonExtreme", costs = 90000, description = {}, model = "db11"},			
			    {name = "Viper", costs = 100000, description = {}, model = "viper"},			
			    {name = "Chevrolet Camaro", costs = 95000, description = {}, model = "cczl"},
			    {name = "Honda S2000", costs = 110000, description = {}, model = "ap2"},
			    {name = "Mazda 6", costs = 15000, description = {}, model = "na6"},			
			    {name = "Mitsubishi EVO10", costs = 30000, description = {}, model = "evo10"},			
			    {name = "Nissan 370Z", costs = 50000, description = {}, model = "370z"},
			    {name = "Nissan Titan", costs = 450000, description = {}, model = "nissantitan17"},			
			    {name = "Alfa Romeo Giulia", costs = 70000, description = {}, model = "giulia"},
			    {name = "Nissan Skyline", costs = 65000, description = {}, model = "skyline"},
			    {name = "Jeep SRT", costs = 35000, description = {}, model = "srt8"},	
                {name = "Lamborghini Urus", costs = 120000, description = {}, model = "urus2018"},					
			    {name = "2006 Mitsubishi Lancer Evolution IX P1", costs = 55000, description = {}, model = "fnflan"},	
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
				{name = "Jeep OffRoad", costs = 0, description = {}, model = "qiugejpa"},
				{name = "BMW M4", costs = 0, description = {}, model = "m4f82"},
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
				-- {name = "Dacia Logan Politie", costs = 0, description = {}, model = "dacia_logan_politie"},
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
				--{name = "Lamborghini Centenario", costs = 0, description = {}, model = "lp770r"},
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

return vehshop
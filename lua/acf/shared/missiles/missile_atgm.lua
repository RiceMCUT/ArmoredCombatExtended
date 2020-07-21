ACF_defineGunClass("ATGM", {
    type            = "missile",
	spread          = 1,
	name            = "(Missile) Anti-Tank Guided Missile",
	desc            = ACFTranslation.MissileClasses[4],
	muzzleflash     = "40mm_muzzleflash_noscale",
	rofmod          = 1,
	sound           = "acf_extra/airfx/rocket_fire2.wav",
	year = 1969,
	soundDistance   = " ",
	soundNormal     = " ",
--    effect          = "Rocket_Smoke_Trail",
    effect          = "Rocket Motor ATGM",
    reloadmul       = 6,

    ammoBlacklist   = {"AP", "APHE", "FL", "SM"} -- Including FL would mean changing the way round classes work.
} )

-- The BGM-71E, a wire guided missile with medium anti-tank effectiveness.
ACF_defineGun("BGM-71E ASM", { --id
	name = "BGM-71 Missile",
	desc = "The BGM-71E missile is a lightweight, wire guided anti-tank munition. It can be used in both air-to-surface and surface-to-surface combat, making it a decent alternative for ground vehicles.",
	model = "models/missiles/bgm_71e.mdl",
	gunclass = "ATGM",
    rack = "1x BGM-71E",  -- Which rack to spawn this missile on?
	length = 46,		--Used for the physics calculations
	caliber = 13,
	weight = 76.4,    -- Don't scale down the weight though!
	year = 1970,
	rofmod = 1.2,
	round = {
		model		= "models/missiles/bgm_71e.mdl",
		rackmdl		= "models/missiles/bgm_71e.mdl",
		maxlength	= 105,
		casing		= 0.1,				-- thickness of missile casing, cm
		armour		= 4,				-- effective armour thickness of casing, in mm
		propweight	= 1.2,				-- motor mass - motor casing
		thrust		= 10000,				-- average thrust - kg*in/s^2
		burnrate	= 200,				-- cm^3/s at average chamber pressure
		starterpct	= 0.2,				-- percentage of the propellant consumed in the starter motor.
		minspeed	= 2000,				-- minimum speed beyond which the fins work at 100% efficiency
		dragcoef	= 0.003,			-- drag coefficient while falling
        dragcoefflight  = 0.06,                 -- drag coefficient during flight
		finmul		= 0.05,			-- fin multiplier (mostly used for unpropelled guidance)
        penmul      = math.sqrt(0.797)  	-- HEAT velocity multiplier. Squared relation to penetration (math.sqrt(2) means 2x pen)
	},

    ent         = "acf_missile_to_rack", -- A workaround ent which spawns an appropriate rack for the missile.
    guidance    = {"Dumb", "Wire"},
    fuses       = {"Contact", "Optical"},

    racks       = {["1x BGM-71E"] = true, ["2x BGM-71E"] = true, ["4x BGM-71E"] = true},    -- a whitelist for racks that this missile can load into.  can also be a 'function(bulletData, rackEntity) return boolean end'

    agility     = 0.14,     -- multiplier for missile turn-rate.
    armdelay    = 0.00     -- minimum fuse arming delay
} )

ACF_defineGun("9M113 ASM", { --id
	name = "9M133 Missile",
	desc = "The Kornet is a modern antitank missile, with good range and a very powerful warhead, but somewhat limited maneuverability.",
	model = "models/kali/weapons/kornet/parts/9m133 kornet missile.mdl",
	gunclass = "ATGM",
    rack = "1x Kornet",  -- Which rack to spawn this missile on?
	length = 66,
	caliber = 15.2,
	weight = 108,    -- Don't scale down the weight though!
    modeldiameter = 15.2, -- in cm
	year = 1994,
	rofmod = 1.4,
	round = {
		model		= "models/missiles/glatgm/9m112f.mdl", --shhh, don't look directly at the hacks, the attachments on the proper model are fucked up.
		rackmdl		= "models/kali/weapons/kornet/parts/9m133 kornet missile.mdl",
		maxlength	= 105,
		casing		= 0.2,			-- thickness of missile casing, cm
		armour		= 4,			-- effective armour thickness of casing, in mm
		propweight	= 1,			-- motor mass - motor casing
		thrust		= 7000,			-- average thrust - kg*in/s^2
		burnrate	= 40,			-- cm^3/s at average chamber pressure
		starterpct	= 0.2,			-- percentage of the propellant consumed in the starter motor.
		minspeed	= 500,			-- minimum speed beyond which the fins work at 100% efficiency
		dragcoef	= 0.001,		-- drag coefficient while falling
        dragcoefflight  = 0.03,                 -- drag coefficient during flight
		finmul		= 0.05,			-- fin multiplier (mostly used for unpropelled guidance)
        penmul      = math.sqrt(1.2)  	-- HEAT velocity multiplier. Squared relation to penetration (math.sqrt(2) means 2x pen)
	},

    ent         = "acf_missile_to_rack", -- A workaround ent which spawns an appropriate rack for the missile.
	guidance    = {"Dumb", "Laser"},
    fuses       = {"Contact", "Optical"},

    racks       = {["1x Kornet"] = true},    -- a whitelist for racks that this missile can load into.  can also be a 'function(bulletData, rackEntity) return boolean end'

    viewcone    = 25,   -- getting outside this cone will break the lock.  Divided by 2.

    agility     = 0.04,		-- multiplier for missile turn-rate.
    armdelay    = 0.00     -- minimum fuse arming delay
} )

-- The AT-3, a short-range wire-guided missile with better anti-tank effectiveness than the BGM-71E but much slower.
ACF_defineGun("AT-3 ASM", { --id
	name = "AT-3 Missile",
	desc = "The AT-3 missile (9M14P1) is a short-range wire-guided anti-tank munition. While powerful and lightweight its speed will make you die of old age before you hit the target.",
	model = "models/missiles/at3.mdl",
	gunclass = "ATGM",
    rack = "1xAT3RK",  -- Which rack to spawn this missile on?
	length = 43,		--Used for the physics calculations
	caliber = 13,
	weight = 48,    -- Don't scale down the weight though!
	year = 1969,
	rofmod = 1.1,
	round = {
		model		= "models/missiles/at3.mdl",
		rackmdl		= "models/missiles/at3.mdl",
		maxlength	= 55,
		casing		= 0.1,				-- thickness of missile casing, cm
		armour		= 4,				-- effective armour thickness of casing, in mm
		propweight	= 1.2,				-- motor mass - motor casing
		thrust		= 7000,				-- average thrust - kg*in/s^2
		burnrate	= 150,				-- cm^3/s at average chamber pressure
		starterpct	= 0.2,				-- percentage of the propellant consumed in the starter motor.
		minspeed	= 1500,				-- minimum speed beyond which the fins work at 100% efficiency
		dragcoef	= 0.005,			-- drag coefficient while falling
        dragcoefflight  = 0.1,                 -- drag coefficient during flight
		finmul		= 0.1,			-- fin multiplier (mostly used for unpropelled guidance)
        penmul      = math.sqrt(1)  	-- HEAT velocity multiplier. Squared relation to penetration (math.sqrt(2) means 2x pen)
	},

    ent         = "acf_missile_to_rack", -- A workaround ent which spawns an appropriate rack for the missile.
    guidance    = {"Dumb", "Wire"},
    fuses       = {"Contact", "Optical"},

	racks       = {["1xAT3RKS"] = true, ["1xAT3RK"] = true, ["1xRK_small"] = true, ["3xRK"] = true},    -- a whitelist for racks that this missile can load into.  can also be a 'function(bulletData, rackEntity) return boolean end'

	skinindex   = {HEAT = 0, HE = 1},

    agility     = 0.1,     -- multiplier for missile turn-rate.
    armdelay    = 0.00     -- minimum fuse arming delay
} )

-- The 9M120 Ataka, a laser guided missile with high anti-tank effectiveness.
ACF_defineGun("Ataka ASM", { --id
	name = "9M120 Ataka Missile",
	desc = "The 9M120 Ataka is a high-speed anti tank missile used by soviet helicopters and ground vehicles.  It has very limited maneuverability but excellent range and speed, and can be armed with HE and HEAT warheads",
	model = "models/missiles/9m120.mdl",
	gunclass = "ATGM",
    rack = "1x Ataka",  -- Which rack to spawn this missile on?
	length = 85,
	caliber = 13,
	weight = 198,    -- Don't scale down the weight though!
    modeldiameter = 17.2 * 1.27, -- in cm
	year = 1984,
	rofmod = 1.4,
	round = {
		model		= "models/missiles/9m120.mdl",
		rackmdl		= "models/missiles/9m120.mdl",
		maxlength	= 105,
		casing		= 0.12,			-- thickness of missile casing, cm
		armour		= 4,			-- effective armour thickness of casing, in mm
		propweight	= 1.7,			-- motor mass - motor casing
		thrust		= 18500,			-- average thrust - kg*in/s^2
		burnrate	= 130,			-- cm^3/s at average chamber pressure
		starterpct	= 0.3,			-- percentage of the propellant consumed in the starter motor.
		minspeed	= 5000,			-- minimum speed beyond which the fins work at 100% efficiency
		dragcoef	= 0.001,		-- drag coefficient while falling
        dragcoefflight  = 0.04,                 -- drag coefficient during flight
		finmul		= 0.05,			-- fin multiplier (mostly used for unpropelled guidance)
        penmul      = math.sqrt(0.854)  	-- HEAT velocity multiplier. Squared relation to penetration (math.sqrt(2) means 2x pen)
	},

    ent         = "acf_missile_to_rack", -- A workaround ent which spawns an appropriate rack for the missile.
	guidance    = {"Dumb", "Laser", "Infrared"},
    fuses       = {"Contact", "Optical"},

    racks       = {["1x Ataka"] = true, ["1xRK"] = true, ["2xRK"] = true, ["3xRK"] = true},    -- a whitelist for racks that this missile can load into.  can also be a 'function(bulletData, rackEntity) return boolean end'

    viewcone    = 20,   -- getting outside this cone will break the lock.  Divided by 2.

    agility     = 0.03,		-- multiplier for missile turn-rate.
    armdelay    = 0.00     -- minimum fuse arming delay
} )

ACF_defineGun("AT-2 ASM", { --id
	name = "AT-2 Missile",
	desc = "The 9M17P is a powerful long-range antitank missile, which sacrifices flight speed for killing power. Extremely agile, consider it a direct upgrade to the AT-3.",
	model = "models/missiles/at2.mdl",
	gunclass = "ATGM",
    rack = "1xRK",  -- Which rack to spawn this missile on?
	length = 55,		--Used for the physics calculations
	caliber = 16, 
	weight = 108,    -- Don't scale down the weight though!
	year = 1969,
	rofmod = 1.3,
	round = {
		model		= "models/missiles/at2.mdl",
		rackmdl		= "models/missiles/at2.mdl",
		maxlength	= 55,
		casing		= 0.1,			-- thickness of missile casing, cm
		armour		= 5,			-- effective armour thickness of casing, in mm
		propweight	= 1,			-- motor mass - motor casing
		thrust		= 1500,			-- average thrust - kg*in/s^2
		burnrate	= 25,			-- cm^3/s at average chamber pressure
		starterpct	= 0.5,			-- percentage of the propellant consumed in the starter motor.
		minspeed	= 500,			-- minimum speed beyond which the fins work at 100% efficiency
		dragcoef	= 0.001,		-- drag coefficient while falling
        dragcoefflight  = 0.01,                 -- drag coefficient during flight
		finmul		= 0.1,			-- fin multiplier (mostly used for unpropelled guidance)
        penmul      = math.sqrt(1.05)  	-- HEAT velocity multiplier. Squared relation to penetration (math.sqrt(2) means 2x pen)
	},

    ent         = "acf_missile_to_rack", -- A workaround ent which spawns an appropriate rack for the missile.
    guidance    = {"Dumb", "Laser", "Wire"},
    fuses       = {"Contact", "Optical"},
	viewcone    = 90,   -- getting outside this cone will break the lock.  Divided by 2.
    racks       = {["1xRK"] = true, ["2xRK"] = true, ["3xRK"] = true, ["4xRK"] = true, ["2x AGM-114"] = true, ["4x AGM-114"] = true, ["1xRK_small"] = true},    -- a whitelist for racks that this missile can load into.  can also be a 'function(bulletData, rackEntity) return boolean end'
    agility     = 0.2,     -- multiplier for missile turn-rate.
    armdelay    = 0.00     -- minimum fuse arming delay
} )

--[[
ACF_defineGun("FGM-148 ASM", { --id
	name = "Javelin Missile",
	desc = "A long range, hard hitting ATGM often used to top attack tanks. Extremely Agile and powerful. Long reload. Heavy.",
	model = "models/missiles/fgm148.mdl",
	gunclass = "ATGM",
    rack = "1xRK",  -- Which rack to spawn this missile on?
	length = 52,		--Used for the physics calculations
	caliber = 12.7, 
	weight = 97.2,    -- Don't scale down the weight though!
	year = 1989,
	rofmod = 1.5,
	round = {
		model		= "models/missiles/fgm148.mdl",
		rackmdl		= "models/missiles/fgm148.mdl",
		maxlength	= 60,
		casing		= 0.1,				-- thickness of missile casing, cm
		armour		= 4,				-- effective armour thickness of casing, in mm
		propweight	= 1,				-- motor mass - motor casing
		thrust		= 1300,				-- average thrust - kg*in/s^2
		burnrate	= 40,				-- cm^3/s at average chamber pressure
		starterpct	= 0.15,				-- percentage of the propellant consumed in the starter motor.
		minspeed	= 5,				-- minimum speed beyond which the fins work at 100% efficiency
		dragcoef	= 0.2,			-- drag coefficient while falling
                dragcoefflight  = 0.01,                 -- drag coefficient during flight
		finmul		= 0.1,			-- fin multiplier (mostly used for unpropelled guidance)
        penmul      = math.sqrt(3.2)  	-- HEAT velocity multiplier. Squared relation to penetration (math.sqrt(2) means 2x pen)
	},

    ent         = "acf_missile_to_rack", -- A workaround ent which spawns an appropriate rack for the missile.
    guidance    = {"Dumb", "Laser"},
    fuses       = {"Contact", "Optical"},
	viewcone    = 120,   -- getting outside this cone will break the lock.  Divided by 2.
    racks       = {["1xRK_small"] = true},    -- a whitelist for racks that this missile can load into.  can also be a 'function(bulletData, rackEntity) return boolean end'
    agility     = 0.28,     -- multiplier for missile turn-rate.
    armdelay    = 0.5     -- minimum fuse arming delay
} )
]]--
/datum/map/outreach/build_exoplanets()
	log_debug("MAP: building exoplanets!") //#REMOVEME
	if(!outreach_initialized)
		for(var/z in global.overmap_sectors)
			var/obj/effect/overmap/visitable/sector/exoplanet/outreach/O = global.overmap_sectors[z]
			if(istype(O))
				O.build_level() //We have to force outreach to update now, otherwise it won't set its atmosphere
				outreach_initialized = TRUE
				break
	. = ..()

/**Returns a list with the ratio (0 to 1) for each gases in the atmosphere of outreach. */
/proc/OutreachAtmosRatios()
	return list(
		/decl/material/gas/chlorine       = 0.17,
		/decl/material/gas/nitrogen       = 0.63,
		/decl/material/gas/carbon_dioxide = 0.11,
		)

/obj/effect/overmap/visitable/sector/exoplanet/outreach
	name                  = "\improper Outreach"
	desc                  = "A barren mining world covered in chlorine deserts, home to those lost in space."
	color                 = "#c9df9f"
	planetary_area        = /area/exoplanet/outreach
	daycycle              = 30 MINUTES
	night                 = FALSE
	lightlevel            = 0.7
	starlight_color       = COLOR_YELLOW_GRAY
	rock_colors           = list(COLOR_GRAY80, COLOR_PALE_GREEN_GRAY, COLOR_PALE_BTL_GREEN)
	plant_colors          = list(COLOR_PALE_PINK, COLOR_PALE_GREEN_GRAY, COLOR_CIVIE_GREEN)
	surface_color         = COLOR_PALE_GREEN_GRAY
	water_color           = COLOR_BOTTLE_GREEN
	water_material        = /decl/material/gas/chlorine
	ice_material          = /decl/material/gas/chlorine

	//Sector Access
	free_landing          = FALSE
	instant_contact       = TRUE

	//Level Gen
	possible_themes       = list()
	crust_strata          = /decl/strata/sedimentary
	sector_flags          = OVERMAP_SECTOR_KNOWN
	ruin_tags_whitelist   = RUIN_HABITAT | RUIN_NATURAL | RUIN_WATER
	features_budget       = 0
	spawn_weight          = 0 //Spawned manually

	//Fauna handling
	repopulating          = FALSE
	max_animal_count      = 0

	//Flora Handling
	flora_diversity       = 0
	has_trees             = FALSE

	/**Makes it more reliable to find the z-level linked to this sector */
	prefered_level_id = "outreach_4"

#if 0
/obj/effect/overmap/visitable/sector/exoplanet/outreach/Initialize(var/mapload, var/z_level)
	. = ..(mapload, global.using_map.station_levels[4])
	docking_codes = "[global.using_map.dock_name]"

	// Build Level workaround
	maxx = world.maxx
	maxy = world.maxy
	x_origin = TRANSITIONEDGE + 1
	y_origin = TRANSITIONEDGE + 1
	x_size = maxx - 2 * (TRANSITIONEDGE + 1)
	y_size = maxy - 2 * (TRANSITIONEDGE + 1)
	landing_points_to_place = min(round(0.1 * (x_size * y_size) / (shuttle_size * shuttle_size)), 3)
	planetary_area = ispath(planetary_area) ? new planetary_area : planetary_area

	generate_habitability()
	generate_atmosphere()
	generate_flora()
	generate_map()
	generate_planet_image()
	generate_daycycle()
	START_PROCESSING(SSobj, src)
#endif

/obj/effect/overmap/visitable/sector/exoplanet/outreach/select_strata()
	return //We already have picked a strata

/obj/effect/overmap/visitable/sector/exoplanet/outreach/generate_habitability()
	habitability_class = HABITABILITY_BAD

/obj/effect/overmap/visitable/sector/exoplanet/outreach/get_atmosphere_color()
	return COLOR_GREEN_GRAY

/obj/effect/overmap/visitable/sector/exoplanet/outreach/get_target_temperature()
	return T0C

/obj/effect/overmap/visitable/sector/exoplanet/outreach/get_target_pressure()
	return ONE_ATMOSPHERE * 0.5

/obj/effect/overmap/visitable/sector/exoplanet/outreach/get_mandatory_gasses()
	var/list/atmo = OutreachAtmosRatios()
	var/molestotal = (get_target_pressure() * CELL_VOLUME/(get_target_temperature() * R_IDEAL_GAS_EQUATION))
	for(var/gtype in atmo)
		LAZYSET(., gtype, (atmo[gtype] * molestotal))

/obj/effect/overmap/visitable/sector/exoplanet/outreach/build_level(max_x, max_y)
	docking_codes = "[global.using_map.dock_name]"
	maxx     = max_x ? max_x : world.maxx
	maxy     = max_y ? max_y : world.maxy
	x_origin = TRANSITIONEDGE + 1
	y_origin = TRANSITIONEDGE + 1
	x_size   = maxx - 2 * (TRANSITIONEDGE + 1)
	y_size   = maxy - 2 * (TRANSITIONEDGE + 1)
	landing_points_to_place = min(round(0.1 * (x_size * y_size) / (shuttle_size * shuttle_size)), 3)

	SetName("Planet [initial(name)]")
	planetary_area = new planetary_area()
	global.using_map.area_purity_test_exempt_areas += planetary_area.type

	if(ispath(weather_system, /decl/state/weather))
		weather_system = new /obj/abstract/weather_system(null, map_z[1], weather_system)
		weather_system.water_material = water_material
		weather_system.ice_material = ice_material

	generate_habitability()
	generate_atmosphere()
	generate_map()
	generate_landing()
	generate_daycycle()
	generate_planet_image()
	START_PROCESSING(SSobj, src)

//////////////////////////////////////////////////////////////////////////
// Mining Stuff
//////////////////////////////////////////////////////////////////////////
/datum/random_map/automata/cave_system/outreach/abyss
	iterations = 5
	descriptor = "outreach abyssal caves"
	wall_type =  /turf/exterior/wall/outreach/abyss
	floor_type = /turf/exterior/volcanic/mining/outreach/abyss
	mineral_turf = /turf/exterior/wall/random/outreach/abyss

/datum/random_map/automata/cave_system/outreach/subterrane
	iterations = 5
	descriptor = "outreach subterrane caves"
	wall_type =  /turf/exterior/wall/outreach/subterrane
	floor_type = /turf/exterior/barren/mining/outreach/subterrane
	mineral_turf = /turf/exterior/wall/random/outreach/subterrane

/datum/random_map/automata/cave_system/outreach/mountain
	iterations = 5
	descriptor = "outreach mountain caves"
	wall_type =  /turf/exterior/wall/outreach/mountain
	floor_type = /turf/exterior/volcanic/mining
	mineral_turf = /turf/exterior/wall/random/outreach/mountain

//////////////////////////////////////////////////////////////////////////
// Strata
//////////////////////////////////////////////////////////////////////////
/decl/strata/outreach
	default_strata_candidate = TRUE

/decl/strata/outreach/abyssal
	name = "metamorphic rock"
	base_materials = list(
		/decl/material/solid/stone/granite,
		/decl/material/solid/stone/basalt,
		)
	ores_rich = list(
		/decl/material/solid/sphalerite  = 20,
		/decl/material/solid/pitchblende = 30,
		/decl/material/solid/rutile      = 15,
		/decl/material/solid/cassiterite = 20,
		/decl/material/solid/hematite    = 40,
		/decl/material/solid/wolframite  = 25,
		/decl/material/solid/sperrylite  = 20,
		/decl/material/solid/quartz      = 40,
		/decl/material/solid/calaverite  = 10,
		/decl/material/solid/spodumene   = 10,
		/decl/material/solid/graphite    = 20,
		/decl/material/solid/sand        = 10,
	)
	ores_sparse = list(
		/decl/material/solid/densegraphite = 5,
		/decl/material/solid/cinnabar      = 5,
		/decl/material/solid/phosphorite   = 5,
	)

/decl/strata/outreach/subterrane
	name = "igneous rock"
	base_materials = list(
		/decl/material/solid/stone/granite,
		/decl/material/solid/stone/basalt,
		/decl/material/solid/stone/marble,
		/decl/material/solid/stone/slate,
		)
	ores_rich = list(
		/decl/material/solid/sodiumchloride = 20,
		/decl/material/gas/chlorine         = 15,
		/decl/material/solid/stone/basalt   = 20,
		/decl/material/solid/sand           = 10,
		/decl/material/solid/graphite       = 10,
		/decl/material/solid/bauxite        = 10,
		/decl/material/solid/hematite       = 15,
		/decl/material/solid/sphalerite     = 10,
		/decl/material/solid/quartz         = 40,
		/decl/material/solid/galena         = 8,
		/decl/material/solid/spodumene      = 10,
		/decl/material/solid/clay           = 8,
	)
	ores_sparse = list(
		/decl/material/solid/tetrahedrite   = 8,
		/decl/material/solid/hematite       = 5,
		/decl/material/solid/potash         = 5,
		/decl/material/solid/sodium         = 5,
		/decl/material/solid/sodiumchloride = 10,
		/decl/material/solid/sulfur         = 8,
		/decl/material/solid/potassium      = 6,
		/decl/material/solid/phosphorite    = 3,
		/decl/material/solid/cassiterite    = 3,
		/decl/material/solid/cinnabar       = 5,
	)

/decl/strata/outreach/mountain
	name = "mountain rock"
	base_materials = list(
		/decl/material/solid/stone/granite,
		/decl/material/solid/stone/sandstone,
		) //#TODO: Replace me with something less dumb
	ores_rich = list(
		/decl/material/solid/stone/basalt   = 15,
		/decl/material/solid/sodiumchloride = 20,
		/decl/material/solid/sodium         = 15,
		/decl/material/gas/chlorine         = 20,
		/decl/material/solid/hematite       = 5,
		/decl/material/solid/stone/basalt   = 5,
		/decl/material/solid/sand           = 5,
	)
	ores_sparse = list(
		/decl/material/solid/hematite     = 5,
		/decl/material/solid/magnetite    = 4,
		/decl/material/solid/pyrite       = 4,
		/decl/material/solid/potash       = 5,
		/decl/material/solid/chalcopyrite = 2,
		/decl/material/solid/calaverite   = 1,
		/decl/material/solid/phosphorite  = 4,
		/decl/material/solid/cinnabar     = 5,
		/decl/material/solid/spodumene    = 5,
	)
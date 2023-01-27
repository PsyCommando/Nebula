/datum/map/kleibkhar/build_exoplanets()
	log_debug("MAP: building exoplanets!") //#REMOVEME
	if(!kleibkhar_initialized)
		for(var/z in global.overmap_sectors)
			var/obj/effect/overmap/visitable/sector/exoplanet/kleibkhar/O = global.overmap_sectors[z]
			if(istype(O))
				O.build_level() //We have to force outreach to update now, otherwise it won't set its atmosphere
				kleibkhar_initialized = TRUE
				break
	. = ..()

/obj/effect/overmap/visitable/sector/exoplanet/kleibkhar
	name               = "\proper Kleibkhar"
	desc               = "A habitable border-world, home to a recent dime-a-dozen corporate colony."
	prefered_level_id  = "kleibkhar_4"
	planetary_area     = /area/exoplanet/kleibkhar
	habitability_class = HABITABILITY_IDEAL
	spawn_weight       = 0 //Spawned manually
	start_x            = 27
	start_y            = 23

	night              = FALSE
	lightlevel         = 1.0
	daycycle           = 25 MINUTES
	starlight_color    = COLOR_PALE_BLUE_GRAY

	color              = "#407c40"
	grass_color        = "#407c40"
	surface_color      = COLOR_DARK_GREEN_GRAY
	water_color        = COLOR_BLUE_GRAY
	rock_colors = list(
		COLOR_ASTEROID_ROCK,
		 COLOR_GRAY80,
		 COLOR_BROWN
	)
	plant_colors = list(
		"#215a00",
		"#195a47",
		"#5a7467",
		"#9eab88",
		"#6e7248",
		"RANDOM"
	)

	crust_strata        = /decl/strata/base_planet
	ruin_tags_whitelist = RUIN_NATURAL | RUIN_WATER
	features_budget     = 0
	has_trees           = FALSE
	flora_diversity     = 6
	max_animal_count    = 10
	fauna_types = list(
		/mob/living/simple_animal/yithian,
		/mob/living/simple_animal/tindalos,
		/mob/living/simple_animal/hostile/retaliate/jelly
	)
	megafauna_types = list(
		/mob/living/simple_animal/hostile/retaliate/parrot/space/megafauna,
		/mob/living/simple_animal/hostile/retaliate/goose/dire
	)

/obj/effect/overmap/visitable/sector/exoplanet/kleibkhar/build_level(max_x, max_y)
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

/obj/effect/overmap/visitable/sector/exoplanet/kleibkhar/update_daynight()
	var/light = 0.1
	if(!night)
		light = lightlevel
	for(var/turf/exterior/T in block(locate(daycolumn, TRANSITIONEDGE, max(map_z)), locate(daycolumn, maxy - TRANSITIONEDGE, max(map_z))))
		T.set_light(MINIMUM_USEFUL_LIGHT_RANGE, light)
	daycolumn++
	if(daycolumn > maxx)
		daycolumn = 0

/obj/effect/overmap/visitable/sector/exoplanet/kleibkhar/generate_planet_image()
	skybox_image = image('icons/skybox/planet.dmi', "")

	skybox_image.overlays += get_base_image()

	if(water_color)
		var/image/water = image('icons/skybox/planet.dmi', "water")
		water.color = water_color
		water.appearance_flags = PIXEL_SCALE
		water.transform = water.transform.Turn(45)
		skybox_image.overlays += water

	if(atmosphere && atmosphere.return_pressure() > SOUND_MINIMUM_PRESSURE)

		var/atmo_color = get_atmosphere_color()
		if(!atmo_color)
			atmo_color = COLOR_WHITE

		var/image/clouds = image('icons/skybox/planet.dmi', "weak_clouds")

		if(water_color)
			clouds.overlays += image('icons/skybox/planet.dmi', "clouds")

		clouds.color = atmo_color
		skybox_image.overlays += clouds

		var/image/atmo = image('icons/skybox/planet.dmi', "atmoring")
		skybox_image.underlays += atmo

	var/image/shadow = image('icons/skybox/planet.dmi', "shadow")
	shadow.blend_mode = BLEND_MULTIPLY
	skybox_image.overlays += shadow

	var/image/light = image('icons/skybox/planet.dmi', "lightrim")
	skybox_image.overlays += light

	skybox_image.pixel_x = rand(0,64)
	skybox_image.pixel_y = rand(128,256)
	skybox_image.appearance_flags = RESET_COLOR

/obj/effect/overmap/visitable/sector/exoplanet/kleibkhar/generate_habitability()
	habitability_class = HABITABILITY_IDEAL

/obj/effect/overmap/visitable/sector/exoplanet/kleibkhar/get_atmosphere_color()
	return COLOR_OFF_WHITE

/obj/effect/overmap/visitable/sector/exoplanet/kleibkhar/get_target_temperature()
	return T20C + 8 //Warm-ish

/obj/effect/overmap/visitable/sector/exoplanet/kleibkhar/select_strata()
	return //We already have picked a strata

/obj/effect/overmap/visitable/sector/exoplanet/kleibkhar/get_target_pressure()
	return ONE_ATMOSPHERE

//////////////////////////////////////////////////////////////////////////
// Mining Stuff
//////////////////////////////////////////////////////////////////////////
/datum/random_map/automata/cave_system/kleibkhar/subterrane
	iterations = 5
	descriptor = "kleibkhar subterrane caves"
	wall_type =  /turf/exterior/wall/kleibkhar
	floor_type = /turf/exterior/barren/mining
	mineral_turf = /turf/exterior/wall/random/kleibkhar

//////////////////////////////////////////////////////////////////////////
// Strata
//////////////////////////////////////////////////////////////////////////
/decl/strata/kleibkhar
	default_strata_candidate = TRUE

/decl/strata/kleibkhar/subterrane
	name = "planetary crust"
	ores_sparse = list(
		/decl/material/solid/graphite = 10,
		/decl/material/solid/hematite = 20,
		/decl/material/solid/sand = 5,
		/decl/material/solid/sodiumchloride = 5,
		/decl/material/solid/pyrite = 10,
		/decl/material/solid/quartz = 5,
		/decl/material/solid/clay = 10,
		/decl/material/solid/magnetite = 10,
		/decl/material/solid/chalcopyrite = 20,
		/decl/material/solid/sphalerite = 5,
		/decl/material/solid/cassiterite = 5,
		/decl/material/solid/potash = 5,
		/decl/material/solid/potassium = 5,
		/decl/material/solid/cinnabar = 3,
		/decl/material/solid/spodumene = 3,
		/decl/material/solid/bauxite = 5,
		/decl/material/solid/ice/aspium = 2,
		/decl/material/solid/ice/ediroite = 2,
		/decl/material/solid/ice/lukrite = 2,
		/decl/material/solid/ice/trigarite = 2
	)
	ores_rich = list(
		/decl/material/solid/hematite = 20,
		/decl/material/solid/pitchblende = 10,
		/decl/material/solid/chalcopyrite = 20,
		/decl/material/solid/tetrahedrite = 5,
		/decl/material/solid/wolframite = 5,
		/decl/material/solid/galena = 5,
		/decl/material/solid/bauxite = 5,
		/decl/material/solid/sperrylite = 3,
		/decl/material/solid/calaverite = 2,
		/decl/material/solid/ice/lukrite = 3,
		/decl/material/solid/ice/trigarite = 3,
		/decl/material/solid/ice/hydrogen = 2,
		/decl/material/solid/ice/hydrate/oxygen = 2
	)
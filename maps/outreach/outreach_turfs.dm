///////////////////////////////////////////////////////////////////////////////////
// Airless Floors
///////////////////////////////////////////////////////////////////////////////////
/turf/simulated/floor/tiled/techfloor/grid/airless
	initial_gas = null
	temperature = TCMB
/turf/simulated/floor/tiled/techfloor/airless
	initial_gas = null
	temperature = TCMB
/turf/simulated/floor/tiled/steel_ridged/airless
	initial_gas = null
	temperature = TCMB
/turf/simulated/floor/tiled/dark/monotile/airless
	initial_gas = null
	temperature = TCMB

///////////////////////////////////////////////////////////////////////////////////
// Outreach Atmos Floors
///////////////////////////////////////////////////////////////////////////////////
#define OUTREACH_ATMOS list(\
	/decl/material/gas/chlorine       = 0.17 * ((ONE_ATMOSPHERE/2) * CELL_VOLUME/(T0C * R_IDEAL_GAS_EQUATION)),\
	/decl/material/gas/nitrogen       = 0.63 * ((ONE_ATMOSPHERE/2) * CELL_VOLUME/(T0C * R_IDEAL_GAS_EQUATION)),\
	/decl/material/gas/carbon_dioxide = 0.11 * ((ONE_ATMOSPHERE/2) * CELL_VOLUME/(T0C * R_IDEAL_GAS_EQUATION)),\
)
#define OUTREACH_TEMP T0C

/turf/simulated/floor/tiled/techfloor/grid/outreach
	initial_gas = OUTREACH_ATMOS
	temperature = OUTREACH_TEMP
/turf/simulated/floor/tiled/techfloor/outreach
	initial_gas = OUTREACH_ATMOS
	temperature = OUTREACH_TEMP
/turf/simulated/floor/tiled/steel_ridged/outreach
	initial_gas = OUTREACH_ATMOS
	temperature = OUTREACH_TEMP
/turf/simulated/floor/tiled/dark/monotile/outreach
	initial_gas = OUTREACH_ATMOS
	temperature = OUTREACH_TEMP
/turf/simulated/floor/asteroid/outreach
	initial_gas          = OUTREACH_ATMOS
	temperature          = OUTREACH_TEMP
	heat_capacity        = 80000
	thermal_conductivity = 0.005
/turf/simulated/floor/plating/outreach
	initial_gas = OUTREACH_ATMOS
	temperature = OUTREACH_TEMP

#undef OUTREACH_TEMP
#undef OUTREACH_ATMOS

///////////////////////////////////////////////////////////////////////////////////
// Painted walls
///////////////////////////////////////////////////////////////////////////////////
/turf/simulated/wall/ocp_wall/prepainted
	paint_color    = COLOR_GUNMETAL
	stripe_color   = COLOR_AMBER
	material       = /decl/material/solid/metal/plasteel/ocp
	reinf_material = /decl/material/solid/metal/plasteel/ocp

/turf/simulated/wall/prepainted/medbay
	color        = COLOR_PALE_BLUE_GRAY
	stripe_color = COLOR_PALE_BLUE_GRAY
	paint_color  = null
/turf/simulated/wall/prepainted/engineering
	color        = COLOR_AMBER
	stripe_color = COLOR_AMBER
/turf/simulated/wall/prepainted/atmos
	color        = COLOR_CYAN
	stripe_color = COLOR_CYAN
/turf/simulated/wall/prepainted/mining
	color        = COLOR_BEASTY_BROWN
	stripe_color = COLOR_BEASTY_BROWN

///////////////////////////////////////////////////////////////////////////////////
// Painted Conrete Walls
///////////////////////////////////////////////////////////////////////////////////
/turf/simulated/wall/concrete/prepainted/medbay
	color        = COLOR_PALE_BLUE_GRAY
	stripe_color = COLOR_PALE_BLUE_GRAY
	paint_color  = null
/turf/simulated/wall/concrete/prepainted/mining
	color        = COLOR_BEASTY_BROWN
	stripe_color = COLOR_BEASTY_BROWN

///////////////////////////////////////////////////////////////////////////////////
// Painted Reinforced Walls
///////////////////////////////////////////////////////////////////////////////////
/turf/simulated/wall/r_wall/prepainted/engineering
	color        = COLOR_AMBER
	stripe_color = COLOR_AMBER
/turf/simulated/wall/r_wall/prepainted/atmos
	color        = COLOR_CYAN
	stripe_color = COLOR_CYAN

///////////////////////////////////////////////////////////////////////////////////
// Mining Turfs
///////////////////////////////////////////////////////////////////////////////////
/turf/exterior/barren/mining/outreach/subterrane
	color = "#223053"
/turf/exterior/barren/mining/outreach/abyss
	color = "#223053"

/turf/exterior/wall/volcanic/outreach
	strata = /decl/strata/outreach/mountain
/turf/exterior/wall/outreach/subterrane
	strata = /decl/strata/outreach/subterrane
/turf/exterior/wall/outreach/abyss
	strata = /decl/strata/outreach/abyssal

/turf/exterior/wall/random/outreach/abyss
	strata = /decl/strata/outreach/abyssal
/turf/exterior/wall/random/outreach/subterrane
	strata = /decl/strata/outreach/subterrane
/turf/exterior/wall/random/outreach/mountain
	strata = /decl/strata/outreach/mountain


///////////////////////////////////////////////////////////////////////////////////
// Surface Turfs
///////////////////////////////////////////////////////////////////////////////////
/turf/exterior/barren/outreach
/turf/exterior/wall/outreach
/turf/exterior/chlorine_sand/outreach


//
// Turf Initializers
//
/decl/turf_initializer/outreach_surface
	var/list/surface_props_probs = list(
		/obj/effect/decal/cleanable/lichen = 40,
		/obj/effect/decal/cleanable/ash    = 20,
		/obj/structure/boulder             = 30,
		/obj/structure/leech_spawner       = 5,
	)
	var/list/mob_probs = list(
		/mob/living/simple_animal/hostile/slug                 = 1,
		/mob/living/simple_animal/hostile/retaliate/giant_crab = 3,
	)
	var/list/allowed_turfs = list(
		/turf/exterior/barren,
		/turf/exterior/chlorine_sand,
	)

/decl/turf_initializer/outreach_surface/InitializeTurf(var/turf/exterior/T)
	if(!istype(T) || T.density)
		return
	if(!is_type_in_list(T, allowed_turfs))
		return
	//Don't place anything here, if there's anything on the turf already
	if(locate(/obj, T))
		return

	var/list/possible_spawns = surface_props_probs|mob_probs
	if(rand(0, 50) != 50)
		return //No prop for this tile

	for(var/path in possible_spawns)
		possible_spawns[path] = rand(0, possible_spawns[path])
	sortTim(possible_spawns, .proc/cmp_numeric_dsc, TRUE)
	var/spawn_type = possible_spawns[1]
	new spawn_type(T)





//
// Simulated Volcanic
//
/turf/simulated/floor/volcanic
	name             = "volcanic floor"
	base_name        = "rock"
	base_desc        = "Solidified magma."
	icon             = 'icons/turf/exterior/volcanic.dmi'
	icon_state       = "0"
	base_icon_state  = "0"
	footstep_type    = /decl/footsteps/asteroid
	initial_flooring = null
	initial_gas      = null
	temperature      = TCMB
	mineral          = /decl/material/solid/stone/slate

/turf/simulated/floor/volcanic/can_engrave()
	return FALSE

/turf/simulated/floor/volcanic/explosion_act(severity)
	SHOULD_CALL_PARENT(FALSE)
	return

/turf/simulated/floor/volcanic/attackby(obj/item/C, mob/user)
	if(IS_WELDER(C) || istype(C, /obj/item/gun/energy/plasmacutter))
		return //Prevents removing the floor with a welder..
	. = ..()

//
// Magma
//
///A slightly more practical version of lava
/turf/exterior/outreach_magma
	name           = "magma"
	icon           = 'icons/turf/exterior/lava.dmi'
	movement_delay = 4
	dirt_color     = COLOR_GRAY20
	footstep_type  = /decl/footsteps/lava
	diggable       = FALSE
	temperature    = T0C + 800 //Temperature of lava
	pathweight     = 200
	open_turf_type = /turf/exterior/outreach_magma
	prev_type      = /turf/exterior/outreach_magma
	var/list/victims
	///Cached object covering the lava on the last process tick
	var/tmp/weakref/cached_lava_cover
	/**Types that when present on the tile prevent other objects on the tile from getting hit with lava_act */
	var/static/list/lava_cover_types = list(
		/obj/structure/lattice,
		/obj/structure/catwalk,
		/obj/structure/wall_frame,
		/obj/structure/stairs
	)

/turf/exterior/outreach_magma/Initialize()
	. = ..()
	set_light(2, l_color = LIGHT_COLOR_LAVA)

/turf/exterior/outreach_magma/Destroy()
	STOP_PROCESSING(SSobj, src)
	. = ..()

/turf/exterior/outreach_magma/return_air() //#TODO: Would be neat if heat would be transfered to adjacent tiles
	var/datum/gas_mixture/gas = ..()
	gas.temperature = T0C + 800
	return gas

/turf/exterior/outreach_magma/attackby(obj/item/C, mob/user)
	if(istype(C, /obj/item/stack/tile))
		return //Don't let people build over this
	. = ..()

/turf/exterior/outreach_magma/explosion_act(severity)
	SHOULD_CALL_PARENT(FALSE)
	return

/turf/exterior/outreach_magma/is_solid_structure()
	return ..() || (locate(/obj/structure/catwalk) in src)

/**
 * Returns any valid covering objects protecting entities on the lava turf from the lava_act
 */
/turf/exterior/outreach_magma/proc/get_covering_object()
	var/atom/movable/covering = cached_lava_cover?.resolve()
	if(QDELETED(covering) || covering.loc != src)
		for(var/atom/movable/thing in contents)
			if(!QDELETED(thing) && is_type_in_list(thing, lava_cover_types))
				cached_lava_cover = weakref(thing)
				. = thing
				break
	else
		. = covering

/turf/exterior/outreach_magma/Entered(atom/movable/AM)
	..()
	//Check for anything covering the lava
	if(get_covering_object())
		return

	var/mob/living/L = AM
	if (istype(L) && L.can_overcome_gravity())
		return
	if(istype(AM, /obj/machinery/atmospherics/pipe)) //#TODO: Maybe find something better?
		return
	if(AM.is_burnable())
		LAZYADD(victims, weakref(AM))
		START_PROCESSING(SSobj, src)

/turf/exterior/outreach_magma/Exited(atom/movable/AM)
	. = ..()
	LAZYREMOVE(victims, weakref(AM))

/turf/exterior/outreach_magma/Process()
	//Check if we have a covering object
	if(get_covering_object())
		return

	for(var/weakref/W in victims)
		var/atom/movable/AM = W.resolve()
		if (AM == null || get_turf(AM) != src || AM.is_burnable() == FALSE)
			victims -= W
			continue
		var/datum/gas_mixture/environment = return_air()
		var/pressure = environment.return_pressure()
		var/destroyed = AM.lava_act(environment, environment.temperature, pressure)
		if(destroyed == TRUE)
			victims -= W
	if(!LAZYLEN(victims))
		return PROCESS_KILL


//
//
//
/turf/unsimulated/rock
	name                 = "impassable rock"
	icon                 = 'icons/turf/walls.dmi'
	icon_state           = "rock"
	color                = COLOR_DARK_GRAY
	blocks_air           = TRUE
	density              = TRUE
	opacity              = TRUE

//
//
//
/**Special turf to teleport to an adjacent z-level */
/turf/exterior/transition_edge
	name             = "level connection"
	desc             = "The government actually wants you to see this!"
	density          = TRUE
	blocks_air       = TRUE
	dynamic_lighting = FALSE
	icon             = null
	icon_state       = null
	permit_ao        = FALSE
	var/mimicx
	var/mimicy
	var/mimicz

/turf/exterior/transition_edge/Initialize()
	. = ..()
	var/obj/effect/overmap/visitable/sector/exoplanet/E = global.overmap_sectors["[z]"]
	if(!istype(E))
		return
	var/obj/abstract/level_data/ldat = global.levels_by_z["[z]"]

	//Figure out our orientation on the map
	var/edge_dir = 0
	var/halfmaxx = round(world.maxx/2)
	var/halfmaxy = round(world.maxy/2)
	if(x < halfmaxx)
		edge_dir |= WEST
	else
		edge_dir |= EAST

	if(y < halfmaxy)
		edge_dir |= SOUTH
	else 
		edge_dir |= NORTH

	var/connected_level
	for(var/level_id in ldat.connects_to)
		if((ldat.connects_to[level_id]) & edge_dir) 
			connected_level = level_id
			break
	if(!connected_level)
		log_warning("Got transition_edge turf([x], [y], [z]) in direction [dir2text(edge_dir)] that doesn't connect to anything!")
		ChangeTurf(/turf/unsimulated/wall, FALSE, FALSE, FALSE)
		return .

	var/obj/abstract/level_data/target_ldat = global.levels_by_id[connected_level]
	if(!target_ldat)
		CRASH("Got transition_edge turf([x], [y], [z]) linking to a non-existent level id '[connected_level]'!")
	mimicx = x
	if (x <= TRANSITIONEDGE)
		mimicx = x + (E.maxx - 2*TRANSITIONEDGE) - 1
	else if (x >= (E.maxx - TRANSITIONEDGE))
		mimicx = x - (E.maxx  - 2*TRANSITIONEDGE) + 1

	mimicy = y
	if(y <= TRANSITIONEDGE)
		mimicy = y + (E.maxy - 2*TRANSITIONEDGE) - 1
	else if (y >= (E.maxy - TRANSITIONEDGE))
		mimicy = y - (E.maxy - 2*TRANSITIONEDGE) + 1
	
	mimicz = target_ldat.my_z

	refresh_vis_contents()

	//Need to put a mouse-opaque overlay there to prevent people turning/shooting towards ACTUAL location of vis_content things
	var/obj/effect/overlay/O = new(src)
	O.mouse_opacity = 2
	O.name = "distant terrain"
	O.desc = "You need to come over there to take a better look."

/turf/exterior/transition_edge/Bumped(atom/movable/A)
	. = ..()
	var/obj/effect/overmap/visitable/sector/exoplanet/E = global.overmap_sectors["[mimicz]"]
	if(!istype(E))
		return
	if(E.planetary_area && istype(loc, world.area))
		ChangeArea(src, E.planetary_area)
	var/new_x = A.x
	var/new_y = A.y
	if(x <= TRANSITIONEDGE)
		new_x = E.maxx - TRANSITIONEDGE - 1
	else if (x >= (E.maxx - TRANSITIONEDGE))
		new_x = TRANSITIONEDGE + 1
	else if (y <= TRANSITIONEDGE)
		new_y = E.maxy - TRANSITIONEDGE - 1
	else if (y >= (E.maxy - TRANSITIONEDGE))
		new_y = TRANSITIONEDGE + 1

	var/turf/T = locate(new_x, new_y, mimicz)
	if(T && !T.density)
		A.forceMove(T)
		if(isliving(A))
			var/mob/living/L = A
			for(var/obj/item/grab/G in L.get_active_grabs())
				G.affecting.forceMove(T)

/turf/exterior/transition_edge/on_update_icon()
	return

/turf/exterior/transition_edge/get_vis_contents_to_add()
	. = ..()
	var/turf/NT = mimicx && mimicy && mimicz && locate(mimicx, mimicy, mimicz)
	if(NT)
		opacity = NT.opacity
		//log_debug("[src]([x],[y],[z]) mirroring [NT]([NT.x],[NT.y],[NT.z])")
		LAZYADD(., NT)
// Shared attackby behaviors that /turf/exterior/open also uses.
/proc/shared_open_turf_attackhand(var/turf/target, var/mob/user)
	for(var/atom/movable/M in target.below)
		if(M.movable_flags & MOVABLE_FLAG_Z_INTERACT)
			return M.attack_hand(user)

/proc/shared_open_turf_attackby(var/turf/target, obj/item/thing, mob/user)

	if(istype(thing, /obj/item/stack/material/rods))
		var/ladder = (locate(/obj/structure/ladder) in target)
		if(ladder)
			to_chat(user, SPAN_WARNING("\The [ladder] is in the way."))
			return TRUE
		var/obj/structure/lattice/lattice = locate(/obj/structure/lattice, target)
		if(lattice)
			return lattice.attackby(thing, user)
		var/obj/item/stack/material/rods/rods = thing
		if (rods.use(1))
			to_chat(user, SPAN_NOTICE("You lay down the support lattice."))
			playsound(target, 'sound/weapons/Genhit.ogg', 50, 1)
			new /obj/structure/lattice(locate(target.x, target.y, target.z), rods.material.type)
		return TRUE

	if (istype(thing, /obj/item/stack/tile))
		var/obj/item/stack/tile/tile = thing
		tile.try_build_turf(user, target)
		return TRUE

	//To lay cable.
	if(IS_COIL(thing) && target.try_build_cable(thing, user))
		return TRUE

	for(var/atom/movable/M in target.below)
		if(M.movable_flags & MOVABLE_FLAG_Z_INTERACT)
			return M.attackby(thing, user)

	return FALSE

/// `direction` is the direction the atom is trying to leave by.
/turf/proc/CanZPass(atom/A, direction, check_neighbor_canzpass = TRUE)

	if(direction == UP)
		if(!HasAbove(z))
			return FALSE
		if(check_neighbor_canzpass)
			var/turf/T = GetAbove(src)
			if(!T.CanZPass(A, DOWN, FALSE))
				return FALSE

	else if(direction == DOWN)
		if(!is_open() || !HasBelow(z) || (locate(/obj/structure/catwalk) in src))
			return FALSE
		if(check_neighbor_canzpass)
			var/turf/T = GetBelow(src)
			if(!T.CanZPass(A, UP, FALSE))
				return FALSE

	// Hate calling Enter() directly, but that's where obstacles are checked currently.
	return Enter(A, A)

////////////////////////////////
// Open SIMULATED
////////////////////////////////
/turf/simulated/open
	name = "open space"
	icon = 'icons/turf/space.dmi'
	icon_state = ""
	density = 0
	pathweight = 100000 //Seriously, don't try and path over this one numbnuts
	z_flags = ZM_MIMIC_DEFAULTS | ZM_MIMIC_OVERWRITE | ZM_MIMIC_NO_AO | ZM_ALLOW_ATMOS
	turf_flags = TURF_FLAG_BACKGROUND

/turf/simulated/open/flooded
	name = "open water"
	flooded = TRUE

/turf/simulated/open/update_dirt()
	return 0

/turf/simulated/open/Entered(var/atom/movable/mover, var/atom/oldloc)
	..()
	mover.fall(oldloc)

// Called when thrown object lands on this turf.
/turf/simulated/open/hitby(var/atom/movable/AM)
	..()
	if(!QDELETED(AM))
		AM.fall()

// override to make sure nothing is hidden
/turf/simulated/open/levelupdate()
	for(var/obj/O in src)
		O.hide(0)

/turf/simulated/open/examine(mob/user, distance, infix, suffix)
	. = ..()
	if(distance <= 2)
		var/depth = 1
		for(var/turf/T = GetBelow(src); (istype(T) && T.is_open()); T = GetBelow(T))
			depth += 1
		to_chat(user, "It is about [depth] level\s deep.")

/turf/simulated/open/is_open()
	return TRUE

/turf/simulated/open/attackby(obj/item/C, mob/user)
	return shared_open_turf_attackby(src, C, user)

/turf/simulated/open/attack_hand(mob/user)
	return shared_open_turf_attackhand(src, user)

//Most things use is_plating to test if there is a cover tile on top (like regular floors)
/turf/simulated/open/is_plating()
	return TRUE

/turf/simulated/open/cannot_build_cable()
	return 0

////////////////////////////////
// Open EXTERIOR
////////////////////////////////
/turf/exterior/open
	name = "open space"
	icon = 'icons/turf/space.dmi'
	icon_state = ""
	density = 0
	pathweight = 100000
	z_flags = ZM_MIMIC_DEFAULTS | ZM_MIMIC_OVERWRITE | ZM_MIMIC_NO_AO | ZM_ALLOW_ATMOS

/turf/exterior/open/flooded
	name = "open water"
	flooded = TRUE

/turf/exterior/open/Entered(var/atom/movable/mover, var/atom/oldloc)
	..()
	mover.fall(oldloc)

/turf/exterior/open/hitby(var/atom/movable/AM)
	..()
	if(!QDELETED(AM))
		AM.fall()

/turf/exterior/open/examine(mob/user, distance, infix, suffix)
	. = ..()
	if(distance <= 2)
		var/depth = 1
		for(var/turf/T = GetBelow(src); (istype(T) && T.is_open()); T = GetBelow(T))
			depth += 1
		to_chat(user, "It is about [depth] level\s deep.")

/turf/exterior/open/is_open()
	return TRUE

/turf/exterior/open/attackby(obj/item/C, mob/user)
	return shared_open_turf_attackby(src, C, user)

/turf/exterior/open/attack_hand(mob/user)
	return shared_open_turf_attackhand(src, user)

/turf/exterior/open/cannot_build_cable()
	return 0

////////////////////////////////
// Transition Edge
////////////////////////////////
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
		//log_debug("[src]([x],[y],[z]) mirroring [NT]([NT.x],[NT.y],[NT.z])")
		LAZYADD(., NT)

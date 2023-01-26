//#TODO: Gotta fix this so we just run the exoplanet's gen code on startup instead to properly update areas and stuff for unsaved turfs.

/obj/effect/overmap/visitable/sector/exoplanet/on_saving_start()
	start_x = x
	start_y = y

	old_loc = loc

	// Force move the sector to its z level(s) so that it can properly reinitialize.
	forceMove(locate(world.maxx/2, world.maxy/2, map_z[1]))

/obj/effect/overmap/visitable/sector/exoplanet/on_saving_end()
	forceMove(old_loc)

/turf/Initialize(mapload, ...)
	. = ..()
	if(persistent_id)
		//A bit of a fix for planetary areas being generally shit
		var/obj/effect/overmap/visitable/sector/exoplanet/EXO = LAZYACCESS(global.overmap_sectors, "[z]")
		if(istype(EXO) && EXO.planetary_area && istype(loc, world.area))
			ChangeArea(src, EXO.planetary_area)

/obj/effect/overmap/visitable/sector/exoplanet/generate_map()
	var/list/grasscolors = plant_colors.Copy()
	grasscolors -= "RANDOM"
	if(length(grasscolors))
		grass_color = pick(grasscolors)

	for(var/datum/exoplanet_theme/T in themes)
		T.before_map_generation(src)

	log_debug("Setting up [src]'s edges:")
	for(var/zlevel in map_z)
		//Blocks of all the turfs on a given edge
		var/list/all_edges = list(
			"[NORTH]" = block(locate(1, maxy-TRANSITIONEDGE, zlevel), locate(maxx, maxy, zlevel)),
			"[SOUTH]" = block(locate(1, 1, zlevel),                   locate(maxx, TRANSITIONEDGE, zlevel)),
			"[EAST]"  = block(locate(maxx-TRANSITIONEDGE, 1, zlevel), locate(maxx, maxy, zlevel)),
			"[WEST]"  = block(locate(1, 1, zlevel),                   locate(TRANSITIONEDGE, maxy, zlevel)),
		)
		var/static/const/CON_LOOP = 0
		var/static/const/CON_WALL = 1
		var/static/const/CON_TRAN = 2
		//The type of edge to apply in a given direction
		var/list/edge_states = list(
			"[NORTH]" = CON_LOOP,
			"[SOUTH]" = CON_LOOP,
			"[EAST]"  = CON_LOOP,
			"[WEST]"  = CON_LOOP,
		)
		var/obj/abstract/level_data/data = global.levels_by_z["[zlevel]"]

		//Change edge states for transition edges and edges opposite a transition edge
		for(var/lvlid in data?.connects_to)
			var/direction = data.connects_to[lvlid]
			if(direction & (UP|DOWN) || isnull(direction))
				continue
			var/opposite  = global.reverse_dir[direction]
			edge_states["[direction]"] = CON_TRAN
			//If we got a transistion edge, don't loop the opposite edge
			if(edge_states["[opposite]"] == CON_LOOP)
				edge_states["[opposite]"] = CON_WALL

		for(var/edgedir in edge_states)
			var/state = edge_states[edgedir]
			var/turfpath
			switch(state)
				if(CON_LOOP)
					turfpath = /turf/exterior/planet_edge
				if(CON_WALL)
					turfpath = /turf/unsimulated/mineral
				if(CON_TRAN)
					turfpath = /turf/exterior/transition_edge

			log_debug("[src] [num2dir(text2num(edgedir))], z:[zlevel], edge is [(state == CON_LOOP)? "loop" : (state == CON_WALL? "wall" : "transition")]")
			for(var/turf/T in all_edges[edgedir])
				T.ChangeTurf(turfpath)

		for(var/map_type in map_generators)
			if(ispath(map_type, /datum/random_map/noise/exoplanet))
				new map_type(x_origin, y_origin, zlevel, x_size, y_size, FALSE, TRUE, planetary_area, plant_colors)
			else
				new map_type(x_origin, y_origin, zlevel, x_size, y_size, FALSE, TRUE, planetary_area)

//#TODO: Eventually when everything uses the abstrct level data move that to the /obj/effect/overmap/visitable/sector level
/obj/effect/overmap/visitable/sector/exoplanet/find_z_levels()
	//Bypass the broken base code that prevents exoplanet from looking for their owned z-levels
	var/obj/abstract/level_data/dat = global.levels_by_id[prefered_level_id]
	var/z_from = z
	if(istype(dat))
		z_from = dat.my_z
	log_debug("Found starting z for sector [src](loc:([x],[y],[z])) with id [prefered_level_id] is [z_from].")
	map_z = GetConnectedZlevels(z_from)
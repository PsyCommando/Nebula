/datum/map
	var/list/saved_levels = list()   // Z-levels that will be persisted to a database layer during saving intervals. 
	var/spawn_network	             // Network ID of the computer network used on the planetary base.
	var/list/default_levels          //List of all the map paths to load in order

/obj/abstract/level_data/Initialize()
	. = ..()
	if(level_flags & ZLEVEL_PERSISTENT)
		global.using_map.saved_levels   |= my_z
	if(level_flags & ZLEVEL_MINING)
		global.using_map.mining_levels  |= my_z

//Allocate the expected z-levels for the base map. Meant to be used when loading a save
/datum/map/proc/reserve_zlevels()
	//Increment the z-level to the position we should load the map at
	for(var/i = 1 to length(global.using_map.default_levels))
		INCREMENT_WORLD_Z_SIZE
		report_progress("[src] reserved z-level [world.maxz].")

//Load the map files
/datum/map/proc/load_map()
	for(var/map_path in default_levels)
		INCREMENT_WORLD_Z_SIZE
		global.maploader.load_map(file(map_path), 1, 1, world.maxz, no_changeturf = TRUE)
		report_progress("[src] loaded map file '[map_path]' at z [world.maxz].")

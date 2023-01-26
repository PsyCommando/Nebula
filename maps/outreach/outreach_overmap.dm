// These defines are moved here, as we don't want this to generate or require these paths when testing other maps.
/datum/map/outreach
	overmap_ids = list(OVERMAP_ID_SPACE = /datum/overmap/outreach)

/////////////////////////////////////////////////////////////////////////////////
// Overmap Details
/////////////////////////////////////////////////////////////////////////////////
/datum/overmap/outreach
	event_areas = 10
	map_size_x  = 50
	map_size_y  = 50
	var/map_file// = "maps/outreach/outreach-overmap.dmm"

/datum/overmap/outreach/populate_overmap()
	. = ..()
#ifndef UNIT_TEST
	//Don't load or create anything if we loaded from save
	if(SSpersistence.SaveExists())
		return
#endif
	//Load from file of we want to
	if(length(map_file))
		report_progress("Loading overmap '[map_file]' to [assigned_z]")
		maploader.load_map(file(map_file), 1, 1, assigned_z)
		return

	//Otherwise just spawn the star
	var/turf/overmap_center = locate(round(map_size_x/2), round(map_size_y/2), assigned_z)
	new /obj/effect/overmap/star/outreach(overmap_center)

/////////////////////////////////////////////////////////////////////////////////
// Supply Shuttle Handling
/////////////////////////////////////////////////////////////////////////////////
/datum/shuttle/autodock/ferry/supply/cargo
	name = "Supply"
	warmup_time = 10
	location = 1
	dock_target = "supply_shuttle"
	waypoint_station = "nav_cargo_station"

/obj/effect/shuttle_landmark/supply/station
	landmark_tag = "nav_cargo_station"
	docking_controller = "cargo_bay"
	base_area = /area/supply_shuttle_dock
	base_turf = /turf/simulated/floor/plating

/obj/effect/overmap/star/outreach
	name = "Castor"
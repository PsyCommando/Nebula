/datum/map/outreach
//	base_floor_type = /turf/unsimulated/floor //#FIXME: Test to prevent air loss

#ifndef UNIT_TEST
	// station_levels = list(1, 2, 3, 4, 5, 6, 7)
	// contact_levels = list(1, 2, 3, 4, 5, 6, 7)
	// player_levels  = list(1, 2, 3, 4, 5, 6, 7)
	// saved_levels   = list(1, 2, 3, 4)
	//mining_levels  = list(5, 6, 7)

	// Hotloading module
	default_levels = list(
		"maps/outreach/outreach-1.dmm",
		"maps/outreach/outreach-2.dmm",
		"maps/outreach/outreach-3.dmm",
		"maps/outreach/outreach-4.dmm",
		"maps/outreach/outreach_south-1.dmm",
		"maps/outreach/outreach_south-2.dmm",
		"maps/outreach/outreach_south-3.dmm",
		"maps/utility/cargo_shuttle_tmpl.dmm",
	)

	// A list of turfs and their default turfs for serialization optimization.
	// base_turf_by_z = list(
	// 	"1" = /turf/exterior/barren,
	// 	"2" = /turf/exterior/barren,
	// 	"3" = /turf/exterior/barren,
	// 	"4" = /turf/exterior/open,
	// 	"5" = /turf/exterior/barren/mining,
	// 	"6" = /turf/exterior/barren/mining,
	// 	"7" = /turf/exterior/barren/mining,
	// 	"8" = /turf/space,
	// )

#else
	// station_levels = list(4, 5, 6, 7, 8, 9, 10)
	// contact_levels = list(4, 5, 6, 7, 8, 9, 10)
	// player_levels  = list(4, 5, 6, 7, 8, 9, 10)
	// saved_levels   = list(4, 5, 6, 7)
	//mining_levels  = list(8, 9, 10)

	default_levels = list(
		"maps/outreach/outreach-1.dmm",
		"maps/outreach/outreach-2.dmm",
		"maps/outreach/outreach-3.dmm",
		"maps/outreach/outreach-4.dmm",
		"maps/outreach/outreach_south-1.dmm",
		"maps/outreach/outreach_south-2.dmm",
		"maps/outreach/outreach_south-3.dmm",
		"maps/utility/cargo_shuttle_tmpl.dmm",
	)

	// A list of turfs and their default turfs for serialization optimization.
	// base_turf_by_z = list(
	// 	"4"  = /turf/exterior/barren,
	// 	"5"  = /turf/exterior/barren,
	// 	"6"  = /turf/exterior/barren,
	// 	"7"  = /turf/exterior/open,
	// 	"8"  = /turf/exterior/barren/mining,
	// 	"9"  = /turf/exterior/barren/mining,
	// 	"10" = /turf/exterior/barren/mining,
	// 	"11" = /turf/space,
	// )

#endif

/////////////////////////////////////////////////////////////////////////////
// Station Building Levels
/////////////////////////////////////////////////////////////////////////////
/obj/abstract/level_data/player_level/outreach_1
	name        = "Outreach Depths"
	level_id    = "outreach_1"
	connects_to = list("outreach_south_1", "outreach_2")
	level_flags = ZLEVEL_STATION | ZLEVEL_CONTACT | ZLEVEL_PLAYER | ZLEVEL_PERSISTENT
	base_turf   = /turf/exterior/barren

/obj/abstract/level_data/player_level/outreach_2
	name        = "Outreach Underground"
	level_id    = "outreach_2"
	connects_to = list("outreach_south_2", "outreach_1", "outreach_3")
	level_flags = ZLEVEL_STATION | ZLEVEL_CONTACT | ZLEVEL_PLAYER | ZLEVEL_PERSISTENT
	base_turf   = /turf/exterior/barren

/obj/abstract/level_data/player_level/outreach_3
	name        = "Outreach Surface"
	level_id    = "outreach_3"
	connects_to = list("outreach_south_3", "outreach_2")
	level_flags = ZLEVEL_STATION | ZLEVEL_CONTACT | ZLEVEL_PLAYER | ZLEVEL_PERSISTENT
	base_turf   = /turf/exterior/barren

/obj/abstract/level_data/player_level/outreach_4
	name        = "Outreach Sky"
	level_id    = "outreach_4"
	connects_to = list("outreach_3")
	level_flags = ZLEVEL_STATION | ZLEVEL_CONTACT | ZLEVEL_PLAYER | ZLEVEL_PERSISTENT
	base_turf   = /turf/exterior/open

/////////////////////////////////////////////////////////////////////////////
// Adjacent Mining levels
/////////////////////////////////////////////////////////////////////////////
/obj/abstract/level_data/player_level/outreach_1/south
	name           = "Outreach Southern Abyss"
	level_id       = "outreach_south_1"
	connects_to    = list("outreach_1", "outreach_south_2")
	level_flags    = ZLEVEL_CONTACT | ZLEVEL_PLAYER | ZLEVEL_MINING
	level_gen_type = /datum/random_map/automata/cave_system/outreach/abyss
	base_turf      = /turf/exterior/barren/mining

/obj/abstract/level_data/player_level/outreach_2/south
	name           = "Outreach Southern Underground"
	level_id       = "outreach_south_2"
	connects_to    = list("outreach_2", "outreach_south_1", "outreach_south_3")
	level_flags    = ZLEVEL_CONTACT | ZLEVEL_PLAYER | ZLEVEL_MINING
	level_gen_type = /datum/random_map/automata/cave_system/outreach/subterrane
	base_turf      = /turf/exterior/barren/mining

/obj/abstract/level_data/player_level/outreach_3/south
	name           = "Outreach Southern Mountain"
	level_id       = "outreach_south_3"
	connects_to    = list("outreach_3", "outreach_south_2")
	level_flags    = ZLEVEL_CONTACT | ZLEVEL_PLAYER | ZLEVEL_MINING
	level_gen_type = /datum/random_map/automata/cave_system/outreach/mountain
	base_turf      = /turf/exterior/barren/mining

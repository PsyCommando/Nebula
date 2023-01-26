/datum/map/kleibkhar
#ifndef UNIT_TEST
	// Hotloading module
	default_levels = list(
		"maps/kleibkhar/kleibkhar-1.dmm",
		"maps/kleibkhar/kleibkhar-2.dmm",
		"maps/kleibkhar/kleibkhar-3.dmm",
		"maps/kleibkhar/kleibkhar-4.dmm",
		"maps/utility/cargo_shuttle_tmpl.dmm",
	)

#else
	default_levels = list(
		"maps/kleibkhar/kleibkhar-1.dmm",
		"maps/kleibkhar/kleibkhar-2.dmm",
		"maps/kleibkhar/kleibkhar-3.dmm",
		"maps/kleibkhar/kleibkhar-4.dmm",
		"maps/utility/cargo_shuttle_tmpl.dmm",
	)

#endif

/////////////////////////////////////////////////////////////////////////////
// Mining Levels
/////////////////////////////////////////////////////////////////////////////
/obj/abstract/level_data/player_level/kleibkhar_1
	name           = "Kleibkhar Depths"
	level_id       = "kleibkhar_1"
	connects_to    = list("kleibkhar_2" = UP)
	level_flags    = ZLEVEL_CONTACT | ZLEVEL_PLAYER | ZLEVEL_MINING
	level_gen_type = /datum/random_map/automata/cave_system/kleibkhar/subterrane
	base_turf      = /turf/exterior/barren/mining

/obj/abstract/level_data/player_level/kleibkhar_2
	name           = "Kleibkhar Underground"
	level_id       = "kleibkhar_2"
	connects_to    = list("kleibkhar_1" = DOWN, "kleibkhar_3" = UP)
	level_flags    = ZLEVEL_CONTACT | ZLEVEL_PLAYER | ZLEVEL_MINING
	level_gen_type = /datum/random_map/automata/cave_system/kleibkhar/subterrane
	base_turf      = /turf/exterior/barren/mining

/////////////////////////////////////////////////////////////////////////////
// Station Levels
/////////////////////////////////////////////////////////////////////////////
/obj/abstract/level_data/player_level/kleibkhar_3
	name        = "Kleibkhar Surface"
	level_id    = "kleibkhar_3"
	connects_to = list("kleibkhar_2" = DOWN, "kleibkhar_4" = UP)
	level_flags = ZLEVEL_STATION | ZLEVEL_CONTACT | ZLEVEL_PLAYER | ZLEVEL_PERSISTENT
	base_turf   = /turf/exterior/kleibkhar_grass

/obj/abstract/level_data/player_level/kleibkhar_4
	name        = "Kleibkhar Sky"
	level_id    = "kleibkhar_4"
	connects_to = list("kleibkhar_3" = DOWN)
	level_flags = ZLEVEL_STATION | ZLEVEL_CONTACT | ZLEVEL_PLAYER | ZLEVEL_PERSISTENT
	base_turf   = /turf/exterior/open

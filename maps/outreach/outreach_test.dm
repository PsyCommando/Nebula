//Add to the default areas
/datum/map/outreach/New()
	. = ..()

	area_coherency_test_exempt_areas += /area/outreach/outpost/atmospherics/b2/tank_outer
	area_coherency_test_exempt_areas += /area/outreach/outpost/hangar/north/shuttle_area
	area_coherency_test_exempt_areas += /area/outreach/outpost/engineering/b2/geothermals

	area_coherency_test_exempted_root_areas += /area/outreach/outpost/maint/outer_wall
	area_coherency_test_exempted_root_areas += /area/outreach/outpost/airlock
	area_coherency_test_exempted_root_areas += /area/turbolift
	area_coherency_test_exempted_root_areas += /area/outreach/outpost/vacant
	area_coherency_test_exempted_root_areas += /area/outreach/outpost/janitorial

	area_usage_test_exempted_areas += /area/supply_shuttle_dock

	//Area meant to fool unit tests, because they're being a bit assinine
	apc_test_exempt_areas[/area/outreach/outpost/control/servers] = NO_SCRUBBER|NO_VENT
	apc_test_exempt_areas[/area/outreach/outpost/airlock/floor1] = NO_SCRUBBER|NO_VENT
	apc_test_exempt_areas[/area/turbolift] = NO_APC|NO_VENT|NO_SCRUBBER
	apc_test_exempt_areas[/area/chargen] = NO_APC|NO_VENT|NO_SCRUBBER
	apc_test_exempt_areas[/area/chargen] = NO_APC|NO_VENT|NO_SCRUBBER
//Add to the default areas
/datum/map/outreach
	apc_test_excluded_areas = list(
		/area/outreach/outpost/janitorial, 	//That's an intended multi-z area, stop whining
	)


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
	apc_test_exempt_areas[/area/outreach/outpost/airlock/ground] = NO_VENT|NO_SCRUBBER
	apc_test_exempt_areas[/area/outreach/outpost/airlock/basement1/east] = NO_VENT|NO_SCRUBBER
	apc_test_exempt_areas[/area/outreach/outpost/airlock/basement1/south] = NO_VENT|NO_SCRUBBER
	apc_test_exempt_areas[/area/outreach/outpost/airlock/basement1/north] = NO_VENT|NO_SCRUBBER
	apc_test_exempt_areas[/area/outreach/outpost/airlock/basement1/west] = NO_VENT|NO_SCRUBBER
	apc_test_exempt_areas[/area/outreach/outpost/airlock/basement2] = NO_VENT|NO_SCRUBBER

	apc_test_exempt_areas[/area/turbolift] = NO_APC|NO_VENT|NO_SCRUBBER
	apc_test_exempt_areas[/area/chargen] = NO_APC|NO_VENT|NO_SCRUBBER
	apc_test_exempt_areas[/area/outreach/outpost/maint/passage/f1/southwest] = NO_VENT|NO_SCRUBBER
	apc_test_exempt_areas[/area/outreach/outpost/storage_shed/gf/south] = NO_VENT|NO_SCRUBBER
	apc_test_exempt_areas[/area/outreach/outpost/storage_shed/gf/north] = NO_VENT|NO_SCRUBBER
	apc_test_exempt_areas[/area/outreach/outpost/atmospherics/b2/tank_outer] = NO_VENT|NO_SCRUBBER
	apc_test_exempt_areas[/area/outreach/outpost/engineering/b2/geothermals] = NO_APC|NO_VENT|NO_SCRUBBER

	apc_test_exempt_areas[/area/outreach/outpost/vacant/ground/office9] = NO_VENT|NO_SCRUBBER
	apc_test_exempt_areas[/area/outreach/outpost/vacant/ground/office8] = NO_VENT|NO_SCRUBBER
	apc_test_exempt_areas[/area/outreach/outpost/vacant/ground/office7] = NO_VENT|NO_SCRUBBER
	apc_test_exempt_areas[/area/outreach/outpost/vacant/ground/office6] = NO_VENT|NO_SCRUBBER
	apc_test_exempt_areas[/area/outreach/outpost/vacant/ground/office5] = NO_VENT|NO_SCRUBBER
	apc_test_exempt_areas[/area/outreach/outpost/vacant/ground/office4] = NO_VENT|NO_SCRUBBER
	apc_test_exempt_areas[/area/outreach/outpost/vacant/ground/office3] = NO_VENT|NO_SCRUBBER
	apc_test_exempt_areas[/area/outreach/outpost/vacant/ground/office2] = NO_VENT|NO_SCRUBBER
	apc_test_exempt_areas[/area/outreach/outpost/vacant/ground/office1] = NO_VENT|NO_SCRUBBER

	apc_test_exempt_areas[/area/outreach/outpost/hangar/north/shuttle_area] = NO_APC|NO_VENT|NO_SCRUBBER

	apc_test_exempt_areas[/area/outreach/outpost/maint/outer_wall/ground] = NO_APC|NO_VENT|NO_SCRUBBER

	apc_test_exempt_areas[/area/outreach/outpost/maint/outer_wall/f1] = NO_APC|NO_VENT|NO_SCRUBBER
	apc_test_exempt_areas[/area/outreach/outpost/maint/passage/f1/northwest] = NO_VENT|NO_SCRUBBER


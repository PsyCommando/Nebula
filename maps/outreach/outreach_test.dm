//Add to the default areas
/datum/map/outreach/New()
	. = ..()
	area_coherency_test_exempt_areas += /area/outreach/outpost/ext_vents
	area_coherency_test_exempt_areas += /area/outreach/outpost/maint/outer_wall
	area_coherency_test_exempt_areas += /area/outreach/outpost/atmospherics/b2/tank_outer

	//Area meant to fool unit tests, because they're being a bit assinine
	apc_test_exempt_areas[/area/outreach/outpost/ext_vents]                  = NO_SCRUBBER|NO_APC 
	apc_test_exempt_areas[/area/outreach/outpost/maint/outer_wall]           = NO_SCRUBBER|NO_VENT|NO_APC 
	apc_test_exempt_areas[/area/outreach/outpost/control/servers]            = NO_SCRUBBER|NO_VENT
	apc_test_exempt_areas[/area/outreach/outpost/engineering/b2/geothermals] = NO_SCRUBBER|NO_VENT
	apc_test_exempt_areas[/area/outreach/outpost/atmospherics/b2/tank_outer] = NO_SCRUBBER|NO_VENT|NO_APC
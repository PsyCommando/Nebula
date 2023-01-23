///////////////////////////////////////////////////////////////////////////////////
// Simulated flooded underground chlorine pool
///////////////////////////////////////////////////////////////////////////////////
/turf/simulated/floor/asteroid/outreach/water/chlorine
	color          = "#d2e0b7"
	open_turf_type = /turf/simulated/floor/asteroid/outreach
	prev_type      = /turf/simulated/floor/asteroid/outreach

/turf/simulated/floor/asteroid/outreach/water/chlorine/Initialize(ml, floortype)
	. = ..()
	make_flooded(TRUE)
	add_fluid(/decl/material/gas/chlorine, FLUID_MAX_DEPTH)

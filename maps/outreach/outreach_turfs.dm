///////////////////////////////////////////////////////////////////////////////////
// Airless Floors
///////////////////////////////////////////////////////////////////////////////////
/turf/simulated/floor/tiled/techfloor/grid/airless
	initial_gas = null
	temperature = TCMB
/turf/simulated/floor/tiled/techfloor/airless
	initial_gas = null
	temperature = TCMB
/turf/simulated/floor/tiled/steel_ridged/airless
	initial_gas = null
	temperature = TCMB
/turf/simulated/floor/tiled/dark/monotile/airless
	initial_gas = null
	temperature = TCMB

///////////////////////////////////////////////////////////////////////////////////
// Outreach Atmos Floors
///////////////////////////////////////////////////////////////////////////////////
#define OUTREACH_ATMOS list(\
	/decl/material/gas/chlorine       = 0.17 * ((ONE_ATMOSPHERE/2) * CELL_VOLUME/(T0C * R_IDEAL_GAS_EQUATION)),\
	/decl/material/gas/nitrogen       = 0.63 * ((ONE_ATMOSPHERE/2) * CELL_VOLUME/(T0C * R_IDEAL_GAS_EQUATION)),\
	/decl/material/gas/carbon_dioxide = 0.11 * ((ONE_ATMOSPHERE/2) * CELL_VOLUME/(T0C * R_IDEAL_GAS_EQUATION)),\
)

/turf/simulated/floor/tiled/techfloor/grid/outreach
	initial_gas = OUTREACH_ATMOS
	temperature = T0C
/turf/simulated/floor/tiled/techfloor/outreach
	initial_gas = OUTREACH_ATMOS
	temperature = T0C
/turf/simulated/floor/tiled/steel_ridged/outreach
	initial_gas = OUTREACH_ATMOS
	temperature = T0C
/turf/simulated/floor/tiled/dark/monotile/outreach
	initial_gas = OUTREACH_ATMOS
	temperature = T0C
/turf/simulated/floor/asteroid/outreach
	initial_gas = OUTREACH_ATMOS
	temperature = T0C

///////////////////////////////////////////////////////////////////////////////////
// Painted walls
///////////////////////////////////////////////////////////////////////////////////
/turf/simulated/wall/ocp_wall/prepainted
	paint_color    = COLOR_GUNMETAL
	stripe_color   = COLOR_AMBER 
	material       = /decl/material/solid/metal/plasteel/ocp
	reinf_material = /decl/material/solid/metal/plasteel/ocp

/turf/simulated/wall/prepainted/medbay
	color        = COLOR_PALE_BLUE_GRAY
	stripe_color = COLOR_PALE_BLUE_GRAY
	paint_color  = null
/turf/simulated/wall/prepainted/engineering
	color        = COLOR_AMBER
	stripe_color = COLOR_AMBER
/turf/simulated/wall/prepainted/atmos
	color        = COLOR_CYAN
	stripe_color = COLOR_CYAN
/turf/simulated/wall/prepainted/mining
	color        = COLOR_BEASTY_BROWN
	stripe_color = COLOR_BEASTY_BROWN

///////////////////////////////////////////////////////////////////////////////////
// Painted Conrete Walls
///////////////////////////////////////////////////////////////////////////////////
/turf/simulated/wall/concrete/prepainted/medbay
	color        = COLOR_PALE_BLUE_GRAY
	stripe_color = COLOR_PALE_BLUE_GRAY
	paint_color  = null
/turf/simulated/wall/concrete/prepainted/mining
	color        = COLOR_BEASTY_BROWN
	stripe_color = COLOR_BEASTY_BROWN

///////////////////////////////////////////////////////////////////////////////////
// Painted Reinforced Walls
///////////////////////////////////////////////////////////////////////////////////
/turf/simulated/wall/r_wall/prepainted/engineering
	color        = COLOR_AMBER
	stripe_color = COLOR_AMBER
/turf/simulated/wall/r_wall/prepainted/atmos
	color        = COLOR_CYAN
	stripe_color = COLOR_CYAN

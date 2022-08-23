/obj/structure/filingcabinet/wallcabinet/Initialize()
	. = ..()
	set_extension(src, /datum/extension/base_wall_offset, list(
		"[NORTH]" = list("y" = -20),
		"[SOUTH]" = list("y" =  32),
		"[EAST ]" = list("x" = -24),
		"[WEST ]" = list("x" =  24),
	))
	set_dir(dir)

///////////////////////////////////////////////////////////////////////////////////
// Painted Wall frames
///////////////////////////////////////////////////////////////////////////////////
/obj/structure/wall_frame/prepainted/medical
	color        = COLOR_PALE_BLUE_GRAY
	paint_color  = null
	stripe_color = COLOR_PALE_BLUE_GRAY
/obj/structure/wall_frame/prepainted/engineering
	color        = COLOR_AMBER
	paint_color  = null
	stripe_color = COLOR_AMBER
/obj/structure/wall_frame/prepainted/atmos
	color        = COLOR_CYAN
	paint_color  = null
	stripe_color = COLOR_CYAN
/obj/structure/wall_frame/prepainted/mining
	color        = COLOR_BEASTY_BROWN
	paint_color  = null
	stripe_color = COLOR_PALE_ORANGE

///////////////////////////////////////////////////////////////////////////////////
// Concrete Wall frames
///////////////////////////////////////////////////////////////////////////////////
/obj/structure/wall_frame/concrete
	material = /decl/material/solid/stone/concrete

/obj/structure/wall_frame/concrete/prepainted/medical
	color        = COLOR_PALE_BLUE_GRAY
	paint_color  = null
	stripe_color = COLOR_PALE_BLUE_GRAY
/obj/structure/wall_frame/concrete/prepainted/engineering
	color        = COLOR_AMBER
	paint_color  = null
	stripe_color = COLOR_AMBER
/obj/structure/wall_frame/concrete/prepainted/atmos
	color        = COLOR_CYAN
	paint_color  = null
	stripe_color = COLOR_CYAN
/obj/structure/wall_frame/concrete/prepainted/mining
	color        = COLOR_BEASTY_BROWN
	paint_color  = null
	stripe_color = COLOR_PALE_ORANGE

///////////////////////////////////////////////////////////////////////////////////
// OCP Wall frames
///////////////////////////////////////////////////////////////////////////////////
/obj/structure/wall_frame/ocp
	color          = "#9bc6f2"
	material       = /decl/material/solid/metal/plasteel/ocp
/obj/structure/wall_frame/ocp/prepainted/exterior
	color          = COLOR_GUNMETAL
	paint_color    = COLOR_GUNMETAL
	stripe_color   = COLOR_AMBER 

///////////////////////////////////////////////////////////////////////////////////
// Spawners
///////////////////////////////////////////////////////////////////////////////////
/obj/effect/wallframe_spawn/no_grille
	icon = 'icons/obj/structures/window.dmi'
	icon_state = "window_full"

//No grille + concrete
/obj/effect/wallframe_spawn/no_grille/concrete
	name       = "concrete wall frame window spawner"
	frame_path = /obj/structure/wall_frame/concrete
/obj/effect/wallframe_spawn/no_grille/concrete/prepainted/medical
	name       = "concrete wall frame window spawner"
	color      = COLOR_PALE_BLUE_GRAY
	frame_path = /obj/structure/wall_frame/concrete/prepainted/medical
/obj/effect/wallframe_spawn/no_grille/concrete/prepainted/engineering
	name       = "concrete wall frame window spawner"
	color      = COLOR_AMBER
	frame_path = /obj/structure/wall_frame/concrete/prepainted/engineering
/obj/effect/wallframe_spawn/no_grille/concrete/prepainted/atmos
	name       = "concrete wall frame window spawner"
	color      = COLOR_CYAN
	frame_path = /obj/structure/wall_frame/concrete/prepainted/atmos
/obj/effect/wallframe_spawn/no_grille/concrete/prepainted/mining
	name       = "concrete wall frame window spawner"
	color      = COLOR_BEASTY_BROWN
	frame_path = /obj/structure/wall_frame/concrete/prepainted/mining

//No grille + painted
/obj/effect/wallframe_spawn/no_grille/prepainted/medical
	color      = COLOR_PALE_BLUE_GRAY
	frame_path = /obj/structure/wall_frame/prepainted/medical
/obj/effect/wallframe_spawn/no_grille/prepainted/engineering
	color      = COLOR_AMBER
	frame_path = /obj/structure/wall_frame/prepainted/engineering
/obj/effect/wallframe_spawn/no_grille/prepainted/atmos
	color      = COLOR_CYAN
	frame_path = /obj/structure/wall_frame/prepainted/atmos
/obj/effect/wallframe_spawn/no_grille/prepainted/mining
	color      = COLOR_BEASTY_BROWN
	frame_path = /obj/structure/wall_frame/prepainted/mining

//Reinforced concrete + painted
/obj/effect/wallframe_spawn/reinforced/concrete
	name       = "concrete wall frame reinforced window spawner"
	frame_path = /obj/structure/wall_frame/concrete

/obj/effect/wallframe_spawn/reinforced/concrete/prepainted/medical
	color      = COLOR_PALE_BLUE_GRAY
	frame_path = /obj/structure/wall_frame/concrete/prepainted/medical
/obj/effect/wallframe_spawn/reinforced/concrete/prepainted/engineering
	color      = COLOR_AMBER
	frame_path = /obj/structure/wall_frame/concrete/prepainted/engineering
/obj/effect/wallframe_spawn/reinforced/concrete/prepainted/atmos
	color      = COLOR_CYAN
	frame_path = /obj/structure/wall_frame/concrete/prepainted/atmos
/obj/effect/wallframe_spawn/reinforced/concrete/prepainted/mining
	color      = COLOR_BEASTY_BROWN
	frame_path = /obj/structure/wall_frame/concrete/prepainted/mining

//concrete + painted
/obj/effect/wallframe_spawn/concrete/prepainted/medical
	color      = COLOR_PALE_BLUE_GRAY
	frame_path = /obj/structure/wall_frame/concrete/prepainted/medical
/obj/effect/wallframe_spawn/concrete/prepainted/engineering
	color      = COLOR_AMBER
	frame_path = /obj/structure/wall_frame/concrete/prepainted/engineering
/obj/effect/wallframe_spawn/concrete/prepainted/atmos
	color      = COLOR_CYAN
	frame_path = /obj/structure/wall_frame/concrete/prepainted/atmos
/obj/effect/wallframe_spawn/concrete/prepainted/mining
	color      = COLOR_BEASTY_BROWN
	frame_path = /obj/structure/wall_frame/concrete/prepainted/mining

//Reinforced + painted
/obj/effect/wallframe_spawn/reinforced/prepainted/medical
	color      = COLOR_PALE_BLUE_GRAY
	frame_path = /obj/structure/wall_frame/prepainted/medical
/obj/effect/wallframe_spawn/reinforced/prepainted/engineering
	color      = COLOR_AMBER
	frame_path = /obj/structure/wall_frame/prepainted/engineering
/obj/effect/wallframe_spawn/reinforced/prepainted/atmos
	color      = COLOR_CYAN
	frame_path = /obj/structure/wall_frame/prepainted/atmos
/obj/effect/wallframe_spawn/reinforced/prepainted/mining
	color      = COLOR_BEASTY_BROWN
	frame_path = /obj/structure/wall_frame/prepainted/mining

///////////////////////////////////////////////////////////////////////////////////
// Railings
///////////////////////////////////////////////////////////////////////////////////
/obj/structure/railing/mapped/stairwell
	anchored      = TRUE
	color         = COLOR_GRAY40
	painted_color = COLOR_GRAY40

///////////////////////////////////////////////////////////////////////////////////
// Railings
///////////////////////////////////////////////////////////////////////////////////
/obj/structure/barricade/wood
	material = /decl/material/solid/wood/maple
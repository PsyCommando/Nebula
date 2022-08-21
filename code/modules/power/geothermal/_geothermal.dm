var/global/const/GEOTHERMAL_EFFICIENCY_MOD =             0.2
var/global/const/GEOTHERMAL_PRESSURE_LOSS =              0.3
var/global/const/GEOTHERMAL_PRESSURE_CONSUMED_PER_TICK = 0.5
var/global/const/GEOTHERMAL_PRESSURE_TO_POWER =        100
var/global/const/MAX_GEOTHERMAL_PRESSURE =            2000

/obj/effect/geyser
	name = "geothermal vent"
	desc = "A crack in the ocean floor that occasionally vents gouts of superheated water and steam."
	icon = 'icons/effects/geyser.dmi'
	icon_state = "geyser"
	anchored = TRUE
	layer = TURF_LAYER + 0.01

/obj/effect/geyser/Initialize()
	. = ..()
	if(prob(50))
		var/matrix/M = matrix()
		M.Scale(-1, 1)
		transform = M
	set_extension(src, /datum/extension/geothermal_vent)
	for(var/turf/exterior/seafloor/T in RANGE_TURFS(loc, 5))
		var/dist = get_dist(loc, T)-1
		if(prob(100 - (dist * 20)))
			T = T.ChangeTurf(/turf/exterior/mud)
		if(prob(50 - (dist * 10)))
			new /obj/random/seaweed(T)

/obj/effect/geyser/explosion_act(severity)
	. = ..()
	if(!QDELETED(src) && prob(100 - (25 * severity)))
		physically_destroyed()

/obj/machinery/geothermal
	name                           = "geothermal generator"
	icon                           = 'icons/obj/machines/power/geothermal.dmi'
	icon_state                     = "geothermal-base"
	anchored                       = TRUE
	waterproof                     = TRUE
	interact_offline               = TRUE
	stat_immune                    = NOSCREEN | NOINPUT | NOPOWER
	core_skill                     = SKILL_ENGINES
	required_interaction_dexterity = DEXTERITY_SIMPLE_MACHINES
	construct_state                = /decl/machine_construction/default/panel_closed
	uncreated_component_parts      = list(
		/obj/item/stock_parts/power/terminal = 1
	)
	stock_part_presets             = list(
		/decl/stock_part_preset/terminal_setup/offset_dir = 1,
	)
	var/tmp/neighbors              = 0
	var/tmp/current_pressure       = 0
	var/tmp/efficiency             = 0.5
	var/tmp/datum/extension/geothermal_vent/vent
	var/tmp/obj/item/stock_parts/power/terminal/connector

/obj/machinery/geothermal/Initialize()
	. = ..()
	refresh_neighbors()
	for(var/turf/T as anything in RANGE_TURFS(loc, 1))
		for(var/obj/machinery/geothermal/neighbor in T)
			neighbor.refresh_neighbors()
	STOP_PROCESSING_MACHINE(src, MACHINERY_PROCESS_SELF)
	return INITIALIZE_HINT_LATELOAD

/obj/machinery/geothermal/LateInitialize()
	. = ..()
	setup_vent()

/obj/machinery/geothermal/Destroy()
	var/atom/last_loc = loc
	unset_vent()
	. = ..()
	if(istype(last_loc))
		for(var/turf/T as anything in RANGE_TURFS(last_loc, 1))
			for(var/obj/machinery/geothermal/neighbor in T)
				neighbor.refresh_neighbors()

/obj/machinery/geothermal/proc/setup_vent()
	var/turf/T = get_turf(src)
	for(var/obj/O in T)
		var/datum/extension/geothermal_vent/GV = get_extension(O, /datum/extension/geothermal_vent)
		if(!GV || QDELETED(GV))
			continue
		vent = GV
		vent.my_machine = src
		return TRUE

/obj/machinery/geothermal/proc/unset_vent()
	if(!vent || QDELETED(vent))
		return
	vent.my_machine = null
	vent = null

/obj/machinery/geothermal/RefreshParts()
	..()
	efficiency = clamp(total_component_rating_of_type(/obj/item/stock_parts/capacitor) * GEOTHERMAL_EFFICIENCY_MOD, GEOTHERMAL_EFFICIENCY_MOD, 1)
	connector = get_component_of_type(/obj/item/stock_parts/power/terminal)

/obj/machinery/geothermal/proc/add_pressure(var/pressure)
	current_pressure = clamp(current_pressure + pressure, 0, MAX_GEOTHERMAL_PRESSURE)
	if(!is_processing)
		START_PROCESSING_MACHINE(src, MACHINERY_PROCESS_SELF)

/obj/machinery/geothermal/Process()
	if(anchored && !(stat & BROKEN) && loc)
		var/consumed_pressure = current_pressure * GEOTHERMAL_PRESSURE_CONSUMED_PER_TICK
		current_pressure -= consumed_pressure
		var/remaining_pressure = consumed_pressure
		consumed_pressure = round(consumed_pressure * efficiency)
		remaining_pressure -= consumed_pressure

		var/generated_power = round(consumed_pressure * GEOTHERMAL_PRESSURE_TO_POWER)
		if(generated_power)
			generate_power(generated_power)
		remaining_pressure = round(remaining_pressure * GEOTHERMAL_PRESSURE_LOSS)
		if(remaining_pressure)
			addtimer(CALLBACK(src, .proc/propagate_pressure, remaining_pressure), 5)
	update_icon()
	if(current_pressure <= 10)
		return PROCESS_KILL

/obj/machinery/geothermal/proc/propagate_pressure(var/remaining_pressure)
	var/list/neighbors
	for(var/neighbordir in global.cardinal)
		var/obj/machinery/geothermal/neighbor = (locate() in get_step(loc, neighbordir))
		if(neighbor?.anchored && !(neighbor.stat & BROKEN))
			LAZYADD(neighbors, neighbor)
	if(LAZYLEN(neighbors))
		remaining_pressure = round(remaining_pressure / LAZYLEN(neighbors))
		if(remaining_pressure)
			for(var/obj/machinery/geothermal/neighbor as anything in neighbors)
				neighbor.add_pressure(remaining_pressure)

/obj/machinery/geothermal/proc/refresh_neighbors()
	var/last_neighbors = neighbors
	neighbors = 0
	for(var/neighbordir in global.cardinal)
		if(locate(/obj/machinery/geothermal) in get_step(loc, neighbordir))
			neighbors |= neighbordir
	if(last_neighbors != neighbors)
		update_icon()

/obj/machinery/geothermal/on_update_icon()
	cut_overlays()

	if(neighbors)
		for(var/neighbordir in global.cardinal)
			if(neighbors & neighbordir)
				add_overlay(image(icon, "geothermal-connector", dir = neighbordir))

	if(round(current_pressure, 0.1) > 0)
		set_light(2, 0.5, COLOR_RED)
		add_overlay(image(icon, "geothermal-turbine-[clamp(round(current_pressure / 200), 0, 3)]"))
		var/glow_alpha = clamp(round((current_pressure / 500) * 255), 20, 255)
		var/image/I = emissive_overlay(icon, "geothermal-glow")
		I.alpha = glow_alpha
		add_overlay(I)
		if(neighbors)
			for(var/neighbordir in global.cardinal)
				if(neighbors & neighbordir)
					// emissive_overlay is not setting dir and setting plane/layer directly also causes dir to break :(
					I = image(icon, "geothermal-connector-glow", dir = neighbordir)
					I.alpha = glow_alpha
					add_overlay(I)
	else
		set_light(0)

/obj/machinery/geothermal/dismantle()
	. = ..()
	unset_vent()

/obj/machinery/geothermal/get_powernet()
	return connector?.terminal?.get_powernet()
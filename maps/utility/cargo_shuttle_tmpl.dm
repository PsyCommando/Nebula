/area/shuttle/supply_shuttle
	name = "Cargo shuttle"
	icon_state = "shuttle3"

/obj/effect/shuttle_landmark/supply/start
	landmark_tag ="nav_cargo_start"

/datum/shuttle/autodock/ferry/supply/cargo
	name             = "Cargo shuttle"
	shuttle_area     = /area/shuttle/supply_shuttle
	waypoint_offsite = "nav_cargo_start"

//Ideally the supply shuttle template should be stitched onto a free slot on a utility z-level but for stand-alone uses this works
/obj/abstract/level_data/transit_level/cargo_shuttle_standalone
	name      = "Cargo shuttle"
	level_id  = "cargo_shuttle_standalone"
	base_turf = /turf/space

/obj/machinery/computer/shuttle_control/cargo
	shuttle_tag = "Cargo shuttle"

//
// SSOverride
//
/datum/controller/subsystem/supply/get_clear_turfs()
	var/list/clear_turfs = ..()

	//Only put cargo on floor that had outlines
	for(var/turf/T in clear_turfs)
		var/had_outline = FALSE
		for(var/atom/movable/AM in T.contents)
			if(istype(AM, /obj/effect/floor_decal/industrial/outline))
				had_outline = TRUE
				break
		if(!had_outline)
			clear_turfs -= T //Remove turfs from the shuttle that we shouldn't put crap on
	return clear_turfs


//
// Machines
//
/obj/machinery/conveyor_switch/indestructible
	stat_immune = BROKEN | NOPOWER | MAINT | EMPED | NOSCREEN | NOINPUT
/obj/machinery/conveyor_switch/indestructible/take_damage(amount, damtype, silent)
	return
/obj/machinery/door/airlock/hatch/indestructible/attackby(obj/item/C, mob/user)
	return
/obj/machinery/conveyor_switch/indestructible/physically_destroyed()
	SHOULD_CALL_PARENT(FALSE)
	return

/obj/machinery/conveyor/indestructible
	stat_immune = BROKEN | NOPOWER | MAINT | EMPED | NOSCREEN | NOINPUT
/obj/machinery/conveyor/indestructible/take_damage(amount, damtype, silent)
	return
/obj/machinery/conveyor/indestructible/attackby(obj/item/C, mob/user)
	return
/obj/machinery/conveyor/indestructible/physically_destroyed()
	SHOULD_CALL_PARENT(FALSE)
	return

/obj/machinery/button/blast_door/indestructible
	stat_immune = BROKEN | NOPOWER | MAINT | EMPED | NOSCREEN | NOINPUT
/obj/machinery/button/blast_door/indestructible/take_damage(amount, damtype, silent)
	return
/obj/machinery/button/blast_door/indestructible/attackby(obj/item/C, mob/user)
	return
/obj/machinery/button/blast_door/indestructible/physically_destroyed()
	SHOULD_CALL_PARENT(FALSE)
	return

/obj/machinery/door/airlock/hatch/indestructible
	stat_immune = BROKEN | NOPOWER | MAINT | EMPED | NOSCREEN | NOINPUT
	hackProof = TRUE
/obj/machinery/door/airlock/hatch/indestructible/take_damage(amount, damtype, silent)
	return
/obj/machinery/door/airlock/hatch/indestructible/attackby(obj/item/C, mob/user)
	return
/obj/machinery/door/airlock/hatch/indestructible/physically_destroyed()
	SHOULD_CALL_PARENT(FALSE)
	return

/obj/machinery/door/blast/shutters/indestructible
	stat_immune = BROKEN | NOPOWER | MAINT | EMPED | NOSCREEN | NOINPUT
/obj/machinery/door/blast/shutters/indestructible/take_damage(amount, damtype, silent)
	return
/obj/machinery/door/blast/shutters/indestructible/attackby(obj/item/C, mob/user)
	return
/obj/machinery/door/blast/shutters/indestructible/physically_destroyed()
	SHOULD_CALL_PARENT(FALSE)
	return

/obj/machinery/embedded_controller/radio/simple_docking_controller/indestructible
	stat_immune = BROKEN | NOPOWER | MAINT | EMPED | NOSCREEN | NOINPUT
/obj/machinery/embedded_controller/radio/simple_docking_controller/indestructible/take_damage(amount, damtype, silent)
	return
/obj/machinery/embedded_controller/radio/simple_docking_controller/indestructible/attackby(obj/item/C, mob/user)
	return
/obj/machinery/embedded_controller/radio/simple_docking_controller/indestructible/physically_destroyed()
	SHOULD_CALL_PARENT(FALSE)
	return

//
// Turfs
//

////////////////////////////////////////////////////////////////////////
// Indestructible Interior Floor
////////////////////////////////////////////////////////////////////////
/turf/simulated/floor/indestructible
	name = "hull plating"
	icon = 'icons/turf/flooring/tiles.dmi'
	icon_state = "reinforced_light"
	footstep_type = /decl/footsteps/plating
	initial_gas = list(/decl/material/gas/oxygen = MOLES_O2STANDARD, /decl/material/gas/nitrogen = MOLES_N2STANDARD)

/turf/simulated/floor/indestructible/fire_act(datum/gas_mixture/air, exposed_temperature, exposed_volume)
	return
/turf/simulated/floor/indestructible/explosion_act(severity)
	SHOULD_CALL_PARENT(FALSE)
	return
/turf/simulated/floor/indestructible/attack_hand(mob/user)
	return
/turf/simulated/floor/indestructible/attackby(var/obj/item/C, var/mob/user)
	return

////////////////////////////////////////////////////////////////////////
// Indestructible Hull Walls
////////////////////////////////////////////////////////////////////////
/turf/simulated/wall/r_titanium/indestructible
	name = "hull plating"

/turf/simulated/wall/r_titanium/indestructible/fire_act(datum/gas_mixture/air, exposed_temperature, exposed_volume)
	return
/turf/simulated/wall/r_titanium/indestructible/explosion_act(severity)
	SHOULD_CALL_PARENT(FALSE)
	return
/turf/simulated/wall/r_titanium/indestructible/attack_hand(mob/user)
	return
/turf/simulated/wall/r_titanium/indestructible/attackby(var/obj/item/C, var/mob/user)
	return

////////////////////////////////////////////////////////////////////////
// Indestructible Airless Floor
////////////////////////////////////////////////////////////////////////

/turf/simulated/floor/airless/indestructible
	name = "external hull plating"
/turf/simulated/floor/airless/indestructible/fire_act(datum/gas_mixture/air, exposed_temperature, exposed_volume)
	return
/turf/simulated/floor/airless/indestructible/explosion_act(severity)
	SHOULD_CALL_PARENT(FALSE)
	return
/turf/simulated/floor/airless/indestructible/attack_hand(mob/user)
	return
/turf/simulated/floor/airless/indestructible/attackby(var/obj/item/C, var/mob/user)
	return

////////////////////////////////////////////////////////////////////////
// Indestructible Flaps
////////////////////////////////////////////////////////////////////////
/obj/structure/plasticflaps/airtight/indestructible
	airtight = TRUE

/obj/structure/plasticflaps/airtight/indestructible/attackby(obj/item/W, mob/user)
	return //No interactions
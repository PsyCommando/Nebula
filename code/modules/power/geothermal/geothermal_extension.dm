/datum/extension/geothermal_vent
	base_type = /datum/extension/geothermal_vent
	expected_type = /atom
	flags = EXTENSION_FLAG_IMMEDIATE
	var/pressure_min = 1000
	var/pressure_max = 2000
	var/steam_min = 30 SECONDS
	var/steam_max = 1 MINUTE
	var/tmp/next_steam = 0
	var/datum/effect/effect/system/steam_spread/steam
	var/obj/machinery/geothermal/my_machine

/datum/extension/geothermal_vent/New()
	..()
	START_PROCESSING(SSprocessing, src)

/datum/extension/geothermal_vent/Destroy()
	my_machine = null
	. = ..()
	STOP_PROCESSING(SSprocessing, src)
	
/datum/extension/geothermal_vent/Process()
	..()
	if(world.time >= next_steam)
		next_steam = world.time + rand(steam_min, steam_max)
		//If we cached something, make it work
		if(my_machine?.anchored)
			my_machine.add_pressure(rand(pressure_min, pressure_max))
			return
		//If we don't find anything above us, just do the steam effect
		if(!steam)
			steam = new
			steam.set_up(5, 0, holder)
		steam.start()

		var/turf/T = get_turf(src)
		T?.hotspot_expose(T0C + rand(150, 250), 50)

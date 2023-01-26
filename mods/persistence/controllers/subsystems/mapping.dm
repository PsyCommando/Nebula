/datum/controller/subsystem/mapping
	var/loaded_maps = FALSE

/datum/controller/subsystem/mapping/Initialize(timeofday)
	. = ..()
	var/save_exists = FALSE
#ifndef UNIT_TEST
	save_exists = SSpersistence.SaveExists()
	if(save_exists)
		report_progress_serializer("Existing save found.")
	else
		report_progress_serializer("No existing save found.")
#endif

	if(save_exists)
		global.using_map.reserve_zlevels()
	else
		global.using_map.load_map()

	loaded_maps = TRUE

#ifdef UNIT_TEST
	report_progress_serializer("Unit testing, so not loading saved map")
#else
	if(save_exists)
		report_progress_serializer("Loading world save.")
		SSpersistence.LoadWorld()
#endif

/datum/controller/subsystem/mapping/proc/Save()
	SSpersistence.SaveWorld()

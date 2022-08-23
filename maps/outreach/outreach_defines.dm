/datum/map/outreach
	name            = "Outreach"
	full_name       = "Outreach Outpost"
	path            = "outreach"
	station_name    = "Harlech Colony"          //Placeholder meme name for testing what uses this
	station_short   = "Harlech"
	boss_name       = "Interstellar Inc"        //Just some random company name so we don't get CAPTAIN RODGER ANNOUNCED SPACE CARPS LOL
	boss_short      = "Interstellar"
	company_name    = "Outreach Cooperative"   //Just name to refer to the collective outreach workforce and get rid of the filler default
	company_short   = "Outreach"
	system_name     = "Outreach System"
	dock_name       = "Outreach Docks"

	default_spawn    = /decl/spawnpoint/cryo
	allowed_spawns   = list(/decl/spawnpoint/cryo)
	starting_money   = 5000
	department_money = 0
	salary_modifier  = 0.2

	lobby_screens = list(
		'maps/outreach/lobby/exoplanet.png'
	)
	lobby_tracks = list(
		/decl/music_track/dirtyoldfrogg,
		// /decl/music_track/neon_koto,
		// /decl/music_track/blood_loss,
		// /decl/music_track/marhaba,
	)

	//#REMOVEME: Shouldn't get commited!
	num_exoplanets   = 0
	away_site_budget = 4
	var/outreach_initialized = FALSE

/datum/map/outreach/get_map_info()
	return "You are en route to Outreach, a desolate planet previously targeted for mining operations, but now largely abandoned. Judges - corporate law enforcement - remain in the sector to keep the order. Colonists come from a wide variety of backgrounds, but universally with only the shirt on their backs."

/datum/map/outreach/build_exoplanets()
	log_debug("MAP: building exoplanets!") //#REMOVEME
	if(!outreach_initialized)
		for(var/z in global.overmap_sectors)
			var/obj/effect/overmap/visitable/sector/exoplanet/outreach/O = global.overmap_sectors[z]
			if(istype(O))
				O.build_level() //We have to force outreach to update now, otherwise it won't set its atmosphere
				outreach_initialized = TRUE
				break
	. = ..()
	
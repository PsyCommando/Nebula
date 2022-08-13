///////////////////////////////////////////////////
//Planet
///////////////////////////////////////////////////
/area/exoplanet/outreach
	name = "outreach"
/area/exoplanet/outreach/sky
	name = "Outreach Sky"
	icon_state = "blueold"
/area/exoplanet/outreach/underground
	name = "Outreach Underground"
/area/exoplanet/outreach/underground/d1
	name = "Outreach Sedimentary Layer"
	icon_state = "dk_yellow"
/area/exoplanet/outreach/underground/d2
	name = "Outreach Substrate Layer"
	icon_state = "purple"

///////////////////////////////////////////////////
//Mines
///////////////////////////////////////////////////
/area/exoplanet/outreach/mines
	name = "Deep Underground"
	icon_state = "unknown"
	ignore_mining_regen = FALSE

/area/exoplanet/outreach/mines/depth_1
	icon_state = "cave"

/area/exoplanet/outreach/mines/depth_2
	icon_state = "cave"

/area/exoplanet/outreach/mines/exits
	icon_state = "exit"
	ignore_mining_regen = TRUE

///////////////////////////////////////////////////
//Outpost
///////////////////////////////////////////////////
/area/outreach/outpost
	//safe_zone = TRUE

///////////////////////////////////////////////////
//Cryo
///////////////////////////////////////////////////
/area/outreach/outpost/sleeproom
	name = "OB 1B Cyrogenic Storage"
	icon_state = "cryo"

///////////////////////////////////////////////////
//Controls
///////////////////////////////////////////////////
/area/outreach/outpost/control
	name = "OB 1B Control Room"
	icon_state = "server"
/area/outreach/outpost/control/servers
	name = "OB 1B Servers Room"
	icon_state = "server"
/area/outreach/outpost/control/cooling
	name = "OB 1B Cooling Systems Room"
	icon_state = "server"

///////////////////////////////////////////////////
//Medbay
///////////////////////////////////////////////////
/area/outreach/outpost/medbay
	name = "OB 1B Medbay"
	icon_state = "medbay"

/area/outreach/outpost/medbay/storage
	name = "OB 1B Medbay Storage"
	icon_state = "medbay3"

/area/outreach/outpost/medbay/cloning
	name = "OB 1B Medbay Storage"
	icon_state = "medbay3"

/area/outreach/outpost/medbay/chemistry
	name = "OB 1B Medbay Chemistry"
	icon_state = "medbay3"

/area/outreach/outpost/medbay/lobby
	name = "OB 1B Medbay Lobby"
	icon_state = "medbay2"

/area/outreach/outpost/medbay/main_hall
	name = "OB 1B Medbay Main Hall"
	icon_state = "exam_room"

/area/outreach/outpost/medbay/op_room
	icon_state = "surgery"
/area/outreach/outpost/medbay/op_room/a
	name = "OB 1B Medbay Operation Room A"
/area/outreach/outpost/medbay/op_room/b
	name = "OB 1B Medbay Operation Room B"
/area/outreach/outpost/medbay/op_room/c
	name = "OB 1B Medbay Operation Room C"

/area/outreach/outpost/medbay/morgue
	name = "OB 1B Medbay Morgue"
	icon_state = "morgue"

/area/outreach/outpost/medbay/office
	name = "OB 1B Medbay Office"
	icon_state = "CMO"

///////////////////////////////////////////////////
//Hallways
///////////////////////////////////////////////////

//South == Aft
/area/outreach/outpost/hallway/south
	icon_state = "hallA"
/area/outreach/outpost/hallway/south/basement2
	name = "OH 2B South Hallway"
/area/outreach/outpost/hallway/south/basement1
	name = "OH 1B South Hallway"
/area/outreach/outpost/hallway/south/ground
	name = "OH GF South Hallway"
/area/outreach/outpost/hallway/south/floor1
	name = "OH 1F South Hallway"

//North == Fore
/area/outreach/outpost/hallway/north
	icon_state = "hallF2"
/area/outreach/outpost/hallway/north/basement2
	name = "OH 2B North Hallway"
/area/outreach/outpost/hallway/north/basement1
	name = "OH 1B North Hallway"
/area/outreach/outpost/hallway/north/ground
	name = "OH GF North Hallway"
/area/outreach/outpost/hallway/north/floor1
	name = "OH 1F North Hallway"

//East == Starboard
/area/outreach/outpost/hallway/east
	icon_state = "hallS"
/area/outreach/outpost/hallway/east/basement2
	name = "OH 2B East Hallway"
/area/outreach/outpost/hallway/east/basement1
	name = "OH 1B East Hallway"
/area/outreach/outpost/hallway/east/ground
	name = "OH GF East Hallway"
/area/outreach/outpost/hallway/east/floor1
	name = "OH 1F East Hallway"

//West == Port
/area/outreach/outpost/hallway/west
	icon_state = "hallP"
/area/outreach/outpost/hallway/west/basement2
	name = "OH 2B West Hallway"
/area/outreach/outpost/hallway/west/basement1
	name = "OH 1B West Hallway"
/area/outreach/outpost/hallway/west/ground
	name = "OH GF West Hallway"
/area/outreach/outpost/hallway/west/floor1
	name = "OH 1F West Hallway"

//Central
/area/outreach/outpost/hallway/central
	icon_state = "hallC1"
/area/outreach/outpost/hallway/central/basement2
	name = "OH 2B Central Hallway"
/area/outreach/outpost/hallway/central/basement1
	name = "OH 1B Central Hallway"
/area/outreach/outpost/hallway/central/ground
	name = "OH GF Central Hallway"
/area/outreach/outpost/hallway/central/floor1
	name = "OH 1F Central Hallway"

///////////////////////////////////////////////////
//Stairwell
///////////////////////////////////////////////////
/area/outreach/outpost/stairwell
	name = "OH Stairwell"
	icon_state = "purple"

/area/outreach/outpost/stairwell/basement2
	name = "OH 2B Stairwell"
/area/outreach/outpost/stairwell/basement1
	name = "OH 1B Stairwell"
/area/outreach/outpost/stairwell/ground
	name = "OH GF Stairwell"
/area/outreach/outpost/stairwell/floor1
	name = "OH 1F Stairwell"

///////////////////////////////////////////////////
//Maintenance
///////////////////////////////////////////////////
/area/outreach/outpost/maint
	name = "OB 1B Maintenance"
	icon_state = "maintcentral"

/area/outreach/outpost/maint/passage
	name = "OB 1B Maintenance Passage"
	icon_state = "maintcentral"

/area/outreach/outpost/maint/passage/b2/northwest
	name = "OB 2B NW Maint Passage"
	icon_state = "fpmaint"
/area/outreach/outpost/maint/passage/b2/northeast
	name = "OB 2B NE Maint Passage"
	icon_state = "fsmaint"
/area/outreach/outpost/maint/passage/b2/southwest
	name = "OB 2B SW Maint Passage"
	icon_state = "apmaint"
/area/outreach/outpost/maint/passage/b2/southeast
	name = "OB 2B SE Maint Passage"
	icon_state = "asmaint"

/area/outreach/outpost/maint/passage/b1/northwest
	name = "OB 1B NW Maint Passage"
	icon_state = "fpmaint"
/area/outreach/outpost/maint/passage/b1/northeast
	name = "OB 1B NE Maint Passage"
	icon_state = "fsmaint"
/area/outreach/outpost/maint/passage/b1/southwest
	name = "OB 1B SW Maint Passage"
	icon_state = "apmaint"
/area/outreach/outpost/maint/passage/b1/southeast
	name = "OB 1B SE Maint Passage"
	icon_state = "asmaint"

/area/outreach/outpost/maint/passage/ground/northwest
	name = "OB GF NW Maint Passage"
	icon_state = "fpmaint"
/area/outreach/outpost/maint/passage/ground/northeast
	name = "OB GF NE Maint Passage"
	icon_state = "fsmaint"
/area/outreach/outpost/maint/passage/ground/southwest
	name = "OB GF SW Maint Passage"
	icon_state = "apmaint"
/area/outreach/outpost/maint/passage/ground/southeast
	name = "OB GF SE Maint Passage"
	icon_state = "asmaint"

/area/outreach/outpost/maint/passage/f1/northwest
	name = "OB 1F NW Maint Passage"
	icon_state = "fpmaint"
/area/outreach/outpost/maint/passage/f1/northeast
	name = "OB 1F NE Maint Passage"
	icon_state = "fsmaint"
/area/outreach/outpost/maint/passage/f1/southwest
	name = "OB 1F SW Maint Passage"
	icon_state = "apmaint"
/area/outreach/outpost/maint/passage/f1/southeast
	name = "OB 1F SE Maint Passage"
	icon_state = "asmaint"


/area/outreach/outpost/maint/storage
	name = "OB 1B Maintenance Storage"
	icon_state = "auxstorage"
/area/outreach/outpost/maint/storage/ground
	name = "OB GF Maintenance Storage"

/area/outreach/outpost/maint/power
	icon_state = "substation"
/area/outreach/outpost/maint/power/b2
	name = "OB 2B Maintenance Power Room"
/area/outreach/outpost/maint/power/b1
	name = "OB 1B Maintenance Power Room"
/area/outreach/outpost/maint/power/ground
	name = "OB GF Maintenance Power Room"
/area/outreach/outpost/maint/power/f1
	name = "OB 1F Maintenance Power Room"

/area/outreach/outpost/maint/atmos
	icon_state = "fsmaint"
/area/outreach/outpost/maint/atmos/b2
	name = "OB 2B Atmos Lines Maintenance"
/area/outreach/outpost/maint/atmos/b1
	name = "OB 1B Atmos Lines Maintenance"
/area/outreach/outpost/maint/atmos/ground
	name = "OB GF Atmos Lines Maintenance"
/area/outreach/outpost/maint/atmos/f1
	name = "OB 1F Atmos Lines Maintenance"

/area/outreach/outpost/maint/outer_wall
	icon_state = "maint_exterior"
/area/outreach/outpost/maint/outer_wall/b2
	name = "OB 2B Maintenance Outer"
/area/outreach/outpost/maint/outer_wall/b1
	name = "OB 1B Maintenance Outer"
/area/outreach/outpost/maint/outer_wall/ground
	name = "OB GF Maintenance Outer"
/area/outreach/outpost/maint/outer_wall/f1
	name = "OB 1F Maintenance Outer"

/area/outreach/outpost/maint/waste
	icon_state = "fpmaint"
/area/outreach/outpost/maint/waste/b2
	name = "OB 2B Waste Lines Maintenance"
/area/outreach/outpost/maint/waste/b1
	name = "OB 2B Waste Lines Maintenance"
/area/outreach/outpost/maint/waste/ground
	name = "OB GF Waste Lines Maintenance"
/area/outreach/outpost/maint/waste/f1
	name = "OB 1F Waste Lines Maintenance"

///////////////////////////////////////////////////
//Kitchen
///////////////////////////////////////////////////
/area/outreach/outpost/cafeteria
	name = "OB 1B Cafeteria"
	icon_state = "cafeteria"

/area/outreach/outpost/cafeteria/kitchen
	name = "OB 1B Kitchen"
	icon_state = "kitchen"

///////////////////////////////////////////////////
//Hydroponics
///////////////////////////////////////////////////
/area/outreach/outpost/hydroponics
	name = "OB 1B Hydroponics"
	icon_state = "hydro"

///////////////////////////////////////////////////
//Engineering
///////////////////////////////////////////////////
/area/outreach/outpost/engineering
	name = "OB 1B Engineering"
	icon_state = "engineering"

/area/outreach/outpost/engineering/b1/workshop
	name = "OB 1B Engineering Workshop"
	icon_state = "engineering_workshop"

/area/outreach/outpost/engineering/b1/storage
	name = "OB 1B Engineering Storage"
	icon_state = "engineering_storage"

/area/outreach/outpost/engineering/b2/smes
	name = "OB 2B Power Storage"
	icon_state = "engine_smes"

/area/outreach/outpost/engineering/b2/geothermals
	name = "OB 2B Geothermals"
	icon_state = "engine"

///////////////////////////////////////////////////
//Atmos
///////////////////////////////////////////////////
/area/outreach/outpost/atmospherics
	icon_state = "atmos"

/area/outreach/outpost/atmospherics/b1/storage
	name = "OB 1B Atmos Storage"
	icon_state = "atmos"
/area/outreach/outpost/atmospherics/b1/hall
	name = "OB 1B Atmospherics Hall"
	icon_state = "atmos"
/area/outreach/outpost/atmospherics/b1/supply
	name = "OB 1B Atmos Air Supply"
	icon_state = "atmos"
/area/outreach/outpost/atmospherics/b1/treatment
	name = "OB 1B Atmos Air Treatment"
	icon_state = "atmos"
/area/outreach/outpost/atmospherics/b1/tank_access
	name = "OB 1B Atmos Tank Control"
	icon_state = "atmos"
/area/outreach/outpost/atmospherics/b2/tank_outer
	name = "OB 2B Atmos Tanks Perimeter"
	icon_state = "atmos"


///////////////////////////////////////////////////
//Sec
///////////////////////////////////////////////////
/area/outreach/outpost/security
	icon_state = "security"
/area/outreach/outpost/security/b1
	name = "OB 1B Security"
/area/outreach/outpost/security/b1/office
	name = "OB 1B Security Office"
	icon_state = "checkpoint"
/area/outreach/outpost/security/b1/cell
	name = "OB 1B Brig"
	icon_state = "brig"

///////////////////////////////////////////////////
//Mining
///////////////////////////////////////////////////
/area/outreach/outpost/mining
	icon_state = "mining"
/area/outreach/outpost/mining/b1/processing
	name = "OB 1B Ore Processing"
	icon_state = "mining_production"
/area/outreach/outpost/mining/b1/storage
	name = "OB 1B Mining Storage"
/area/outreach/outpost/mining/b1/foyer
	name = "OB 1B Mining Foyer"
	icon_state = "mining_living"
/area/outreach/outpost/mining/b1/workshop
	name = "OB 1B Mining Workshop"

///////////////////////////////////////////////////
//Cargo
///////////////////////////////////////////////////
/area/outreach/outpost/cargo
	name = "OB 1B Cargo"
	icon_state = "quart"

///////////////////////////////////////////////////
//Airlock
///////////////////////////////////////////////////
/area/outreach/outpost/airlock
	name = "Airlock"
	icon_state = "entry_1"
/area/outreach/outpost/airlock/basement2
	name = "OH 2B Airlock"
/area/outreach/outpost/airlock/basement1/east
	name = "OH 1B East Airlock"
/area/outreach/outpost/airlock/basement1/west
	name = "OH 1B West Airlock"
/area/outreach/outpost/airlock/basement1/south
	name = "OH 1B South Airlock"
/area/outreach/outpost/airlock/basement1/north
	name = "OH 1B North Airlock"
/area/outreach/outpost/airlock/ground
	name = "OH GF Airlock"
/area/outreach/outpost/airlock/floor1
	name = "OH 1F Airlock"

///////////////////////////////////////////////////
//Janitor
///////////////////////////////////////////////////
/area/outreach/outpost/janitorial
	name = "OH 1B Custodial Storeroom"
	icon_state = "janitor"
/area/outreach/outpost/janitorial/hall
	name = "OH 1B Custodial Office"
	icon_state = "janitor"

///////////////////////////////////////////////////
//Restrooms
///////////////////////////////////////////////////
/area/outreach/outpost/restrooms
	name = "OB 1B Restroom"
	icon_state = "restrooms"

///////////////////////////////////////////////////
//Crew Quarters
///////////////////////////////////////////////////
/area/outreach/outpost/crew_quarters
	name = "OB 1B Crew Quarters"
	icon_state = "crew_quarters"

/area/outreach/outpost/crew_quarters/north/q1
	name = "OB 1B Crew Quarters North A"
/area/outreach/outpost/crew_quarters/north/q2
	name = "OB 1B Crew Quarters North B"
/area/outreach/outpost/crew_quarters/north/q3
	name = "OB 1B Crew Quarters North C"
/area/outreach/outpost/crew_quarters/north/q4
	name = "OB 1B Crew Quarters North D"
/area/outreach/outpost/crew_quarters/north/q5
	name = "OB 1B Crew Quarters North E"
/area/outreach/outpost/crew_quarters/north/q6
	name = "OB 1B Crew Quarters North F"
/area/outreach/outpost/crew_quarters/north/q7
	name = "OB 1B Crew Quarters North G"

/area/outreach/outpost/crew_quarters/south/q1
	name = "OB 1B Crew Quarters South A"
/area/outreach/outpost/crew_quarters/south/q2
	name = "OB 1B Crew Quarters South B"
/area/outreach/outpost/crew_quarters/south/q3
	name = "OB 1B Crew Quarters South C"
/area/outreach/outpost/crew_quarters/south/q4
	name = "OB 1B Crew Quarters South D"
/area/outreach/outpost/crew_quarters/south/q5
	name = "OB 1B Crew Quarters South E"
/area/outreach/outpost/crew_quarters/south/q6
	name = "OB 1B Crew Quarters South F"
/area/outreach/outpost/crew_quarters/south/q7
	name = "OB 1B Crew Quarters South G"

///////////////////////////////////////////////////
//Lockers
///////////////////////////////////////////////////
/area/outreach/outpost/lockers
	icon_state = "locker"
/area/outreach/outpost/lockers/north
	name = "OB 1B North Lockers"
/area/outreach/outpost/lockers/south
	name = "OB 1B South Lockers"

///////////////////////////////////////////////////
//Hangars
///////////////////////////////////////////////////
/area/outreach/outpost/hangar
	icon_state = "hangar"
/area/outreach/outpost/hangar/south
	name = "OB GF South Maintenance Hangar"
/area/outreach/outpost/hangar/north
	name = "OB GF North Maintenance Hangar"

///////////////////////////////////////////////////
//Vacant
///////////////////////////////////////////////////
/area/outreach/outpost/vacant
	name = "OB Vacant"
	icon_state = "red2"

///////////////////////////////////////////////////
//Unit Test Areas
///////////////////////////////////////////////////
//Prevents unit tests from complaining about vents/scrubbers/etc
/area/outreach/outpost/ext_vents
	icon_state = "blue-red-d"
/area/outreach/outpost/ext_vents/b2
	name = "Outreach 2B Airlock Vents"
/area/outreach/outpost/ext_vents/b1/east
	name = "Outreach 1B East Airlock Vents"
/area/outreach/outpost/ext_vents/b1/west
	name = "Outreach 1B West Airlock Vents"
/area/outreach/outpost/ext_vents/b1/north
	name = "Outreach 1B North Airlock Vents"
/area/outreach/outpost/ext_vents/b1/south
	name = "Outreach 1B South Airlock Vents"
/area/outreach/outpost/ext_vents/ground
	name = "Outreach GF Airlock Vents"
/area/outreach/outpost/ext_vents/f1
	name = "Outreach 1F Airlock Vents"


///////////////////////////////////////////////////
//Elevators
///////////////////////////////////////////////////
/area/turbolift/outreach_b2
	name = "OB Elevator 2nd Basement"
/area/turbolift/outreach_b1
	name = "OB Elevator 1st Basement"
/area/turbolift/outreach_ground_floor
	name = "OB Elevator Ground Floor"
/area/turbolift/outreach_f1
	name = "OB Elevator 1st Floor"

#define ADMIN_PROTECTED_NET_GROUP "custodians"

////////////////////////////////////////////////////////////////////////
// Wired airlock sensor
////////////////////////////////////////////////////////////////////////
/obj/machinery/airlock_sensor/wired
	power_channel = LOCAL
	uncreated_component_parts = list(
		/obj/item/stock_parts/power/terminal,
		/obj/item/stock_parts/radio/transmitter/basic/buildable
	)
	stock_part_presets = list(
		/decl/stock_part_preset/terminal_setup = 1,
		/decl/stock_part_preset/radio/basic_transmitter/airlock_sensor = 1
	)

////////////////////////////////////////////////////////////////////////
// Wired airlock button
////////////////////////////////////////////////////////////////////////
/obj/machinery/button/access/wired
	power_channel = LOCAL
	uncreated_component_parts = list(
		/obj/item/stock_parts/power/terminal,
		/obj/item/stock_parts/radio/transmitter/on_event/buildable,
	)
	stock_part_presets = list(
		/decl/stock_part_preset/terminal_setup = 1,
		/decl/stock_part_preset/radio/event_transmitter/access_button = 1,
	)

/obj/machinery/button/access/wired/interior
	command = "cycle_interior"

/obj/machinery/button/access/wired/exterior
	command = "cycle_exterior"

////////////////////////////////////////////////////////////////////////
// Airlock Door
////////////////////////////////////////////////////////////////////////
/obj/machinery/door/airlock/external/glass/bolted/airlock

/obj/machinery/door/airlock/external/glass/bolted_open/airlock
	stock_part_presets = list(
		/decl/stock_part_preset/radio/receiver/airlock/external_air = 1,
		/decl/stock_part_preset/radio/event_transmitter/airlock/external_air = 1
	)

////////////////////////////////////////////////////////////////////////
// Airlock canister
////////////////////////////////////////////////////////////////////////
/obj/machinery/portable_atmospherics/canister/airlock/outreach
	start_pressure = 3 * ONE_ATMOSPHERE

/obj/machinery/portable_atmospherics/canister/airlock/outreach/Initialize()
	. = ..()
	var/list/ratios = OutreachAtmosRatios()
	for(var/gas in ratios)
		air_contents.adjust_gas(gas, ratios[gas] * MolesForPressure())
	queue_icon_update()

/obj/machinery/atmospherics/unary/tank/air/airlock
	name = "Pressure Tank (Air)"
	icon_state = "air"
	start_pressure = ONE_ATMOSPHERE / 2
	filling = list(/decl/material/gas/oxygen = O2STANDARD, /decl/material/gas/nitrogen = N2STANDARD)

////////////////////////////////////////////////////////////////////////
// Exterior lights
////////////////////////////////////////////////////////////////////////
/obj/machinery/light/wired
	power_channel = LOCAL
	uncreated_component_parts = list(
		/obj/item/stock_parts/power/terminal,
	)
	stock_part_presets = list(/decl/stock_part_preset/terminal_setup)

/obj/machinery/light/small/wired
	power_channel = LOCAL
	uncreated_component_parts = list(
		/obj/item/stock_parts/power/terminal,
	)
	stock_part_presets = list(/decl/stock_part_preset/terminal_setup)

/obj/structure/door/osmium
	material = /decl/material/solid/metal/osmium


////////////////////////////////////////////////////////////////////////
// Buttons
////////////////////////////////////////////////////////////////////////
/obj/machinery/button/blast_door/wired
	stock_part_presets = list(
		/decl/stock_part_preset/radio/event_transmitter/blast_door_button = 1,
		/decl/stock_part_preset/radio/receiver/blast_door_button = 1,
		/decl/stock_part_preset/terminal_setup = 1,
	)
	uncreated_component_parts = list(
		/obj/item/stock_parts/power/terminal,
		/obj/item/stock_parts/radio/transmitter/on_event/buildable,
		/obj/item/stock_parts/radio/receiver/buildable
	)

////////////////////////////////////////////////////////////////////////
// High volume air vent
////////////////////////////////////////////////////////////////////////
/obj/machinery/atmospherics/unary/vent_pump/high_volume/airlock
	stock_part_presets = list(
		/decl/stock_part_preset/radio/receiver/vent_pump/airlock = 1,
		/decl/stock_part_preset/radio/event_transmitter/vent_pump/airlock = 1
	)

////////////////////////////////////////////////////////////////////////
// Network 
////////////////////////////////////////////////////////////////////////
/obj/machinery/internet_uplink/outreach
	initial_id_tag     = "ob_uplink"
	overmap_range      = 1
	restrict_networks  = TRUE
	permitted_networks = list("outnet")

/obj/machinery/computer/internet_uplink/outreach
	initial_id_tag = "ob_uplink"

/obj/machinery/network/area_controller/outreach
	initial_network_id = "outnet"
	use_power = POWER_USE_ACTIVE
	uncreated_component_parts = list(
		/obj/item/stock_parts/smes_coil = 5,
	)
	var/list/area_names = list(
		"OB 1B Cyrogenic Storage",
	)

/obj/machinery/network/area_controller/outreach/Initialize()
	. = ..()
	//Thanks nata :c
	for(var/area/A in world)
		if(A.name in area_names)
			add_protected_area(A)

/obj/machinery/network/area_controller/outreach/proc/add_protected_area(var/area/A)
	var/datum/extension/network_device/D = get_extension(src, /datum/extension/network_device)
	add_area(A)
	owned_areas[A] |= "[ADMIN_PROTECTED_NET_GROUP].[D.network_id]"
	update_protected_count()
	recalculate_power()

/obj/machinery/network/acl/outreach
	initial_network_id = "outnet"
	preset_groups = list(ADMIN_PROTECTED_NET_GROUP = list())

/obj/machinery/network/modem/outreach
	initial_network_id = "outnet"

/obj/machinery/network/mainframe/files/outreach
	initial_network_id = "outnet"

/obj/machinery/network/mainframe/account/outreach
	initial_network_id = "outnet"

/obj/machinery/network/mainframe/logs/outreach
	initial_network_id = "outnet"

/obj/machinery/network/mainframe/records/outreach
	initial_network_id = "outnet"

/obj/machinery/network/mainframe/software/outreach
	initial_network_id = "outnet"

////////////////////////////////////////////////////////////////////////
// Telecomms
////////////////////////////////////////////////////////////////////////
/obj/machinery/telecomms/bus/preset_one/outreach
	id = "ob_bus"
	network = "outcom"
	freq_listening = list()
	autolinkers = list("ob_processor","ob_tcomm_server","ob_hub")

/obj/machinery/telecomms/processor/preset_one/outreach
	id = "ob_processor"
	network = "outcom"
	autolinkers = list("ob_processor","ob_hub")

/obj/machinery/telecomms/server/presets/outreach
	id = "ob_tcomm_server"
	freq_listening = list()
	channel_tags = list(
		list(SCI_FREQ,  "Science",       COMMS_COLOR_SCIENCE),
		list(MED_FREQ,  "Medical",       COMMS_COLOR_MEDICAL),
		list(SUP_FREQ,  "Supply",        COMMS_COLOR_SUPPLY),
		list(SRV_FREQ,  "Service",       COMMS_COLOR_SERVICE),
		list(PUB_FREQ,  "Common",        COMMS_COLOR_COMMON),
		list(AI_FREQ,   "AI Private",    COMMS_COLOR_AI),
		list(ENT_FREQ,  "Entertainment", COMMS_COLOR_ENTERTAIN),
		list(COMM_FREQ, "Command",       COMMS_COLOR_COMMAND),
		list(ENG_FREQ,  "Engineering",   COMMS_COLOR_ENGINEER),
		list(SEC_FREQ,  "Security",      COMMS_COLOR_SECURITY)
		)
	autolinkers = list("ob_tcomm_server","ob_bus")

/obj/machinery/telecomms/hub/preset/outreach
	id = "ob_hub"
	network = "outcom"
	autolinkers = list("ob_hub","ob_receiver", "ob_broadcaster")

#undef ADMIN_PROTECTED_NET_GROUP
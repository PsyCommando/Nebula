
//Wired airlock sensor
/obj/machinery/airlock_sensor/wired
	power_channel = LOCAL
	uncreated_component_parts = list(
		/obj/item/stock_parts/power/terminal/buildable,
		/obj/item/stock_parts/radio/transmitter/basic/buildable
	)
	stock_part_presets = list(/decl/stock_part_preset/terminal_setup)

//Wired airlock button
/obj/machinery/button/access/wired
	power_channel = LOCAL
	uncreated_component_parts = list(
		/obj/item/stock_parts/power/terminal/buildable,
		/obj/item/stock_parts/radio/transmitter/basic/buildable
	)
	stock_part_presets = list(/decl/stock_part_preset/terminal_setup)

/obj/machinery/button/access/wired/interior
	command = "cycle_interior"

/obj/machinery/button/access/wired/exterior
	command = "cycle_exterior"

//Airlock canister
/obj/machinery/portable_atmospherics/canister/airlock/outreach
	start_pressure = 3 * ONE_ATMOSPHERE

/obj/machinery/portable_atmospherics/canister/airlock/outreach/Initialize()
	. = ..()
	var/list/ratios = OutreachAtmosRatios()
	for(var/gas in ratios)
		air_contents.adjust_gas(gas, ratios[gas] * MolesForPressure())
	queue_icon_update()

//Exterior lights
/obj/machinery/light/wired
	power_channel = LOCAL
	uncreated_component_parts = list(
		/obj/item/stock_parts/power/terminal/buildable,
	)
	stock_part_presets = list(/decl/stock_part_preset/terminal_setup)

/obj/machinery/light/small/wired
	power_channel = LOCAL
	uncreated_component_parts = list(
		/obj/item/stock_parts/power/terminal/buildable,
	)
	stock_part_presets = list(/decl/stock_part_preset/terminal_setup)
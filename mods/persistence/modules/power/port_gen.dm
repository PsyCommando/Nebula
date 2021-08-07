/obj/machinery/power/port_gen/pacman
	time_per_sheet = 480 // Persistent generators eat slower.

/obj/machinery/power/port_gen/pacman/super
	time_per_sheet = 2880

/obj/machinery/power/port_gen/pacman/super/potato
	time_per_sheet = 2000
/obj/machinery/power/port_gen/pacman/super/potato/RefreshParts()
	..()
	reagents.maximum_volume = 50 * Clamp(total_component_rating_of_type(/obj/item/stock_parts/matter_bin), 0, 5)

/obj/machinery/power/port_gen/pacman/mrs
	time_per_sheet = 2880
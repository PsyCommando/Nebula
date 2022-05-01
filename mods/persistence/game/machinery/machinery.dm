/obj/machinery/after_deserialize()
	initial_access = list() // Remove initial_access so that access isn't wiped on load.
	. = ..()

/obj/machinery/Initialize(mapload, d, populate_parts)
	// Initialize expects that construct_state will be a path.
	if(istype(construct_state))
		construct_state = construct_state.type
	. = ..(mapload, d, persistent_id? FALSE : populate_parts)

/obj/machinery/populate_parts(full_populate)
	if(!persistent_id) 
		return ..()
	deserialize_init_parts()
		
/obj/machinery/proc/deserialize_init_parts()
	var/list/old_components = component_parts
	component_parts = null
	power_components.Cut()
	//Reinstall loaded parts
	for(var/obj/item/stock_parts/I in old_components)
		install_component(I, FALSE, FALSE)
/obj/machinery/network/before_save()
	. = ..()
	var/datum/extension/network_device/D = get_extension(src, /datum/extension/network_device)
	CUSTOM_SV_LIST(\
	"saved_address"       = D.address,\
	"saved_network_tag"   = D.network_tag,\
	"saved_network_id"  = D.network_id,\
	"saved_network_key" = D.key\
	)

/obj/machinery/network/Initialize()
	if(persistent_id)
		var/saved_network_id = LOAD_CUSTOM_SV("saved_network_id")
		var/saved_network_key = LOAD_CUSTOM_SV("saved_network_key")
		if(length(saved_network_id))
			initial_network_id = saved_network_id
		if(length(saved_network_key))
			initial_network_key = saved_network_key
		CLEAR_SV("saved_network_id")
		CLEAR_SV("saved_network_key")

	. = ..()

	if(persistent_id)
		var/datum/extension/network_device/D = get_extension(src, /datum/extension/network_device)
		var/saved_address = LOAD_CUSTOM_SV("saved_address")
		var/saved_network = LOAD_CUSTOM_SV("saved_network_tag")
		if(saved_address)
			D.address = saved_address
		if(saved_network_tag)
			D.network_tag = saved_network_tag
		CLEAR_SV("saved_address")
		CLEAR_SV("saved_network_tag")

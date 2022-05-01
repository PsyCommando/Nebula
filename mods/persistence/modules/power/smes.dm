/obj/machinery/power/smes/buildable/after_deserialize()
	//Need to keep charge in a temporary var, because re-installing parts is gonna mess everything up during init
	CUSTOM_SV_LIST(\
	"charge" = charge,\
	"input_level" = input_level,\
	"output_level" = output_level,\
	"input_attempt" = input_attempt,\
	"output_attempt" = output_attempt,\
	)
	. = ..()

/obj/machinery/power/smes/buildable/Initialize()
	. = ..()
	LATE_INIT_IF_SAVED

/obj/machinery/power/smes/buildable/populate_parts()
	//Prevent smes from creating extra power terminals
	if(!persistent_id)
		return ..()
	deserialize_init_parts()

/obj/machinery/power/smes/buildable/LateInitialize()
	. = ..()
	//Put back the loaded values after part setup
	if(persistent_id)
		charge         = between(0, LOAD_CUSTOM_SV("charge"), capacity)
		input_level    = between(0, LOAD_CUSTOM_SV("input_level"),  input_level_max)
		output_level   = between(0, LOAD_CUSTOM_SV("output_level"), output_level_max)
		input_attempt  = LOAD_CUSTOM_SV("input_attempt")
		output_attempt = LOAD_CUSTOM_SV("output_attempt")
		CLEAR_SV("charge")
		CLEAR_SV("input_level")
		CLEAR_SV("output_level")
		CLEAR_SV("input_attempt")
		CLEAR_SV("output_attempt")

/obj/machinery/power/smes/buildable/RefreshParts()
	if(charge)
		log_debug("[src] ran RefreshParts with a non zero charge([charge]) set!")
	else
		log_debug("[src] ran RefreshParts!")
	. = ..()

//Preset override
/obj/machinery/power/smes/buildable/preset/after_deserialize()
	. = ..()
	//Make sure we don't force any of these
	_fully_charged = FALSE
	_input_maxed   = FALSE
	_input_on      = FALSE
	_output_maxed  = FALSE
	_output_on     = FALSE
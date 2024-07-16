/decl/serializer

/decl/serializer/proc/CanSerializeValue(value_ptr, value_holder = null)
/decl/serializer/proc/SerializeValue(value_ptr, value_holder = null)

/datum/data_serializer
	var/tmp/list/idx_to_ref
	var/tmp/list/ref_to_instances
	var/decl/serializer/output_writer

/datum/data_deserializer
	///DB index to pointer to variable/instance
	var/tmp/list/idx_to_var
	var/tmp/list/var_to_idx
	var/input_parser


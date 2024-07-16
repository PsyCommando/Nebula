/mob/living/carbon/human/should_save()
	. = ..()
	// We don't save characters who are in chargen
	if(mind?.is_chargen_in_progress())
		return FALSE


// /data/ files store data in string format.
// They don't contain other logic for now.
/datum/computer_file/data
	var/stored_data = "" 			// Stored data in string format.
	filetype = "DAT"
	var/block_size = 2000			// Turns out, text is small.
	var/do_not_edit = 0				// Whether the user will be reminded that the file probably shouldn't be edited.
	var/read_only = 0				// Protects files that should never be edited by the user due to special properties.

SAVED_FLATTEN(/datum/computer_file/data)
SAVED_VAR(/datum/computer_file/data, stored_data)
SAVED_VAR(/datum/computer_file/data, size)
SAVED_VAR(/datum/computer_file/data, block_size)

/datum/computer_file/data/PopulateClone(datum/computer_file/data/clone)
	clone = ..()
	clone.stored_data = stored_data
	return clone

// Calculates file size from amount of characters in saved string
/datum/computer_file/data/proc/calculate_size()
	size = max(1, round(length(stored_data) / block_size))

/datum/computer_file/data/proc/generate_file_data(var/mob/user)
	return digitalPencode2html(stored_data)

/datum/computer_file/data/logfile
	filetype = "LOG"

/datum/computer_file/data/text
	filetype = "TXT"

/datum/computer_file/data/bodyscan
	filetype = "BSC"
	read_only = 1
	papertype = /obj/item/paper/bodyscan

/datum/computer_file/data/bodyscan/generate_file_data(var/mob/user)
	return display_medical_data(metadata, user.get_skill_value(SKILL_MEDICAL), TRUE)
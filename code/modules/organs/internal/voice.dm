/obj/item/organ/internal/voicebox
	name = "vocal chords"
	icon_state = "voicebox"
	parent_organ = BP_CHEST
	organ_tag = BP_VOICE
	var/list/assists_languages

SAVED_VAR(/obj/item/organ/internal/voicebox, assists_languages)

/obj/item/organ/internal/voicebox/Initialize()
	. = ..()
	var/list/language_datums = list()
	if(LAZYLEN(assists_languages))
		for(var/L in assists_languages)
			if(!ispath(L))
				continue
			var/lang = GET_DECL(L)
			if(lang) language_datums[lang] = TRUE
	assists_languages = language_datums

/obj/item/organ/internal/voicebox/get_mechanical_assisted_descriptor()
	return "surgically altered [name]"

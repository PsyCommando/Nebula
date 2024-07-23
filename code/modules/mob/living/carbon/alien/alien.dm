/mob/living/carbon/alien
	name = "alien"
	desc = "What IS that?"
	pass_flags = PASS_FLAG_TABLE
	max_health = 100
	mob_size = MOB_SIZE_TINY
	mob_sort_value = 8
	var/dead_icon
	var/language
	var/death_msg = "lets out a waning guttural screech, green blood bubbling from its maw."
	var/instance_num

/mob/living/carbon/alien/get_death_message()
	return death_msg || ..()

/mob/living/carbon/alien/Initialize()
	verbs += /mob/living/proc/ventcrawl
	verbs += /mob/living/proc/hide

	instance_num = rand(1, 1000)
	name = "[initial(name)] ([instance_num])"
	real_name = name
	update_icon()

	if(language)
		add_language(language)

	gender = NEUTER
	. = ..()

/mob/living/carbon/alien/get_blood_color()
	return COLOR_LIME

/mob/living/carbon/alien/restrained()
	return 0

/mob/living/carbon/alien/get_admin_job_string()
	return "Alien"

/mob/living/carbon/alien/get_default_emotes()
	var/static/list/default_emotes = list(
		/decl/emote/visible,
		/decl/emote/visible/scratch,
		/decl/emote/visible/drool,
		/decl/emote/visible/nod,
		/decl/emote/visible/sway,
		/decl/emote/visible/sulk,
		/decl/emote/visible/twitch,
		/decl/emote/visible/dance,
		/decl/emote/visible/roll,
		/decl/emote/visible/shake,
		/decl/emote/visible/jump,
		/decl/emote/visible/shiver,
		/decl/emote/visible/collapse,
		/decl/emote/visible/spin,
		/decl/emote/visible/sidestep,
		/decl/emote/audible/hiss,
		/decl/emote/audible/burp,
		/decl/emote/audible/deathgasp_alien,
		/decl/emote/audible/whimper,
		/decl/emote/audible/gasp,
		/decl/emote/audible/scretch,
		/decl/emote/audible/choke,
		/decl/emote/audible/moan,
		/decl/emote/audible/gnarl
	)
	return default_emotes

/datum/ailment/fault/locking_thumbs
	name = "self-locking thumbs"
	diagnosis_string = "$USER_HIS$ $ORGAN$ makes a grinding sound when you move the joints."
	applies_to_organ = list(
		BP_L_ARM,
		BP_L_HAND, 
		BP_R_ARM, 
		BP_R_HAND, 
		BP_AUGMENT_R_ARM, 
		BP_AUGMENT_L_ARM, 
		BP_AUGMENT_R_HAND, 
		BP_AUGMENT_L_HAND
	)

/datum/ailment/fault/locking_thumbs/on_ailment_event()
	var/slot = null
	switch (organ.organ_tag)
		if (BP_L_ARM, BP_L_HAND, BP_AUGMENT_L_HAND, BP_AUGMENT_L_ARM)
			slot = BP_L_HAND
		if (BP_R_ARM, BP_R_HAND, BP_AUGMENT_R_HAND, BP_AUGMENT_R_ARM)
			slot = BP_R_HAND
	var/obj/item/thing = organ.owner.get_equipped_item(slot)
	if(thing && organ.owner.unEquip(thing))
		var/decl/pronouns/G = organ.owner.get_pronouns()
		organ.owner.visible_message( \
			"<B>\The [organ.owner]</B> drops what [G.he] [G.is] holding, [G.his] [organ.name] malfunctioning!", \
			"Your [organ.name] malfunctions, causing you to drop what you were holding.")

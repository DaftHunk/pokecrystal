	object_const_def
	const MAHOGANYMART1F_PHARMACIST
	const MAHOGANYMART1F_BLACK_BELT
	const MAHOGANYMART1F_LANCE
	const MAHOGANYMART1F_DRAGONITE
	const MAHOGANYMART1F_GRANNY

MahoganyMart1F_MapScripts:
	def_scene_scripts
	scene_script MahoganyMart1FNoopScene,                SCENE_MAHOGANYMART1F_NOOP
	scene_script MahoganyMart1FLanceUncoversStairsScene, SCENE_MAHOGANYMART1F_LANCE_UNCOVERS_STAIRS

	def_callbacks
	callback MAPCALLBACK_TILES, MahoganyMart1FStaircaseCallback

MahoganyMart1FNoopScene:
	end

MahoganyMart1FLanceUncoversStairsScene:
	sdefer MahoganyMart1FLanceUncoversStaircaseScript
	end

MahoganyMart1FStaircaseCallback:
	checkevent EVENT_UNCOVERED_STAIRCASE_IN_MAHOGANY_MART
	iftrue .ShowStairs
	endcallback

.ShowStairs:
	changeblock 6, 2, $1e ; stairs
	endcallback

MahoganyMart1FPharmacistScript:
	faceplayer
	opentext
	checkevent EVENT_DECIDED_TO_HELP_LANCE
	iftrue .LanceEntered
	pokemart MARTTYPE_STANDARD, MART_MAHOGANY_1
	closetext
	end

.LanceEntered:
	writetext MahoganyMart1FPharmacistText_LanceEntered
	waitbutton
	closetext
	end

MahoganyMart1FBlackBeltScript:
	faceplayer
	opentext
	checkevent EVENT_DECIDED_TO_HELP_LANCE
	iftrue .LanceEntered
	writetext MahoganyMart1FBlackBeltText
	waitbutton
	closetext
	end

.LanceEntered:
	writetext MahoganyMart1FBlackBeltText_LanceEntered
	waitbutton
	closetext
	end

MahoganyMart1FLanceUncoversStaircaseScript:
	pause 15
	opentext
	writetext MahoganyMart1FLanceDragoniteHyperBeamText
	pause 15
	closetext
	playsound SFX_TACKLE
	applymovement MAHOGANYMART1F_DRAGONITE, MahoganyMart1FDragoniteTackleMovement
	applymovement MAHOGANYMART1F_BLACK_BELT, MahoganyMart1FBlackBeltKnockedBackMovement
	pause 15
	disappear MAHOGANYMART1F_DRAGONITE
	pause 15
	applymovement MAHOGANYMART1F_LANCE, MahoganyMart1FLanceApproachPlayerMovement
	opentext
	writetext MahoganyMart1FLanceRadioText
	waitbutton
	closetext
	follow MAHOGANYMART1F_LANCE, PLAYER
	applymovement MAHOGANYMART1F_LANCE, MahoganyMart1FLanceApproachPharmacistMovement
	applymovement MAHOGANYMART1F_PHARMACIST, MahoganyMart1FPharmacistShovedAsideMovement
	applymovement MAHOGANYMART1F_LANCE, MahoganyMart1FLanceApproachHiddenStairsMovement
	stopfollow
	opentext
	writetext MahoganyMart1FLanceStairsText
	waitbutton
	showemote EMOTE_SHOCK, MAHOGANYMART1F_PHARMACIST, 10
	playsound SFX_FAINT
	changeblock 6, 2, $1e ; stairs
	refreshmap
	closetext
	setevent EVENT_UNCOVERED_STAIRCASE_IN_MAHOGANY_MART
	turnobject MAHOGANYMART1F_LANCE, LEFT
	opentext
	writetext MahoganyMart1FLanceSplitUpText
	waitbutton
	closetext
	applymovement MAHOGANYMART1F_LANCE, MahoganyMart1FLanceGoDownStairsMovement
	playsound SFX_EXIT_BUILDING
	disappear MAHOGANYMART1F_LANCE
	setscene SCENE_MAHOGANYMART1F_NOOP
	waitsfx
	end

MahoganyMart1FGrannyScript:
	faceplayer
	opentext
	pokemart MARTTYPE_STANDARD, MART_MAHOGANY_2
	closetext
	end

MahoganyMart1FDragoniteTackleMovement:
	fix_facing
	big_step LEFT
	big_step RIGHT
	remove_fixed_facing
	step_end

MahoganyMart1FBlackBeltKnockedBackMovement:
	fix_facing
	big_step LEFT
	remove_fixed_facing
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	step_end

MahoganyMart1FPharmacistShovedAsideMovement:
	fix_facing
	big_step LEFT
	remove_fixed_facing
	step_end

MahoganyMart1FLanceApproachPlayerMovement:
	slow_step LEFT
	turn_head DOWN
	step_end

MahoganyMart1FLanceApproachPharmacistMovement:
	slow_step RIGHT
	slow_step UP
	slow_step UP
	step_end

MahoganyMart1FLanceApproachHiddenStairsMovement:
	slow_step UP
	slow_step RIGHT
	slow_step RIGHT
	step_end

MahoganyMart1FLanceGoDownStairsMovement:
	slow_step RIGHT
	step_end

MahoganyMart1FRageCandyBarText: ; unreferenced
	text "Salut, toi!"

	para "Ca te dirait du"
	line "Bonbon Rage?"

	para "C'est cool d'en"
	line "manger à Acajou!"
	done

MahoganyMart1FPharmacistText_LanceEntered:
	text "Graaah... Tu as"
	line "trouvé l'escalier"
	cont "secret!"
	done

MahoganyMart1FBlackBeltText:
	text "Hé hé!! Ca marche"
	line "pas mal pour moi!"
	cont "Hé hé!"

	para "Les Magicarpe ne"
	line "valent rien mais"

	para "les Léviator rap-"
	line "portent gros!"
	done

MahoganyMart1FBlackBeltText_LanceEntered:
	text "Gueuhhh..."

	para "Les #mon dragon"
	line "de ce type sont"
	cont "super forts..."
	done

MahoganyMart1FLanceDragoniteHyperBeamText:
	text "Peter: Dracolosse,"
	line "Ultralaser."
	done

MahoganyMart1FLanceRadioText:
	text "Tu en as mis du"
	line "temps, <PLAY_G>!"

	para "Comme je le pen-"
	line "sais, cet étrange"

	para "signal radio vient"
	line "d'ici."
	done

MahoganyMart1FLanceStairsText:
	text "Les escaliers sont"
	line "par ici."
	done

MahoganyMart1FLanceSplitUpText:
	text "Peter: <PLAY_G>,"
	line "nous ferions mieux"

	para "de nous séparer."
	line "Je passe en"
	cont "premier."
	done

MahoganyMart1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, MAHOGANY_TOWN, 1
	warp_event  4,  7, MAHOGANY_TOWN, 1
	warp_event  7,  3, TEAM_ROCKET_BASE_B1F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  4,  3, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyMart1FPharmacistScript, EVENT_TEAM_ROCKET_BASE_POPULATION
	object_event  1,  6, SPRITE_BLACK_BELT, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyMart1FBlackBeltScript, EVENT_TEAM_ROCKET_BASE_POPULATION
	object_event  4,  6, SPRITE_LANCE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_MAHOGANY_MART_LANCE_AND_DRAGONITE
	object_event  3,  6, SPRITE_DRAGON, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_MAHOGANY_MART_LANCE_AND_DRAGONITE
	object_event  1,  3, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyMart1FGrannyScript, EVENT_MAHOGANY_MART_OWNERS

	object_const_def
	const SILVERCAVEPOKECENTER1F_NURSE
	const SILVERCAVEPOKECENTER1F_GRANNY

SilverCavePokecenter1F_MapScripts:
	def_scene_scripts

	def_callbacks

SilverCavePokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

SilverCavePokecenter1FGrannyScript:
	jumptextfaceplayer SilverCavePokecenter1FGrannyText

SilverCavePokecenter1FGrannyText:
	text "Les dresseurs qui"
	line "recherchent le"

	para "pouvoir grimpent"
	line "le Mont Argent"
	cont "malgré ses nom-"
	cont "breux dangers."

	para "Avec leurs"
	line "#mon les plus"

	para "forts, ils pensent"
	line "pouvoir aller"
	cont "partout..."
	done

SilverCavePokecenter1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, SILVER_CAVE_OUTSIDE, 1
	warp_event  4,  7, SILVER_CAVE_OUTSIDE, 1
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SilverCavePokecenter1FNurseScript, -1
	object_event  1,  5, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_LEFT, 2, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SilverCavePokecenter1FGrannyScript, -1

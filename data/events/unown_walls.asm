; strings correspond to UNOWNWORDS_* constants (see constants/script_constants.asm)
DEF UNOWNWORD_{d:UNOWNWORDS_ESCAPE} EQUS "Sortie"
DEF UNOWNWORD_{d:UNOWNWORDS_LIGHT}  EQUS "Lumière"
DEF UNOWNWORD_{d:UNOWNWORDS_WATER}  EQUS "-Eau-"
DEF UNOWNWORD_{d:UNOWNWORDS_HO_OH}  EQUS "Ho-oh"

UnownWalls:
; entries correspond to UNOWNWORDS_* constants
	list_start
	for x, NUM_UNOWN_WALLS
		li "{UNOWNWORD_{d:x}}"
	endr
	assert_list_length NUM_UNOWN_WALLS

MenuHeaders_UnownWalls:
; entries correspond to UNOWNWORDS_* constants
	table_width UNOWN_WALL_MENU_HEADER_SIZE
	for x, NUM_UNOWN_WALLS
		DEF n = CHARLEN("{UNOWNWORD_{d:x}}")
		db MENU_BACKUP_TILES ; flags
		menu_coords 9 - n, 4, 10 + n, 9
	endr
	assert_table_length NUM_UNOWN_WALLS

ChrisNameMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 10, TEXTBOX_Y - 1
	dw .MaleNames
	db 1 ; default option
	db 0 ; ???

.MaleNames:
	db STATICMENU_CURSOR | STATICMENU_PLACE_TITLE | STATICMENU_DISABLE_B ; flags
	db 5 ; items
	db "Nom:@"
MalePlayerNameArray:
	db "Chris@"
	db "Benji@"
	db "Nicolas@"
	db "Jean@"
	db 2 ; title indent
	db " Nom @" ; title

KrisNameMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 10, TEXTBOX_Y - 1
	dw .FemaleNames
	db 1 ; default option
	db 0 ; ???

.FemaleNames:
	db STATICMENU_CURSOR | STATICMENU_PLACE_TITLE | STATICMENU_DISABLE_B ; flags
	db 5 ; items
	db "Nom:@"
FemalePlayerNameArray:
	db "Christy@"
	db "Sophie@"
	db "Nicole@"
	db "Jeanne@"
	db 2 ; title indent
	db " Nom @" ; title

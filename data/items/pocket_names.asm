ItemPocketNames:
; entries correspond to item type constants
	table_width 2
	dw .Item
	dw .Key
	dw .Ball
	dw .TM
	assert_table_length NUM_ITEM_TYPES

.Item: db "Poche Objets@"
.Key:  db "Poche Rares@"
.Ball: db "Poche Balls@"
.TM:   db "Poche CT@"

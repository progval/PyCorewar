;redcode
;name Fairy1
;author Keiji-Kawashima
;assert 1
         JMP              ORIG
BOMB     SPL             -1
CYCLE    DAT              #509
ROUND    DAT              #16
ORIG     ADD   # 51,      SIGHT
LOOP     ADD   # 16,      SIGHT
         MOV     BOMB,  @ SIGHT
         DJN     LOOP,    CYCLE
         MOV   # 509,     CYCLE
         DJN     ORIG,    ROUND
         MOV   #-64,      SIGHT
         MOV     CYCLE,   BOMB
         JMP     ORIG
SIGHT    DAT    #-64
         END     ORIG

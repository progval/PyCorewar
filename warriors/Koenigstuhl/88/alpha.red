;redcode
;name Alpha
;strategy a wimpy varient of dwarf
;assert 1
ALPHA   MOV     BOMB,   BOMB
        ADD     #3,     ALPHA
        JMP     ALPHA
BOMB    DAT             #0
        END     ALPHA

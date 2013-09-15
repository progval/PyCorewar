;redcode
;name Dumbo
;author Corey Lynn Nelson
;assert 1
DUMBO   MOV     BOMB,   BOMB
        ADD     #2,     DUMBO
        JMP     DUMBO
BOMB    DAT             #0
        END     DUMBO

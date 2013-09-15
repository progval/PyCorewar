;redcode
;name Bravo
;strategy a speedy, but larger varient of mini-dwarf
;assert 1
BRAVO   MOV     BOMB,   <PTR
        MOV     BOMB,   <PTR
        MOV     BOMB,   <PTR
        MOV     BOMB,   <PTR
        JMP     BRAVO
PTR     DAT             #BRAVO
BOMB    DAT             #BRAVO
        END     BRAVO

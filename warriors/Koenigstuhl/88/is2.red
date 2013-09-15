;redcode
;name Imp Shield 2
;author Chip Wendell
;strategy From TCWN June 1987
;assert 1

TARGET  DAT     #0
        DAT     #0
IS2     JMZ     0      ,TARGET
        MOV     BOMB   ,TARGET+1
        MOV     BOMB   ,TARGET
        MOV     BOMB   ,TARGET+1
        JMP     IS2
BOMB    DAT     #0
        END     IS2

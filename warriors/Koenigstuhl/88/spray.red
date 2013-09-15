;redcode
;name Spray
;author Nicola Baldini
;assert 1

SOURCE  DAT     #0
START   MOV     #(TARGET-SOURCE),SOURCE
LOOP    MOV     @SOURCE,<TARGET
        DJN     LOOP,SOURCE
        SPL     @TARGET
        DJN     0,<-1
        JMP     -1
TARGET  DAT     #1024
        END     START

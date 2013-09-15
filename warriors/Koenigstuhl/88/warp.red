;redcode
;name Warp
;author Andrea Giotti
;assert 1

JMPHERE ADD     #1,HOWMANY
        CMP     #64,HOWMANY
        JMP     WAIT
        MOV     HOWMANY,WAIT
WAIT    SPL     JMPHERE
        JMP     WAIT
HOWMANY DAT     #0
START   MOV     #-1,BOMB
LOOP    ADD     #2,BOMB
        MOV     BOMB,<POINTER
        DJN     LOOP,POINTER
        MOV     #(JMPHERE-POINTER),POINTER
        JMP     START
BOMB    JMP     @BOMB
POINTER DAT     #JMPHERE
        END     START

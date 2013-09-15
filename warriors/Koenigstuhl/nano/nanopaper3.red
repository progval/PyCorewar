;redcode-imt2
;name Nano paper III
;author Maurice Fernández
;assert 1

STEP    EQU    17

paper   spl.b  0, STEP 
        mov.i  }-1, >-1
        spl    paper+STEP+1, <-10
        jmp    paper+1, <-10


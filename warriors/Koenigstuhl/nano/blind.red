;redcode
;name blind
;author Philip Thorne
;strategy IRCT01
;assert CORESIZE==80
;assert MAXLENGTH==5
STEP    EQU     4
bmb:    dat     #0,     #-STEP-2
scan:   sub.ab  #STEP,  -1
        jmz.f   -1,     @-2
        mov.i   bmb,    >bmb
        jmp     -1,     }bmb
    end scan

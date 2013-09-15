;redcode
;name Wisp
;author Julius Cisek
;assert 1        
STEP    equ 7308

wisp    spl 0
        add #STEP, 1
        mov wisp, 1

        dat #0

        mov 1, <-1

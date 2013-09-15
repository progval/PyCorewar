;redcode
;name Flea
;author William Hamaker
;assert 1
; Flea - a mobile warrior that only lives if it lands next to a zero
;
; It has 2 commands and 2 threads
;
start   SPL flea
flea    MOV <2, <1
        JMP @0, flea-1     ; *** "fixed" by Planar (was: JMP @0, flea)
        END start

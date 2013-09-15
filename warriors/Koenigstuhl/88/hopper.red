;redcode
;name Hopper
;author William Hamaker
;assert 1

; Hopper - a mobile warrior with 3 commands and 3 threads
;
; create and synchronize 3 program threads
start   SPL next
        JMP hopper
next    SPL hopper
; start of actual warrior
hopper  MOV #0, 3
        MOV <2, <1         ; *** "fixed" by Planar (was: MOV <2, <2)
        JMP @0, hopper
        END start

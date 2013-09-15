;redcode
;name Hopper2
;author William Hamaker
;assert 1

; Hopper2 - a mobile warrior with 4 commands and 2 threads
;
start   SPL hopper2
hopper2 MOV #0, 4
        MOV <3, <2
        MOV <2, <1
        JMP @0, hopper2
        END start

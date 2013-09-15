;redcode
;name Nothing Special - II
;author George Eadon
;strategy ~.5C SPL-bomber -> CoreClear 
;strategy Needs a better end-game...
;strategy Hacked together at the last minute from last years NSFCWT Round #9
;strategy entry...
;assert 1

STEP    EQU     5*103

        spl     0, <2668
start   SPL     0, <ptr + 1
loop    ADD     #STEP, ptr
        MOV     start-1, @1
ptr     MOV     start-1, <1
        JMP     loop, <4000
        mov     bomb, <bomb
        djn     -1, #7000
        mov     0, 1
        dat     #0, #0
        dat     #0, #0
bomb    dat     #0, #ptr+1

end     start

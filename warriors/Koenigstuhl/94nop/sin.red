;redcode
;name SIN
;author harleyQ2
;assert CORESIZE == 8000

tgt     equ -1080
size    equ 2667

boot    spl.x 1, <6000
        spl.x 1, <4000
        spl.x 1, <2000
silk    spl.x @0, tgt
        mov.i }silk, >silk
launch  spl.x 4, >imp+size*1
        spl.x 2, >imp+size*2
        jmp.x imp+size*1, <-10
        jmp.x imp+size*2, <-10
        jmp.x imp+size*0, <-10
imp     mov.i #size, *0

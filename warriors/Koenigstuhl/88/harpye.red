;redcode
;name Harpye
;author Stefan Strack
;strategy Basic vampiric capture with long fang-interval
;assert 1
dist    equ     517
prolif  equ     100

loc     dat     #0,     #0
;-------scan for non-zero addresses
start   add     #dist,  loc
        jmz     start,  @loc
;-------test if fang would land in own code
        slt     #last-loc+1, loc
        jmp     start
;-------place fang
        mov     #retard-loc, jump
        sub     loc,    jump
        mov     jump,   @loc
        jmp     start
jump    jmp     @0,     #0
;-------zero-interval separates non-essential code
        dat     #0,     #0
        dat     #0,     #0
        dat     #0,     #0
        dat     #0,     #0
        dat     #0,     #0
        dat     #0,     #0
        dat     #0,     #0
        dat     #0,     #0
        dat     #0,     #0
        dat     #0,     #0
        dat     #0,     #0
        dat     #0,     #0
        dat     #0,     #0
        dat     #0,     #0
        dat     #0,     #0
        dat     #0,     #0
        dat     #0,     #0
        dat     #0,     #0
        dat     #0,     #0
        dat     #0,     #0
        dat     #0,     #0
        dat     #0,     #0
        dat     #0,     #0
        dat     #0,     #0
        dat     #0,     #0
;-------retarder loop - captured processes land here
retard  mov     #prolif*5, cycles
split   spl     choice, <cycles
choice  slt     #prolif*4, cycles
cycles  dat     #0,     #0
last    jmp     split
        end     start

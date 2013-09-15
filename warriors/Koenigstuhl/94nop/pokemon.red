;redcode-94nop
;name Pokemon
;author Christian Schmidt
;strategy paper with imps
;strategy based on Blowrag but with new constants
;strategy a wimp is added against HSA-typ scanners
;assert 1

org pStart

pStep1  equ     2484
pStep2  equ     1256
pBomb   equ     1360
bDist   equ     (top+1441)
iStep   equ     2667

top     mov     <g3,            {g3
g3      jmp     bDist+iStep,    imp+1

s1      spl     @0,             <pStep1
        mov     }s1,            >s1
s2      spl     @0,             <pStep2
        mov     }s2,            >s2
        mov.i   #1,             <1
        spl     -2,             <pBomb
imp     mov.i   #iStep,         *0

    for 80
        dat     0,              0
    rof

wimp    jmp     #0,             #0
pStart  mov     wimp,           *1
        spl     top+3055        

        spl     1
        spl     1
        mov.i   {0,             #0

        spl     top
        mov     <g1,            {g1
g1      spl     bDist,          imp+1
g2      spl     bDist+2*iStep-7
        mov     }s1,            }g2

end


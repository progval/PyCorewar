;redcode
;author Dan Nabutovsky
;name Stamped paper
;group A
;strategy Scissor/Paper combo.
;strategy wins against papers, stones, imps.
;assert CORESIZE==8000
 
step EQU 8
cl1 EQU -600
cl2 EQU -1400

spl scis

spl 1
spl 1

mov #8,0
mov <-1,<2
mov <-2,<1
spl @0,1111
mov 2, <-1
jmz -5,-5
dat <2667, <5334
dat <2667, <5334
mov 0, <1

scis:   spl 0, cl1
        mov scis, <scis
        mov jump, @scis
        sub #step, scis
        djn -3, #(cl1-cl2)/step
        mov 0, -1
loop:   mov @15, <cl1
jump:   jmp -1

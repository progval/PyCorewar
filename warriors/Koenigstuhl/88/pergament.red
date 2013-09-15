;redcode
;author Dan Nabutovsky
;name Pergament
;group A
;strategy | Paper combined with scissors and 4 32-process spirals.
;strategy | Wins agains papers, stones, imps, and most of scissors.
;strategy | It is VERY hard to kill this program.
;assert 1
; This program wins against all Mintarjo programs except one:
;       vs Beholder's eye : 15/2/83
;       vs Medusa :         15/38/47
;       vs Paratroops :     65/1/34
;       vs Winter Werewolf: 20/4/76
;       vs Himera :          4/2/94
;       vs Sphinx 5.1 :     24/0/76 
;       vs Gamma Paper :     6/0/94

step EQU 8
cl1  EQU -600
cl2  EQU -920
d    EQU 2667

spl scis
spl spir

spl 1
spl 1
spl 8
spl 4
spl 2
jmp paps+1
jmp paps+9
spl 2
jmp paps+17
jmp paps+25
jmp 1
spl 2
jmp paps+33
jmp paps+41

paps mov #8,8
mov <-1,<2
mov <-2,<1
spl @0,1111
mov 2, <-1
jmz -5,-5
dat <2667, <5334
mov 0, <1
mov #8,8
mov <-1,<2
mov <-2,<1
spl @0,1311
mov 2, <-1
jmz -5,-5
dat <2667, <5334
mov 0, <1
mov #8,8
mov <-1,<2
mov <-2,<1
spl @0,1511
mov 2, <-1
jmz -5,-5
dat <2667, <5334
mov 0, <1
mov #8,8
mov <-1,<2
mov <-2,<1
spl @0,1711
mov 2, <-1
jmz -5,-5
dat <2667, <5334
mov 0, <1
mov #8,8
mov <-1,<2
mov <-2,<1
spl @0,1911
mov 2, <-1
jmz -5,-5
dat <2667, <5334
mov 0, <1

        dat #0

scis:   spl 0, cl1
        mov scis, <scis
        mov jump, @scis
        sub #step, scis
        djn -3, #(cl1-cl2)/step
        mov 0, -1
loop:   mov @100, <cl1
jump:   jmp -1

        dat #0
imp:    mov 0, d

i0 EQU (spir+30)
i1 EQU (i0+666)
i2 EQU (i0+1333)
i3 equ (i0+2000)

spir:   mov imp, i0
        mov imp, i1
        mov imp, i2
        mov imp, i3
        spl 1
        spl 1
        spl 1
        spl 1
        spl 1
        spl 10
        spl 5
        spl 2
        jmp @0, i0
        add #d, -1
        dat #0
        spl 2
        jmp @0, i1
        add #d, -1
        dat #0
        spl 5
        spl 2
        jmp @0, i2
        add #d, -1
        dat #0
        spl 2
        jmp @0, i3
        add #d, -1
        dat #0

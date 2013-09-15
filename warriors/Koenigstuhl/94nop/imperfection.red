;redcode-94
;name Imperfection v3.1
;author Michael Constant
;strategy  standard stone/spiral
;assert 1

DIST    equ     2500
STEP    equ     889
IMPBOOT equ     400

org     boot

foo
decoy   for 74
        spl.i   #500+(decoy*3), #decoy+1
        rof

boot    mov     stone,  stone+DIST
        mov     stone+1,stone+1+DIST
        mov     stone+2,stone+2+DIST
        mov     stone+3,stone+3+DIST
        mov     stone+4,stone+4+DIST
        mov     bar,    stone+DIST+4+76
        mov     bar,    stone+DIST+4+75

        spl     stone+DIST, <-2000
        spl     stone+DIST, <-3000

launch  mov     imp,    imp+IMPBOOT
        spl     1,      <-2000
        mov     -1,     0
        mov     -1,     0
        mov     -1,     0
        spl     1,      <-3000
        spl     1,      <-4000
        spl     2,      <3000
        jmp     @0,     imp+IMPBOOT
        add     #STEP,  -1

bar     dat     #1,     #10

stone   mov.i   <foo-DIST+31+(76*2),3-(76*2)
        spl     -1,     <-3000
        sub.f   toadd,  -2
        djn.f   -2,     <-3002
toadd   mov     -76,    >76

imp     mov.i   #0,     STEP

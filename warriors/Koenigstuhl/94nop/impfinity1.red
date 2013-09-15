;redcode-b
;name Impfinity v1
;author Planar
;strategy continuous-launching 13-point imp spiral + a few incendiary bombs
;assert CORESIZE == 8000

step    equ     3077
bstep   equ     -50
binit   equ     -200

        org     a

bomb1   spl     #6, <2667
bomb2   mov.i   -1, {-1

a       spl     #binit, }z0
b       spl     d, }z1
c       spl     f, }z2
e       spl     j, }z4
i       spl     z1, }z8
z0      jmp     imp-5, }z0
z1      jmp     imp+step-4, }z1
j       spl     z3, }z9
z2      jmp     imp+2*step-3, }z2
z3      jmp     imp+3*step-3, }z3
f       spl     l, }z5
k       spl     z5, }z10
z4      jmp     imp+4*step-2, }z4
z5      jmp     imp+5*step-2, }z5
l       spl     z7, }z11
z6      jmp     imp+6*step-2, }z6
z7      jmp     imp+7*step-2, }z7
d       spl     h, }z3
g       spl     n, }z6
m       spl     z9, }z12
z8      jmp     imp+8*step-1, }z8
z9      jmp     imp+9*step-1, }z9
n       mov.i   bomb1, }a
z10     jmp     imp+10*step-1, }z10
h       spl     p, }z7
o       mov.i   bomb2, *a
z11     jmp     imp+11*step-1, }z11
p       add.a   #bstep-1, a
z12     jmp     imp+12*step-1, }z12
imp     mov.i   #1, step

        end

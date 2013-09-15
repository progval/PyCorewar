;redcode-94
;name Lithium
;author John K Wilkinson
;assert CORESIZE == 8000
;strategy v7

org bootstrap

step    equ     54
count   equ     2000
d       equ     2667
BOOTDIST equ     2300

dat 1, 1

for 47
dat sm2*3777, #sm2*4177
rof

bootstrap mov     {bootptr, <bootptr
        mov     {bootptr, <bootptr
        mov     {bootptr, <bootptr
        mov     {bootptr, <bootptr
        mov     {bootptr, <bootptr
        mov     {bootptr, <bootptr
        mov     {bootptr, <bootptr
        spl     @bootptr
        mov     {bootptr, <bootptr
        mov     {bootptr, <bootptr
        dat     <bootptr, <bootptr

sm2     mov     step+1, >step+1         ; mov half of the incendiary
        dat     -10-341,    26
sp2     spl     #-1-step,-step          ; spl half of the incendiary
        sub     #step+step,1
msm2    mov     sm2,    *tgt2+(-step*2000)-17228
msp2    mov     sp2,    @msm2
tgt2    jmz     sp2+1,  #0
clr2    mov     @1,     >sm2-13
cp2     djn.b   clr2,   {sp2

bootptr dat     0,      BOOTDIST

for 30
dat sm2*3777, #sm2*4177
rof

dat 1, 1



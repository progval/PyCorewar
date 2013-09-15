;redcode-94x
;name Lithium X 8
;author John K Wilkinson
;assert 1
;CORESIZE == 55440
;strategy v8 - hoping to improve the way it copes with
;strategy attacks from djn overruns

org bootstrap

step    equ     134
count   equ     2000
d       equ     2667
BOOTDIST equ    12300

dat }1, >1

for 11                       ; was 51 (CCB)
dat sm2*3777, #sm2*4177
rof
for 11 ;                     ; was 41 (CCB)
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
        dat     -10-341,    26+4 ;4 is just in case of djn overruns
sp2     spl     #-1-step,-step          ; spl half of the incendiary
        sub     #step+step,1
msm2    mov     sm2,    *tgt2-step-2 ;+(step*2000)
msp2    mov     sp2,    @msm2
tgt2    jmz     sp2+1,  #0
clr2    mov     @1,     >-24 ;sm2-13
cp2     djn.b   clr2,   {sp2

bootptr dat     0,      BOOTDIST

for 15                          ; was 81 (CCB)
dat sm2*3777, #sm2*4177
rof

dat >1, }1


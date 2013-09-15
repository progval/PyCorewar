;redcode-94 
;name Tornado 3.0
;author Beppe
;strategy Fast 60% c bomber
;strategy v 3.0a new clear, paper and imp protection
;strategy decoymaker instead of boot
;assert CORESIZE==8000

dms     equ     25
dmd     equ     -2500
step    equ     -45               
djnoff  equ     -2205
;---
A       equ     43
B       equ     24

a for 13
        mov     >dmd-dms*a,{dmd-dms*(a+15)      
rof
;-break
       JMP.B    bombs,  >2975     

for MAXLENGTH-CURLINE-A
        spl    #0,0
rof


gate    dat     -100,   100
        dat    <-10,   <2667           ;anti imp bit
        dat     -4000,   djmp-gate+2
stclr   spl     #-3000,  djmp-gate+2
clear   mov     @djmp,  >gate
        mov     @djmp,  >gate
djmp    djn.b   clear,  {stclr
        dat     0,0
        dat     0,0

for B
        dat     0,0
rof


bombs   spl     #step,  -step           ;hit spl
start1  sub     incr,   @b1           
stone   mov     (0*step)+jump,*(1*step)+jump
b2      mov     bombs,  @stone
b1      mov     bombm,  *stone
jump    djn.f   start1, {djnoff         ;hit by spl
        jmp     stclr,  0     
incr    dat     >-3*step,>-3*step      
last
bombm   mov     {step,   1

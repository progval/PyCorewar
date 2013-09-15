;redcode-94
;name T.N.T.
;author Maurizio Vittuari
;assert CORESIZE==8000
;strategy bomber
;strategy 2.0 version: the state of art ;-)

STEP    equ     85
adj     equ     -4

decoyA  equ     7500
decoyS  equ     68
decoyB  equ     decoyA+6*decoyS
decoyA1 equ     1200
decoyB1 equ     decoyA1+6*decoyS

decoy   mov     <decoyA-decoyS*start,<decoyB-decoyS*start
for 6
        mov     <decoyA-decoyS*start,<decoyB-decoyS*start
rof
for 6
        mov     <decoyA1-decoyS*stclr,<decoyB1-decoyS*stclr
rof
        jmp     start,  >decoyB-decoyS*start
st1 for 10
        spl     #1,     <1
rof

for 100-61
        dat     0,      0
rof

gate    dat     -100,   100
        dat     <-10,   <2667
        dat     -4000,  djmp-gate+5
stclr   spl     #-3000, ptr+5
clear   mov     @djmp,  >gate
        mov     @djmp,  >gate
djmp    djn     clear,  {stclr

for 22
        dat     0,      0
rof

start   spl     #-(3*STEP),<-3*STEP
loop    mov     bomb,   *ptr
        mov     bombd,  @ptr
        sub     start,  ptr
ptr     mov     *(2*STEP+adj),@(3*STEP+adj)
        djn.f   loop,   {3500
;brea
bombd   djn.f   stclr-(ptr+1),{STEP
bomb    mov     STEP,   1

end     decoy

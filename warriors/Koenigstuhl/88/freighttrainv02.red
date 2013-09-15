;redcode
;name Freight Train v0.2
;author David Moore
;assert 1
;strategy make a 7 point imp and grow it with dual continuous launchers.
;strategy add a stone that is a bit similar to Cannonade's.
;strategy optional q^2 (set switch to make the non-scanning version).
;strategy v0.2: Fixed a minor bug in the q^2

;----------------------------------------------------------------

; q^2 switch

switch equ 1   ; set this value to 0 if you dont want the q^2

; qscan constants

QB equ 1748
QS equ  328
QI equ  163

; boot distances relative to "launch"

stbd   equ  1500  ; stone
c1bd   equ  2004  ; continuous launcher #1
c2bd   equ  6508  ; continuous launcher #2

; imp copy step size

is equ ((CORESIZE+1)/7)

; constants related to stone

step   equ    82  ; bombing step size
time   equ  2437  ; number of bombs dropped before starting clear
dd     equ     7  ; position of special bomb relative to stone

;----------------------------------------------------------------

; continous launcher

cont   spl      0,  0
       add  #1+is,  1
       jmp     @0,  cont-c1bd+(imp-main)+(6*is)

;----------------------------------------------------------------

; q^2 fast scan/bomb

for switch
       jmp  44,  91
       jmp  33,  69
       jmp  22,  47
qjb    jmp  11,  25

qa3    add  @qs3,  qp
qa2    add  @qs2, @-1
qa1    add  @qs1, @-2
qa0    cmp   @qp, last+1
qjbp   jmp     2, qjb+1
       add #QI+1, qp

       mov     qt2, @qp
       mov stone+1, <qp
       mov    cont, <qp

       sub   #10,  qp
       mov <qjbp, <qp
qp     mov 2+last+launch-cboot, <main+QB
       djn    -3,  #4

       jmp  main, QS*2
qt2    jmp    -2, QS*7


qscan  cmp main+QB+(QS* 0), main+QB+(QS* 0)+QI
qs1    jmp qa0, qt1

       cmp main+QB+(QS* 1), main+QB+(QS* 1)+QI
qs2    jmp qa1, qt2
       cmp main+QB+(QS* 5), main+QB+(QS* 5)+QI
       jmp qa1, <qs1

       cmp main+QB+(QS* 8), main+QB+(QS* 8)+QI
qs3    jmp qa2, qt3
       cmp main+QB+(QS* 3), main+QB+(QS* 3)+QI
       jmp qa2, <qs2
       cmp main+QB+(QS* 7), main+QB+(QS* 7)+QI
       jmp qa2, <qa1
       cmp main+QB+(QS*12), main+QB+(QS*12)+QI
       jmp qa2, <qs1

       cmp main+QB+(QS*11), main+QB+(QS*11)+QI
       jmp qa3, 0
       cmp main+QB+(QS* 4), main+QB+(QS* 4)+QI
       jmp qa3, <qa2
       cmp main+QB+(QS* 6), main+QB+(QS* 6)+QI
       jmp qa3, <qs2
       cmp main+QB+(QS* 9), main+QB+(QS* 9)+QI
       jmp qa3, <qs3
       cmp main+QB+(QS*10), main+QB+(QS*10)+QI
       jmp qa3, <qa1
       cmp main+QB+(QS*15), main+QB+(QS*15)+QI
       jmp qa3, <qs1
rof

;----------------------------------------------------------------

; boot a stone, an imp, and two continuous launchers

main   spl launch,stone+4
       spl 1,cont+3
       spl 1,cont+3
       mov <-3, <stptr
       mov <-3, <c1ptr
       mov <-3, <c2ptr
stptr  djn main+stbd+1, #main+stbd+4

cboot  mov imp, imp-is
       mov db, main+stbd+dd
c1ptr  spl main+c1bd, main+c1bd+3
       mov #-2-c2bd+(imp-main)+(6*is)+2, main+c2bd+2
       jmp main+c2bd, <0

db     dat <2667,  <1

imp    mov 0, is

stone  mov <dd+1+(2*time), 3+(step*time)
       spl  -1, <2-step
       add   1,   -2
       djn  -2, <0-step   ; gets bombed with db to start core clear

launch spl cboot,QS*5
qt1    spl 1,QS*1
qt3    spl 1,QS*3
c2ptr  spl 1,main+c2bd+3
       spl 2,0
       jmp @0, imp-is
       add #is, -1
last   jmp main+stbd+1, <0

;----------------------------------------------------------------

for switch
  end qscan
rof

for 1-switch
  end main
rof

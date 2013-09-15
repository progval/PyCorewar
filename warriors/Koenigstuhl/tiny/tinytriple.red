;redcode-94
;name Tiny Triple
;author Christian Schmidt
;strategy qbomb -> stone/imp
;assert 1

dOff  equ 304
sStep equ 108
iStep equ 25
xOff  equ 657
xSep  equ 392

sGo   spl   #sStep,    >-sStep
sLp   mov   <-sStep*2, {sStep*2
      add.x sGo,       sLp
      djn.f sLp,       <dOff

xGo
i for 10
mov.i {-xOff-(i*xSep*2),{-xOff-xSep-(i*xSep*2)
rof

      spl   sGo,     < 59 
      mov  imp,    @iRef
iRef  spl    @0,     imp+iStep
iGo   add.ab #iStep, iRef
      djn    -3,     #7
imp   mov.i  #1,     1

end xGo


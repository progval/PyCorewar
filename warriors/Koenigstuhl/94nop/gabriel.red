;redcode-94nop
;name Gabriel
;author Roy van Rijn
;assert 1

sStep equ 451
sPtr  equ (tPtr-2)

tPtr  mov.ab #0    ,sPtr
wipe  mov.i  bomb  ,>sPtr
      mov.i  *wipe ,>sPtr
      jmn.f  wipe  ,@sPtr
scan  add.a  #sStep,tPtr
      jmz.f  scan  ,*tPtr
      slt.ab tPtr  ,#tail-tPtr+3
      djn    tPtr  ,*sPtr
      jmn.a  scan  ,tPtr
      jmp    scan  ,}wipe
bomb  spl    #0    ,}0
      spl    #0    ,{0
tail  dat.f  <5334 ,<2667
end scan


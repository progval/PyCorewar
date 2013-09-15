;redcode-94nop
;name S/I(mple)
;author Roy van Rijn
;strategy Slightly altert snowstorm from Metcalf himself
;assert 1

     sStep equ 105
     iStep equ 267
sInc:spl   #-sStep,  >sStep
sPtr:mov   >-sStep*2,1+sStep*2
i1   add   sInc,     0
xx:  djn.f sPtr,     >sInc+sStep
     for   2
     dat   0,        0
     rof
siGo:
nop   <i1,      }i2
nop   }i3,      }i4
     spl   sInc,     >-430
i2   spl   0,        >-410
i3   spl   0,        <-390
i4   spl   0,        }-370
     spl   iAdj,     {-350
iPtr:djn.f iImp,     {-300
     for   3
     dat   0,        0
     rof
iAdj:add.f #iStep,   iPtr
     dat   0,        0
iImp:mov.i #iStep,   *0
     end   siGo


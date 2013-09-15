;redcode-94x
;name Snowstorm
;author John Metcalf
;strategy stone/imp
;assert CORESIZE==800

     sStep equ 105
     iStep equ 267

sInc:spl   #-sStep,  >sStep
sPtr:mov   >-sStep*2,1+sStep*2
     add   sInc,     sPtr
xx:  djn.f sPtr,     >sInc+sStep

     for   4
     dat   0,        0
     rof

siGo:spl   sInc,     >-430
     spl   1,        >-410
     spl   1,        <-390
     spl   1,        }-370
     spl   iAdj,     {-350
iPtr:djn.f iImp,     {-300

     for   3
     dat   0,        0
     rof

iAdj:add.f #iStep,   iPtr

     dat   0,        0

iImp:mov.i #iStep,   *0
     end   siGo


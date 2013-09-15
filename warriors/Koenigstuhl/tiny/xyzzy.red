;redcode-94x
;name Xyzzy
;author John Metcalf
;strategy an average paper/stone, poor results
;strategy against evolved warriors and oneshots
;assert CORESIZE==800

     dOff  equ (sGo-240)
     sStep equ 108

sGo  spl   #sStep,    >-sStep
sLp  mov   <-sStep*2, {sStep*2
     add.x sGo,       sLp
     djn.f sLp,       <dOff

     for 4
     dat 0,0
     rof

star mov   >sGo-129,  {sGo-150
     mov   >sGo-171,  {sGo-192
     mov   >sGo-213,  {sGo-234

     spl   1,         >sGo-87
     spl   sGo,       }sGo+340
     spl   1,         {sGo+319

     mov   {pap1,     <pap1
     djn.f @pap1,     <sGo+298

     pStep1 equ 60
     pStep2 equ 444

pap1 spl   @0+4,      >pStep1+4
     mov   }pap1,     >pap1
     mov   {pap1,     {pap2
pap2 djn.f *pStep2+1, {355

     end   star


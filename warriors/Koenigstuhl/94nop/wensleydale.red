;redcode-94nop
;name Wensleydale!
;author John Metcalf
;strategy stone/dual imps
;assert CORESIZE==8000

     lboot equ (pGo+5000)
     sboot equ (pGo+1000)
     iboot1 equ (sboot+150)
     iboot2 equ (iboot1+191)
     istep1 equ 2667
     istep2 equ 1143
     proc equ 8
     sstep equ 2365

pGo
     mov   imp1,    iboot1
     mov   imp2,    iboot2

     mov   <sl,     {sl
     spl   1
     spl   1
     mov   <vl,     {vl
     mov   <sl,     {sl
     spl   1

sl   spl   sboot+5, rose+5
vl   jmp   lboot+4, vort+4

vort spl   #istep1, <istep2
     add   vort,    1
     spl   (vort+iboot1-istep1*proc)-lboot, (vort+iboot2-istep2*proc*2)-lboot
     djn.f @-1,     <-100

rose:spl   #0,      0
     spl   #sstep,  -sstep
     mov   >sstep,  1-sstep
     add   -2,      -1
     djn.f -2,      <-100

imp1 mov.i #1,      istep1
imp2 mov.i #istep2, *0
end


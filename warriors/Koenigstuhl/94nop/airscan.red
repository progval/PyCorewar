;redcode-94nop
;name AIRscan
;author Christian Schmidt
;strategy double-looped blur-style airbag scanner
;assert 1

sOff1  equ   5393
step   equ   4698
sAwa   equ   8
sHit   equ   30

gate   equ   (cc-6);Scan

point  dat   0,       4487
loop1  mov   cc,      >point
       mov   cc,      >point
       jmz.f loop1,   >Check
       jmp   cc,      0

       for   2
       dat   0,       0
       rof

Adju   mov.b Scan,   point
       djn   Scan+1,  #sHit
       jmp   cc,      0
Check  dat   0,       0
       dat   0,       0

       for   2
       dat   0,       0
       rof

loop2  add.f cc,    Scan
Scan   sne   }sOff1+sAwa,   sOff1
       jmz.f loop2,   <Check
       jmz.f Adju,    <Check
       jmp   cc,      0

       for   12
       dat   0,       0
       rof


cc     spl   #step,   step
       mov   clr,     >gate
       djn.f -1,      >gate

       for   0
       dat   0,       0
       rof

clr    dat   <2667,   clr-gate+2
       dat   0,       0

       for   5
       dat   0,       0
       rof

pGo    spl   2
       jmp   loop1
       jmp   loop2

end pGo


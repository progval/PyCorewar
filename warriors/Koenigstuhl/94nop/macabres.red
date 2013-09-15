;redcode-94nop
;name Macabre Silhouette
;author John Metcalf
;strategy blur scan -> d-clear, added decoy
;strategy d-clear positioned away from scan
;strategy IRCT 12 probe warrior
;assert CORESIZE==8000

     bdist equ (1000-3)
     step  equ 70
     add   2,-2
ptr: spl   #1000,    >3002
loop:mov   sbmb,     >ptr
scan:seq   2*step+5, 2*step
sp:  mov.b scan,     @loop
     add   inc,      scan
     jmn   loop,     *sp
inc: jmp   sbmb,     sbmb

     for   step-9
     spl   #100,100
     rof

gate:dat   0,5234

     for   7
     spl   #100,100
     rof

sbmb:spl   #0,       0
     mov   cbmb,     >gate
     djn.f -1,       >gate

cbmb:dat   <2667,    cbmb-gate+2
     for   4
     spl   #100,100
     rof
     dat   <5335,cbmb-gate+2
     dat   100,100
star:
cboo:mov   cbmb,     cbmb+bdist

     for   3
     mov   {cboo,    <cboo
     rof
     mov   gate,     gate+bdist
boot:mov   inc,      inc+bdist

     for   4
     mov   {boot,    <boot
     rof

     spl   @boot

     for   2
     mov   {boot,    <boot
     rof

     end   star


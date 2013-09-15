;redcode-94nop
;name Creaky old code
;author John Metcalf
;strategy .2c bomb, .2c clear, .4 scan from one loop
;strategy IRCT 12 probe warrior
;assert CORESIZE==8000

     step  equ (16*7)
     gate  equ (ptr-2)

ptr: spl   #11,      >3950
loop:mov   inc,      >ptr
     mov   ptr,      *scan
scan:seq   *step,    step+6
     mov.b scan,     @loop
     add   inc,      scan
     djn   loop,     #498

inc: spl   #step,    <step
     mov   cbmb,     >gate
btm: djn.f -1,       {gate

cbmb:dat   <1,       cbmb-gate+2
     end   scan


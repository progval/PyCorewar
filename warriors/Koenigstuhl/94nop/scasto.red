;redcode-94
;name scasto
;author John Metcalf
;strategy Scanner -> Stone
;strategy After scan phase completed, bomb instead of clear
;assert CORESIZE==8000

     step  equ 3044
     gate  equ ccpo

ccpo:mov.b loop,     #-step
loop:add   #step,    #step
     mov   sSto,     >gate
s:   jmz.f loop,     @loop
     jmn   ccpo,     *ccpo

     sStep equ -903
     sTime equ 6863

sSto:spl   #0,       0         ; a-field is decremented to zero
sLp: mov   sBmb,     @1
sSel:add   #sStep,   #sSel-sStep*sTime
sP:  djn.f sLp,      {-200
     dat   0,        0
sBmb:dat   <0,       -4       ; b-field is decremented to one
     end   s

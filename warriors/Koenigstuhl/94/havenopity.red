;redcode-94
;name Have No Pity
;author John Metcalf
;strategy p-switching a mini-scanner with a bomb-dodger
;assert CORESIZE==8000
     org psw

; [ Decoy ]

     for 14
     stp.ab >0,      #0
     spl   #psw*971, >-psw*713
     spl   #psw*871, >-psw*813
     spl   #psw*771, >-psw*913
     rof

; [ Score-Table ]

     stp.ab >0,      #0
z:   spl   #-21,     >21
     spl   #21,      >-21
     spl   #-7,      >7
     dat   #0,       #0

; [ P-Switcher ]

ploc equ (81)
res  equ (momb+3616)
par  equ (momb+3631)

psw: ldp   #0,       {res
pot: add   *res,     #z
     ldp   #ploc,    par
     slt   #4000,    par
     mov.x @pot,     @pot
     add   par,      @pot
     stp   @pot,     #ploc
     slt   #4000,    @pot
     mov   f2,       from

; [ Multi-Boot ]

     for 9
     mov   {from,    <from
     rof
     jmp   @from,    <momb+3646

     dat   #0,       #0
f2:  dat   #momb+1,  #res+5-firs-std
from:dat   #bomb+1,  #momb+1+1763*4

; [ Mini-Scanner ]

step equ (7052)
gate equ (ccpo-2)

ccpo:mov.b loop,     gate
loop:add   #step,    #step
     mov   sp,       >gate
s:   jmz.f loop,     @loop
     jmn   ccpo,     loop
sp:  spl   0,        0
looz:mov   bomb,     >gate
     djn.f looz,     >gate
bomb:dat   <2667,    >13

; [ Bomb-Dodger ]

gat2 equ (circ-5)
std  equ (237*3)     ; search time
firs equ (-2700)

scan:jmz.f scan,     }find
moop:mov   {dclr,    {find
     jmn.a moop,     dclr
find:jmp   firs,     >4567
dclr:spl   #momb+1,  >gat2-2667
circ:mov   momb,     >gat2
     djn.f circ,     >gat2
momb:dat   <2667,    >3-gat2
     end


;redcode-94x quiet
;name Incisor+
;author John Metcalf
;strategy .5c oneshot -> spl/spl/dat clear
;assert CORESIZE==8000 || CORESIZE==800
     for CORESIZE==8000
step equ 3364
     rof
     for CORESIZE==800
step equ 324
     rof
on:  dat   sp2,     loop+step+1
sp2: spl   #sp1-on, <1+d-on
     dat   0,       0
st:  add   #step+1, on
ii:  jmz.f st,      <on
sp1: spl   #d-on,   1+d-on
loop:mov   *on,     >on
     mov   *on,     >on
     jmp   loop,    >on-1
d:   dat   <sp1-on, <1+d-on
     end   ii


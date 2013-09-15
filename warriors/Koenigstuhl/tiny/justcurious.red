;redcode-94x
;name just a little curious?
;author John Metcalf
;strategy decoy maker -> 9 line CLP
;assert CORESIZE==800

     high  equ (clp+32)
     low   equ (clp-28)
     esc   equ (clp-32)

     cptr  equ (new-1)

new: mov.x *pptr,     @pptr
     mov   dbmb,      cptr
clp: mov   cptr,      <cptr
pptr:sne.x high,      low
     djn.f clp,       >dptr

copy:mov   *cptr,     <cptr
     djn.a copy,      cptr
dptr:jmp   @cptr,     high+50
dbmb:dat   dbmb-cptr, esc

     for   4
     dat   0,0
     rof

     step  equ 19
make:
time for   3
     mov   <low+time*2-14, <low+step+6-(step*2*time)
     mov   {low+time*2-13, {low+6-(step*2*time)
     rof
     jmp   new+1,           >low-6
     end   make

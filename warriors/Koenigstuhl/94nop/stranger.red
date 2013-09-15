;redcode-b quiet
;name Stranger
;author John Metcalf
;strategy Incendiary bomber -> d-clear
;assert CORESIZE==8000
step equ 5368
dist equ 2581
ib:  spl   #1000,    1-dist
loop:mov   ib,       @gunk+step-dist
     mov   ia,       @loop
     add   #step,    loop
gunk:jmp   loop,     >ia+dist
clr: mov   bom,      >ib-4
     djn.f clr,      >ib-4
ia:  mov   dist,     >dist
bom: dat   >2667,    >13
     end   ib



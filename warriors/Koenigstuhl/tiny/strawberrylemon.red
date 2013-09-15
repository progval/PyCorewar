;redcode-tiny
;name Strawberry and Lemon
;author LAchi
;strategy The best original bishot stone/scan I could get.
;strategy Tuned by Fizmo.
;assert CORESIZE==800 

STEP   equ -7
FIRST  equ 56
WIDTH  equ 404 

loop   sub.f  sPtr,   dest
start  mov.i  }dest,  >dest
dest   sne.i  <FIRST, <FIRST+WIDTH
   djn.a  loop,   <loop-61
   add.f  dest,   sPtr
   djn.f  sBomb,  sPtr 

for 2
   dat    0,      0
rof 

sPtr   dat    STEP,   STEP
   dat    10,     402
sBomb  spl    #13,    -328
sLoop  mov    sBomb,  }sPtr
   mov    sBomb,  >sPtr
sBack  djn.a  sLoop,  <sBomb 

end    start 

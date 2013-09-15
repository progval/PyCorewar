;redcode-94x
;name Hemulen
;author John Metcalf
;strategy decoy maker -> incendiary bomber -> clear
;assert CORESIZE==800

count equ 131
step  equ 545
over  equ (159-count)
gate  equ (mBmb-3)
decoy equ (mBmb+325)

     org   make
      
mBmb:mov   -step*over-1,}-step*over-1
sLp: mov   sBmb,        @ptr
ptr: mov   mBmb,        }2+step
     add   #step,       ptr
     djn   sLp,         #count
sBmb:spl   #step*over+1,1
cLp: mov   dBmb,        >gate
     djn.f cLp,         {gate                   
dBmb:dat   >1,          15

     for   3
     dat   0,0
     rof                 

make:mov   dBmb,        {decoy+2
     mov   <decoy+3,    {decoy+27
     mov   <decoy+28,   {decoy+52
     mov   <decoy+53,   {decoy+77
     mov   <decoy+78,   {decoy+102
     mov   <decoy+103,  {decoy+127
     mov   <decoy+128,  {decoy+152
     djn.f sLp,         <decoy+177


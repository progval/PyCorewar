;redcode-94x
;name Muskrat
;author John Metcalf
;strategy decoy maker -> T.N.T. style bomber -> d-clear
;assert CORESIZE==800

count equ 79
step  equ 165
gate  equ (mBmb-3)
decoy equ (mBmb+299)

     org   make

mBmb:mov   step,        1
sLp: mov   *ptr,        @ptr
ptr: mov   mBmb,        *2+step
     add   #step*2,     ptr
     djn   sLp,         #count
     spl   #0,          0
cLp: mov   dBmb,        >gate
     djn.f cLp,         >gate
dBmb:dat   >1,          15

     for   3
     dat   0,0
     rof

make:mov   <decoy+1,    {decoy+22
     mov   <decoy+23,   {decoy+43
     mov   <decoy+44,   {decoy+57
     mov   <decoy+58,   {decoy+78
     mov   <decoy+79,   {decoy+102
     mov   <decoy+103,  {decoy+123
     mov   <decoy+124,  {decoy+147
     djn.f sLp,         <decoy+168


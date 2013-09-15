;redcode-94nop
;name Argon
;author Fizmo
;strategy semi-intelligent 0.8c sdd-oneshot
;strategy bomb/decoy detection
;strategy start paper if bomb is detected
;strategy scan again if decoy is detected
;assert 1

org      start+1

st       equ     17 

;constants for optimization 

of       equ     150  ; starting offset
dc       equ     -150 ; decoy
ln       equ     110  ; scan time


cptr     dat   0,     100
bmb3     dat   #-20,  20
bmb2     dat   #-20,  20
bmb1
clear2   spl   #-20,  20
         mov.i @bptr, >cptr
         mov.i @bptr, >cptr
bptr     djn.b -2,    {bmb1
m        dat.f 0,     0

     for 22
         dat.f 0,     0     
     rof

decoy    dat   #dc, #dc
step     spl   #st*-2,st*-2

     for 20
         dat.f 0,0     
     rof

start    add.f step,   ptr       
         sne.i *ptr,   @ptr
         add.f step,   ptr
ptr      sne.i m-of-st,m-of-2*st
nr       djn.b start,  #ln 
         jmz.f 2,      *ptr
         mov.x ptr,    ptr
         jmz.f silk,   <ptr
         add.f step,   ptr
         jmz.f clear,  @ptr
         add.f decoy,  ptr
         jmp   start
clear    mov.b ptr,    cptr
         jmp   clear2 

     for 20
         dat.f   0,0     
     rof

pStep1   equ     560
pStep2   equ     2680
pStep3   equ    -1120
x        equ    -3781
y        equ    -2013


silk     spl   1,      >-1424
         spl   1,      {-1761
         spl   1,      {-1933
         mov   {pap1,  {pBoo
pBoo     spl   pEnd+4000,{2093
pap1     spl   @pEnd,  <pStep1
         mov.i }pap1,  >pap1
pap2     spl   @0,     {pStep2
         mov.i }pap2,  >pap2
         mov.i #1,     <1     ;instead of {
         mov   x,      <y
         mov.i {pap2,  <pap3
pap3     jmz.a @0,     pStep3
pEnd     dat.f   0,0

         end


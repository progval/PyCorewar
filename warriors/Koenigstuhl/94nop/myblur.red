;redcode-94nop
;name myBlur
;author Paulsson
;strategy airBag technologies inc.
;assert CORESIZE > 1

org start
STEP    equ     290/2
N1      equ     200
N2      equ     1
N3      equ     3000

st      equ     STEP
ptr     equ     (hit+st)
cptr    equ     ((ptr-(2*st))-N2)

check
ccp     dat.f   ptr+1,N1
        dat.f   0,0
hit2    nop.f   0,0
target  mov.ab  }check,cptr
next    add.f   step,ptr
        seq.x   *ptr,@ptr
        jmn.a   target,{check
hit     mov.i   {check,>cptr
        jmn.a   next,}check
;;break
step    spl     #st,st
cc      mov.i   ccb,>ccp
        djn.f   cc,>ccp
        dat.f   0,0
ccb     dat.f   0,ccb-ccp+2

for 40
        dat.f   0,0
rof
tmpptr  spl     #st,st+5
start   mov.x   hit,hit2
        mov.i   tmpptr,ptr
        mov.ab  #N3,cptr
        spl     1
        mov.i   -1,0
        spl     1
        jmp     @1,}0
tmp     sub.f   #1,#next+1
        sub.f   #1,#next+3
        sub.f   #1,#next+4
        sub.f   #1,#next
        sub.f   #1,#next+1
        dat.f   #1,#tmp


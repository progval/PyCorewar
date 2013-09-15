;redcode-b
;name of mirth and merriment
;author Simon Wainwright
;strategy pspacer
;assert 1

 ;-------------
 ;P^2 . Marsden
 ;-------------
PSTATE EQU 123
STATES EQU 8
      dat    0,init_state-state
in    dat    0,loss_table-state
      dat    0,win_table-state
      dat    0,tie_table-state
think ldp.a  #0,in
load  ldp.a  #PSTATE,state
      mod.a  #STATES,state
      add.ba *in,state
store stp.a  *state,load
state jmp    @0

c1 EQU dboot ;clear
c2 EQU cboot ;stone
c3 EQU pboot ;paper
c4 EQU sboot ;scanner

loss_table
  dat 1,c2
  dat 2,c1
  dat 3,c2
  dat 4,c4
  dat 5,c4
  dat 6,c3
  dat 7,c3
  dat 0,c1
win_table
init_state
  dat 0,c1
  dat 1,c2
  dat 0,c1
  dat 1,c2
  dat 4,c4
  dat 4,c4
  dat 6,c3
  dat 6,c3
tie_table
  dat 1,c2
  dat 0,c1
  dat 3,c2
  dat 2,c1
  dat 4,c4
  dat 5,c4
  dat 6,c3
  dat 7,c3

 ;-----------------
 ;Demented . Macrae
 ;-----------------
daway equ 1407
bomb1 equ (b+1)
bomb2 equ (b+2)
ptr equ dclear-7
dboot     mov b,       {ddest
          mov b,       {ddest
          mov b,       {ddest
          mov b,       {ddest
          mov dclear+4,{ddest
          mov dclear+3,{ddest
          mov dclear+2,{ddest
          mov dclear+1,{ddest
          mov dclear+0,{ddest
ddest     jmp daway,   <-1361
dclear    spl   #0,    }ptr
          mov.i bomb1, >ptr
          mov.i bomb2, >ptr
          djn.f -1,    >ptr
          jmp   -2,    }ptr
b         dat   >5335, 16

 ;--------------------------
 ;Carbonite . Sutton+Marsden
 ;--------------------------
caway EQU (-1409)
cboot mov    tar+1,<cdest
      mov    tar,<cdest
      mov    tar-1,<cdest
cdest mov    dbomb,*caway
      mov    tar-2,<cdest
      jmp    @cdest,>1234
      spl    #0,<-1151+3
      mov    197,tar-197*3500
tar   add.ab {0,}0
      djn.f  -2,<-1151
dbomb dat    >-1,>1

 ;--------------
 ;Pulp . Oversby
 ;--------------
paway   equ     3711
dest1   equ     1400
dest2   equ     5460
dest3   equ     725
pos1    equ     930
pos2    equ     3359
pos3    equ     1009

pboot   SPL.B   2,      {-3000
        SPL.B   2,      {-2500
        SPL.B   1,      {-2000
        SPL.B   1,      {-1500
        MOV.I   <papend,{pdest
pdest   JMP.B   paway,  {-1000

silk    SPL.B   @0,     >dest1
        MOV.I   }-1,    >-1
        MOV.I   bomb,   >pos1
silk2   SPL.B   @0,     >dest2
        MOV.I   }-1,    >-1
        MOV.I   bomb,   >pos2
        MOV.I   bomb,   }pos3
        MOV.I   {silk2, <silk3
silk3   JMP.B   @0,     >dest3
bomb    DAT.F   <2667,  <5334
papend  DAT.F   0,      0

 ;--------------------
 ;Silver Talon . Edgar
 ;--------------------
saway equ 1901
sboot   mov clr,<sdest
        for 9
        mov {sboot,<sdest
        rof
sdest   jmp saway,saway+10
head    spl #-4,5000
loop    mov head,>head
        add.f step,scan
scan    cmp.i }4,0
        mov.b scan,@loop
        djn loop,#999
step    spl #-152,>-152
        mov clr,>head-5
        djn.f -1,>head-5
clr     dat 1,#18
END think


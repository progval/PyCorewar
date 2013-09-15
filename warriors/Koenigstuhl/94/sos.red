;redcode-94
;name SOS- I need help
;author Ryan Coleman
;assert 1
;strategy Switch on Switch
;strategy switched between 3 switchers
;strategy 1. always timescape
;strategy 2. switch on loss
;strategy 3.  switch on loss/win
;strategy effectively runs timescape most of time
;strategy unless opponent does same, then runs carbonite a bit
;strategy probably trash

org think0


;=---time-----

TSTEP equ 1800
CSTEP equ 3740
NSTEP equ -1922
FSTEP equ 1870

time    spl     1,              <-200
        spl     1,              <-300
        mov.i   -1,             0

tim1    spl     @tim1,          }TSTEP
        mov.i   }tim1,          >tim1
cel1    spl     @cel1,          }CSTEP
        mov.i   }cel1,          >cel1
        mov.i   {-FSTEP,        <FSTEP
        mov.i   {cel1,          <ncl1
ncl1    jmp     @ncl1,          >NSTEP
dat.f $0,$0
dat.f $0,$0


;----carb----

dbomb   dat     >-1, >1
carb    spl     #0, <-100
        mov     dbomb, tar-197*3500
tar     add     #197, -1                ; gets bombed to start coreclear
        djn.f   -2, <-1151
dat.f $0,$0
dat.f $0,$0
dat.f $0,$0
dat.f $0,$0
dat.f $0,$0
dat.f $0,$0
dat.f $0,$0
dat.f $0,$0

;---brain1----

PSTATE    EQU 69 ; pspace location containing current state
STATES EQU 2      ; maximum number of states (for brainwash protection)

;NOTE: state values go from 0 to STATES-1

      dat    0,init_state-state
in    dat    0,loss_table-state
      dat    0,win_table-state
      dat    0,tie_table-state

think1 ldp.a  #0,in              ; get input value
load  ldp.a  #PSTATE,state      ; load old state
      mod.a  #STATES,state      ; brainwash protection
      add.ba *in,state          ; select correct state table
store stp.a  *state,load        ; store new state
state jmp    @0                 ; jump to warrior code

      ; You could also delete the #PSTATE value
      ; if you wish (or the stp.a instruction).

c1 EQU carb   ;stone
c2 EQU time   ;paper

loss_table
  dat 1,c2
  ;see below

tie_table
win_table
  dat 0,c1
init_state   dat 1,c2



;----brain0
PSTATE0   EQU 666 ; pspace location containing current state
STATES0 EQU 12    ; maximum number of states (for brainwash protection)

;NOTE: state values go from 0 to STATES-1

      dat    0,init_state0-state0
in0    dat    0,loss_table0-state0
      dat    0,win_table0-state0
      dat    0,tie_table0-state0

think0 ldp.a  #0,in0              ; get input value
load0 ldp.a  #PSTATE0,state0      ; load old state
      mod.a  #STATES0,state0      ; brainwash protection
      add.ba *in0,state0          ; select correct state table
store0 stp.a  *state0,load0        ; store new state
state0 jmp    @0                 ; jump to warrior code

      ; You could also delete the #PSTATE value
      ; if you wish (or the stp.a instruction).

t1 EQU think1   ;solg
t2 EQU think2   ;solwe
t3 EQU time   ;coop

loss_table0
  dat 2,t3
  dat 3,t3
  dat 4,t1
  dat 4,t1
  dat 6,t1
  dat 7,t1
  dat 8,t2
  dat 8,t2
  dat 10,t2
  dat 11,t2
  dat 0,t3
  dat 0,t3

win_table0
init_state0
  dat 0,t3 
  dat 0,t3
  dat 0,t3
  dat 0,t3
  dat 4,t1
  dat 4,t1
  dat 4,t1
  dat 4,t1
  dat 8,t2
  dat 8,t2
  dat 8,t2
  dat 8,t2

tie_table0
  dat 1,t3
  dat 2,t3
  dat 3,t3
  dat 4,t1
  dat 5,t1
  dat 6,t1
  dat 7,t1
  dat 8,t2
  dat 9,t2
  dat 10,t2
  dat 11,t2
  dat 0,t3

;---brain2----

PSTATE2    EQU 777 ; pspace location containing current state
STATES2 EQU 2      ; maximum number of states (for brainwash protection)

;NOTE: state values go from 0 to STATES-1

      dat    0,init_state2-state2
in2    dat    0,loss_table2-state2
      dat    0,win_table2-state2
      dat    0,tie_table2-state2

think2 ldp.a  #0,in2              ; get input value
load2  ldp.a  #PSTATE2,state2      ; load old state
      mod.a  #STATES2,state2      ; brainwash protection
      add.ba *in2,state2          ; select correct state table
store2 stp.a  *state2,load2        ; store new state
state2 jmp    @0                 ; jump to warrior code

      ; You could also delete the #PSTATE value
      ; if you wish (or the stp.a instruction).

c1a EQU carb   ;stone
c2a EQU time   ;paper

loss_table2
win_table2
  dat 1,c2a
  init_state2 ;see below

tie_table2
  dat 0,c1a
  dat 1,c2a


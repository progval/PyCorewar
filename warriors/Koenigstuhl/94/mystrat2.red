;redcode-94
;name My Strat 2
;author Ryan Coleman
;assert 1
;strategy i forget
;strategy oh well

org think


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

;---brain----

PSTATE    EQU 666 ; pspace location containing current state
STATES EQU 4      ; maximum number of states (for brainwash protection)

;NOTE: state values go from 0 to STATES-1

      dat    0,init_state-state
in    dat    0,loss_table-state
      dat    0,win_table-state
      dat    0,tie_table-state

think ldp.a  #0,in              ; get input value
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
          tie_table
win_table
  dat 0,c2
  dat 0, c2
init_state   dat 3,c1
  dat 0,c2





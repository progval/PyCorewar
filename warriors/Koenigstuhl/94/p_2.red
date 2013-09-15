;redcode-94
;name P^2
;author Anders Rosendal

;Above line was originally ;author Anton Marsden
;Changed by Philip Kendall

;assert CORESIZE==8000

PSTATE    EQU 666 ; pspace location containing current state
STATES EQU 6      ; maximum number of states (for brainwash protection)

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

c1 EQU ptr1
c2 EQU boot

loss_table
  dat 1,c1
  dat 2,c1
  dat 3,c2
  dat 4,c2
  dat 5,c2
  dat 0,c1

win_table
  dat 0,c1
  dat 0,c1
  dat 0,c1
  dat 3,c2
  dat 3,c2
  dat 3,c2

tie_table
  dat 0,c1
  dat 0,c1
init_state dat 0,c1
  dat 3,c2
  dat 3,c2
  dat 3,c2

;----------------------------------------

space   equ     (MINDISTANCE)
djnptr  EQU    60
step    EQU    1272 ;mod-8 ca

boot2 z for 19
                mov.i {bsource2,<bootptr2
rof
bootptr2        spl ptr1+shift,bsource+shift
                mov.i #0,-2
		dat 0,0
        
                                        ;ptr1    jmz.B  -1,   ptr1+2+step
        add.AB #step,ptr1
ptr1    jmz.A  -1,clean+step
        jmp    goclean,<-1
for 3+5
        dat    0,0
rof
;  Multi Clear --------
a2      spl    #a3-ptr1,#a3-ptr1+1
goclean add.F  #clean-ptr1+1,ptr1
clean   spl    #a2-ptr1,#a3-ptr1+1    ; spl #X, <-Y acts like a split 0.
loop2   mov    *ptr1, >ptr1           ; and use the decrement in the b-field
        mov    *ptr1, >ptr1           ; and use the decrement in the b-field
        mov    *ptr1, >ptr1           ; and use the decrement in the b-field
snoop   djn.F  loop2, <ptr1-djnptr    ; the b-field of ptr1 to move the bomb
a3      dat     {2667,{5334
bsource2        dat 0,0


;----------------------------------------


shift		equ -3000

ptr		dat >0,4000
		dat 0,0
start		spl #0,>ptr
		mov.i bomb,>ptr
		djn.f -1,>ptr
bomb            dat >2667,bomb-ptr+last+1
start2          spl #0,>ptr
		mov.i bomb,>ptr
		djn.f -1,>ptr
for 0
start3          spl #0,>ptr
		mov.i bomb,>ptr
		djn.f -1,>ptr
rof
last
bsource		dat 0,0
boot z for 9+0
		mov.i {bsource,<bootptr
rof
bootptr		spl start+shift,bsource+shift
                spl start2+shift
                mov.i #0,-2
                mov.i #0,-2
		dat 0,0

z for MAXLENGTH-CURLINE
		spl #z*100,z*101
rof

END think

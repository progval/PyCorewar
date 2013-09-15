;redcode-94
;name Stone Killer 5.22
;author John K Wilkinson
;assert 1
;strategy p-switching d-clearish clisson with blur2 thing
;strategy v5.2* - optimised p-states towards maximum points
;strategy rather than just going for maximum wins.
;strategy There's about an 90% I will score between 170 and 177.
;strategy (I hate random sampling of discrete variables...)

org start

w0 equ machine
w1 equ clisson

PSTATE EQU 250 ; pspace location containing current state
SPS equ 5
STATES EQU (SPS*2)  ; maximum number of states (for brainwash protection)

        dat     0,      init-state
in      dat     0,      loss_table-state
        spl     1,      win_table-state
        spl     1,      tie_table-state

start
think ldp.a  #0,in              ; get input value
load  ldp.a  #PSTATE,state      ; load old state
      mod.a  #STATES,state      ; brainwash protection
      add.ba *in,state          ; select correct state table
store stp.a  *state,load        ; store new state

win_table
state
      jmp    @0,                        w0
      spl    #(-win_table-1)%STATES,    w0
      spl    #(-win_table-1)%STATES,    w0
      spl    #(-win_table-1)%STATES,    w0
      spl    #(-win_table-1)%STATES,    w0

      spl    #(-win_table-0)%STATES,    w1
      spl    #(-win_table-1)%STATES,    w1
      spl    #(-win_table-2)%STATES,    w1
      spl    #(-win_table-2)%STATES,    w1
      spl    #(-win_table-2)%STATES,    w1

watch2    dat    0,0

          dat    1,1

tie_table      
      spl    #(-tie_table-0)%STATES,    w0
      spl    #(-tie_table-1)%STATES,    w0
      spl    #(-tie_table-1)%STATES,    w0
      spl    #(-tie_table-1)%STATES,    w0
      spl    #(-tie_table-1)%STATES,    w0

      spl    #(-tie_table+1)%STATES,    w1
      spl    #(-tie_table+1)%STATES,    w1
      spl    #(-tie_table+1)%STATES,    w1
      spl    #(-tie_table+0)%STATES,    w1
      spl    #(-tie_table+0)%STATES,  w1
loss_table      
      spl    #(-loss_table+1)%STATES,    w0
      spl    #(-loss_table+1)%STATES,    w0
      spl    #(-loss_table+1)%STATES,    w0
      spl    #(-loss_table+1)%STATES,    w0
      spl    #(-loss_table+SPS)%STATES,  w1

      spl    #(-loss_table+1)%STATES,    w1
      spl    #(-loss_table+1)%STATES,    w1
init
      spl    #(-loss_table+1)%STATES,    w1
      spl    #(-loss_table+1)%STATES,    w1
      spl    #(-loss_table+SPS-3)%STATES,  w0

      for 3
          dat    0,0

      rof

q1        spl    #0,{q1-5

          mov    qb,>q1-5

          mov    qb,>q1-5

          djn.f  -1,{q1-5
qb        dat    <1,11 ;<2667,11

watch4    equ    watch2+100

clisson
wait1     mov    #-100,watch4

          sne    {watch1,<watch1         ; linear scans for bombs

          jmz.f  -1,@watch4              ; internal check for silent carpet 

attack

          sne    datzero,*watch1         ; which pointer has the target?

          mov.x  watch1,watch1

          sub.a  #5,watch1

LEN equ (qb+1-q1)
          mov    datzero,}watch1         ; dat-bomb a place for killer

          djn    -1,#LEN+1
          mov    <launch2,{watch1        ; then put killer there

          djn    -1,#LEN
launch2   jmp   *watch1,q1+LEN
      for 3

          dat    0,0

      rof

datzero   dat    0,0

watch1    dat    4000,7000

      for 3

          dat    0,0

      rof

datone    dat    1,1


;************** MACHINE

step EQU 70; mod-10
gate EQU top
away EQU (clr+1995+660) ; not really :-)

      mov.i  bomb-top,>-1
FOR 3
      dat 0,0
ROF
ptr:  mov.i  inc+1,>-step*10
top:  mov.i  bomb,>ptr          
scan: seq.i  2*step,2*step+5 
      mov.ab scan,@top
a:    sub.f  inc,scan
      jmn.b  top,@top
inc:  spl.i  #-step,{-step
      mov.i  clr,>-step-1
btm:  djn.f  -1,>-step-2
clr:  dat.f  <2667,clr+step+4
      dat 0,0
      spl.i  #-step,>-step
      dat 0,0
bomb: spl.i  0,0;#1,#1

machine
boot mov.i  clr,<dest
FOR 8
      mov.i  {boot,<dest
ROF
dest: mov.i  bomb,*away
      mov.i  {boot,<dest
      jmp @dest,{-1000

end

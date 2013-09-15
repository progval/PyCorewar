;redcode-94        
;name Enceladus v5
;author Ryan Coleman
;strategy p^2-->  paper // scissors
;strategy v5 move wlt table into empty scissor code
;assert 1


        
        
        
org think

PSTATE    EQU 666 ; pspace location containing current state
STATES EQU 3      ; maximum number of states for brainwash protection

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
      ; if you wish or the stp.a instruction.

c1 EQU boot             ;paper
c2 EQU hithigh            ;scissor

win_table
loss_table
init_state
dat 0,c1
dat 0,c1
dat 2,c2
  


;----------paper----------

len EQU 9

fcp EQU 3039          ;3039 - orig
scp EQU 2365          ;2365 - orig
tcp EQU 1777          ;777 - orig



boot     
        spl 1,<-4000  
        mov -1,0
        mov -1,0
        mov -1,0

        spl     @frog,  >-1000 
        mov     }-1,    >frog  
        dat     >-300,  <300   

                
frog    spl     @0,     <fcp-len
        mov     }-1,    >-1
        spl     @0,     <scp
        mov     }-1,    >-1
        spl     @0,     <tcp
        mov     }-1,    >-1
        mov     2,      <-1
        jmp     -1,     <-4010                ;orig - <-10
        dat     <2667,  <2667*2          

;------------scissor----------

STEP    equ    12
EXTRA   equ    3            ;orig -4
DJNOFF  equ    (-426-EXTRA)

        dat.f  #gate-10,  istep-gate+5
gate    dat.f  #gate-10,  sneer-STEP+1
dat2    dat.f  #gate-20,  istep-gate+5
dat1    dat.f  #gate-25,  istep-gate+5
site2   spl.a  #gate-30,  istep-gate+5
site    spl.a  #gate-40,  istep-gate+5
;for EXTRA
;        dat.f  0,         0
;rof
tie_table
dat 1,c1  
dat 2,c2
dat 2,c2

adder   sub.f  sweeper,   sneer
hithigh mov.i  istep,      *sneer
hitlow  mov.i  istep,      @sneer
sneer   sne.i  @gate+STEP*6-1-EXTRA, *gate+STEP*3-EXTRA  ;so we bomb 
step
looper  djn.b  adder,     <DJNOFF
setup   add.f  sneer,     gate
sweeper spl.a  #-STEP*4+1,<-STEP*4+1
mover   mov.i  @swinger,  >gate
swinger djn.b  mover,     {site
istep    dat.f  <STEP,     <-STEP


;rant is here
;50 is too small for good qscans, so pspacers should score better.
;Pspacers hard to fit into 50
;small components used
;some constants changed
;table-based switcher switches from paper to scissor after 2 
;consecutive ties.  Yes, ties.  Reasoning, paper only ties to other 
;papers -- scissor beats paper-more points.
;we'll just see if it works


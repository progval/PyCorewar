;redcode-94
;name Type Three Quantum Singularity
;author Philip Kendall
;strategy A P^2 switcher doing win -> Carbonite, loss -> Timescape,
;strategy tie as last round. Also with a couple of suicidial states
;strategy to ensure a perfect score in self-fights, a special first
;strategy round 'do nothing' loop to work out when we're fighting
;strategy ourself, and a decoy which points towards Carbonite to
;strategy reduce the number of ties.
;assert CORESIZE==8000 && MAXCYCLES==80000

	for     49
	dat.x   0,(carb+3)
	rof

dbomb   dat     >-1, >1
carb    spl     #0, <-100
	mov     dbomb, tar-197*3500
tar     add     #197, -1                ; gets bombed to start coreclear
	djn.f   -2, <-1151

	for     8		; must be followed by 8 dats
	dat.f   0,0
	rof

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

	for     2		; must be followed by 2 dats
	dat.f   0,0
	rof

pState  equ     138     ; pspace location containing current state
nStates equ     4       ; maximum number of states (for brainwash protection)

;NOTE: state values go from 0 to STATES-1

	dat.f   0,init-state
in      dat.f   0,loss_t-state
	dat.f   0,win_t-state
	dat.f   0,tie_t-state

think   ldp.a   #0,in              ; get input value
load    ldp.a   #pState,state      ; load old state
	mod.a   #nStates,state     ; brainwash protection
	add.ba  *in,state          ; select correct state table
store   stp.a   *state,load        ; store new state
state   jmp.a   @0                 ; jump to warrior code

init    dat.f   0,first
win_t   dat.f   1,carb
	dat.f   1,carb
	dat.f   2,suicide
	dat.f   2,suicide
tie_t   dat.f   0,time
	dat.f   1,carb
loss_t  dat.f   0,time
	dat.f   0,time
suicide dat.f   3,suicide
	dat.f   0,time

first   mov.ab  #7996,count        ; wait around for ~80000 cycles
count   djn.b   0,#0
	djn.b   first,#10

	; if we haven't lost yet, we're almost certainly fighting
	; ourself, so enable the suicide routine

	mov.i   (win_t+2),init
	jmp.a   store
	
	end     think

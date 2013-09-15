;redcode-94
;name Spring Tides
;author Ian Oversby
;strategy Stone and One-shot
;strategy based on Phil Kendall's thing (and Tides)
;strategy I think his thing is better :-(
;strategy If I had time, I would put Khayman before this too
;strategy or that imp/stone / blur thing I thought about
;strategy or that imp/paper just to annoy people :-)
;strategy This will have to do
;assert CORESIZE==8000

dbomb dat    >-1,>1
in    dat    0,loss_table-state
p     spl    1,win_table-state
      spl    1,tie_table-state

PSTATE EQU 420 ; pspace location containing current state
STATES EQU 10  ; maximum number of states (for brainwash protection)

;NOTE: state values go from 0 to STATES-1

w0	equ	cboot	; Carbonite
w1	equ	oboot	; Guessed

think ldp.a  #0,in              ; get input value
load  ldp.a  #PSTATE,state      ; load old state
      mod.a  #STATES,state      ; brainwash protection
      add.ba *in,state          ; select correct state table
store stp.a  *state,load        ; store new state

win_table
state jmp    @0,w0              ; jump to warrior code

init_state
      spl    #0,w0
      spl    #0,w0
      spl    #0,w0
      spl    #4,w1
      spl    #4,w1
      spl    #4,w1
      spl    #4,w1
      spl    #8,w0
      spl    #9,w1

tie_table      
      spl    #0,w0
      spl    #0,w0
      spl    #0,w0
      spl    #0,w0
      spl    #4,w1
      spl    #4,w1
      spl    #4,w1
      spl    #4,w1
      spl    #8,w0
      spl    #9,w1

loss_table      
      spl    #1,w0
      spl    #2,w0
      spl    #3,w0
      spl    #4,w1
      spl    #5,w1
      spl    #6,w1
      spl    #7,w1
      spl    #8,w0
      spl    #9,w1
      spl    #0,w0

;-----------
;CARBONITE++
;-----------

caway EQU (-3000)

cboot mov tar+1,<cdest
      mov tar,<cdest
      mov tar-1,<cdest
cdest mov dbomb,*caway
      spl <cdest,<2000
      mov tar-2,@cdest
      div.f #0,cdest
      spl    #0,<-1151+3
      mov    197,tar-197*3500
tar   add.ab {0,}0    
      djn.f  -2,<-1151

;-------
;Guessed
;-------

gate	equ	(ost-8)
odist	equ	540

ogate	DAT.F	#fst-gate,	#6

ost	ADD.F	snd,	scan
scan	SNE.I	108,	100
	DJN.F	-2,	@scan
	ADD.B	scan,	gate	
snd	SPL.B	#16,	<16
	MOV.I	*gate,	>gate
	MOV.I	*gate,	>gate
	DJN.F	-2,	{-930
	DAT.F	<5334,	<2667
fst	SPL.B	#12,	#20
oloc	DAT.F	$0,	$0

oboot	MOV.I	ogate,	<obptr
for 10
	MOV.I	<oloc,	{obptr
rof
	SPL.B	*obptr,	>-200
obptr	DIV.F	#odist,	#odist-8-10+1
	DAT.F	}-200,	>-30

end think

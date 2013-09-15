;redcode-94
;name Reindeer
;strategy Stone/Antler/Scanner
;author Ian Oversby
;assert 1

;--------------
;Anti Imp-stone
;--------------

ddist	equ	3720
ist	equ	2667

impboot spl     1      ,#0
	spl     1      ,#0
	spl     <0     ,#vector+1
	djn.a   @vector,#0

imp     mov.i   #ist, *0

	jmp     imp+ist*7,imp+ist*6   
	jmp     imp+ist*5,imp+ist*4   
	jmp     imp+ist*3,imp+ist*2   
vector  jmp     imp+ist  ,imp
        
boot	MOV.I	{dcptr,	<dptr
for 5
	MOV.I	{dcptr,	<dptr
rof
	SPL.B	impboot
dptr	JMP.B	ddist,	#ddist+4

dgate	DAT.F	#0,	#100
dbmb	DAT.F	<5334,	<2667
	SPL.B	#0,	<dgate-2667
dcptr	SPL.B	#3,	<dgate-2667
	MOV.I	dbmb,	>dgate
	DJN.F	-1,	{dgate

;--------
; P-Brain
;--------

dbomb dat    >-1,>1
in    dat    0,loss_table-state
p     spl    1,win_table-state
      spl    1,tie_table-state

PSTATE EQU 123 ; pspace location containing current state
STATES EQU 10  ; maximum number of states (for brainwash protection)

;NOTE: state values go from 0 to STATES-1

w0 EQU cboot	; Carbonite
w1 EQU boot	; Antler
w2 EQU sboot	; Silver Talon

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
      spl    #5,w1
      spl    #6,w1
      spl    #9,w2

tie_table      
      spl    #0,w0
      spl    #0,w0
      spl    #0,w0
      spl    #0,w0
      spl    #4,w1
      spl    #5,w1
      spl    #6,w1
      spl    #7,w1
      spl    #8,w1
      spl    #9,w2

loss_table      
      spl    #1,w0
      spl    #2,w0
      spl    #3,w0
      spl    #4,w1
      spl    #5,w1
      spl    #6,w1
      spl    #7,w1
      spl    #8,w1
      spl    #9,w2
      spl    #9,w2

	spl.b	#1,	>1
	spl.b	#1,	<1
	spl.b	#1,	{1
	spl.b	#1,	}1

;-----------
;CARBONITE++
;-----------

caway EQU (-100) ; not the actual value

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

;-------------
; Silver Talon
;-------------

sdist	equ	4765
spos	equ	(clr+1)

sboot	mov.i	<spos,	<sptr
for 9
	mov.i	<spos,	<sptr
rof
	spl.b	*sptr,	<-701
sptr	div.f	#sdist,	#sdist+9
	dat.f	}300,	>200

head	spl.b	#-4,	-2400		
loop	mov.i	head,	>head		
	add.f	step,	scan		
scan	cmp.i	}4,	0		
	mov.b	scan,	@loop	
	djn.b	loop,	#999		
step	spl.b	#-152,	>-152		
	mov.i	clr,	>head-5
	djn.f	-1,	>head-5
clr	dat.f	>1,	#18		

END think

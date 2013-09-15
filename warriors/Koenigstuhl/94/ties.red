;name Ties, Ties, Ties! (+3)
;author Ross Morgan-Linial
;strategy Paper + infinite imp spiral
;strategy Tinkered with spiral - now
;strategy with increment-stream
;strategy
;strategy Now pswitched with tornado!
;strategy Mabie I'll do okay!
;strategy
;strategy Compact preprimed imp-pump
;strategy fixed ANOTHER bug in the pump...
;strategy will it work NOW?
;strategy
;strategy spiral  spl     0,		>start-1
;strategy         add.a   #2668,        launch
;strategy launch  jmp     imp-2668,	<-2
;strategy imp     mov.i   #0,          	2667
;strategy         mov.i   #0,          	2667
;strategy         mov.i   #0,          	2667

;assert CORESIZE==8000

_PREV	equ	111	;changed

start
result	ldp.ab	#0,		#0
	ldp.a	#_PREV,		prev
	sne.ab	#0,		result
	add.a	#1,		prev
	mod.a	#2,		prev
	stp.ab	prev,		#_PREV
prev	jmp	@0,		#paper
	dat	#0,		#w1

;tornado, stolen from Armory-A5

dms     equ     25
dmd     equ     -2500
step    equ     -45               
djnoff  equ     -2205
bootd	equ	1000		;changed
B	equ	24

;boot (mine)
dta	dat	gate,	gate+bootd
w1	mov	}dta,	>dta
	djn	-1,	#8
	add.ab	#B,	dta
	mov	}dta,	>dta
	djn	-1,	#9
	jmp	bombs+bootd+B

gate    dat     -100,   100
        dat    <-10,   <2667           ;anti imp bit
        dat     -4000,   djmp-gate+2
stclr   spl     #-3000,  djmp-gate+2
tclear  mov     @djmp,  >gate
        mov     @djmp,  >gate
djmp    djn.b   tclear,  {stclr
        dat     0,0
        dat     0,0

bombs   spl     #step,  -step           ;hit spl
start1  sub     incr,   @b1           
stone   mov     (0*step)+jump2,*(1*step)+jump2
b2      mov     bombs,  @stone
b1      mov     bombm,  *stone
jump2   djn.f   start1, <djnoff         ;hit by spl
        jmp     stclr-B,  0     
incr    dat     >-3*step,>-3*step      
last
bombm   mov     {step,   1

hack	for	41
	dat	0,		0
	rof

;paper module, stolen from Grilled Octopus
;non-booted (of course)
dest0   equ   2200
dest1   equ   3740
dest2   equ  -1278                   ; pmars optimized
range   equ    933                   ; pmars optimized

paper	SPL	spiral
        SPL.B   1,              #0    ;\.
	SPL.B   1,              #0    ;-> generate 8 processes
	SPL.B   1,              #0    ;/.

silk    SPL.B   @0,             {dest0
	MOV.I   }-1,            >-1
silk1   SPL.B   @0,             <dest1
	MOV.I   }-1,            >-1
	MOV.I   ibomb,          }range
	MOV.I   {silk1,         <silk2
silk2   JMP.B   @0,             >dest2
ibomb   DAT.F   235,          	1
;	STP	#2772,		#300
;	JMP	-1,		>-1
	dat	0,		0
	dat	0,		0
	
	for	6
	dat	0,		0
	rof

; continuous imp spiral

spiral  spl     0,		>start-1
        add.a   #2668,          launch
launch  jmp     imp-2668,	<-2
imp     mov.i   #2667,          *0
        mov.i   #2667,          *0
        mov.i   #2667,          *0

	END	start


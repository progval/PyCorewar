;redcode-94 test
;name Paper :-)
;author Ian Oversby
;strategy The all-new paper
;strategy Reasonable performance against stones!
;strategy Bomb dodgers against the bombers
;strategy optimize seperately for:
;strategy 	Torch/DamInc/CIA and
;strategy 	Probe/Tornado3 
;strategy
;strategy Antler against Impish/Gigolo
;strategy
;strategy Pray for the others and lose against Sandstone :-(
;strategy I hope the thing switches at the right time or
;strategy I am stuffed.
;assert 1

;---------
; P-Logic
;---------

w1	equ	dboot	; Dodger
w2	equ	atboot	; Anti-tornado
w3	equ	boot	; Antler
w4	equ	boot	; The Machine (Not)

plc	equ	217

loss	dat.f	#0,	#1
win	dat.f	#0,	#-1
tie	dat.f	#0,	#0

pcode	ldp.a	#0,	loss
	ldp.a	#plc,	table
	add.ba	*loss,	table
	mod.a	#19,	table	; (-1 mod 19) = 0 :-)
	stp.ab	*table,	#plc
table	jmp.b	@0,	w1	; State 0

	dat.f	#1,	w1	; Dodger
	dat.f	#2,	w1
	dat.f	#3,	w1
	dat.f	#4,	w1

	dat.f	#6,	w2	; Must always waste one line :-(
	dat.f	#6,	w2	; Stone
	dat.f	#7,	w2
	dat.f	#8,	w2
	dat.f	#9,	w2

	dat.f	#11,	w3	; Must always waste one line :-(
	dat.f	#11,	w3	; Scanner
	dat.f	#12,	w3
	dat.f	#13,	w3
	dat.f	#14,	w3
	dat.f	#15,	w3	

	dat.f	#17,	w4	; Must always waste one line :-(
	dat.f	#17,	w4	; Paper

	dat.f	#17,	w4	; Safety net

;-----------
; Dodger
;-----------

str	equ	(dodge-150)

atboot	MOV.A	#5,	dodge+1

dboot	MOV.I	<ddp,	{ddp
for 8
	MOV.I	<ddp,	{ddp
rof
ddp	JMP.B	-210,	#dirbmb+1
dodge	JMZ.F   dodge,	<str
        ADD.AB  #1,     str
        MOV.I   {fir,   <str
        DJN.B   -1,     #4
        JMP.B   @str,   <-4000
fir     SPL.B   #4,     <-10
        MOV.I   dirbmb, <bptr
bptr    DJN.B   -1,     #-5
dirbmb  DAT.F   }1,     <-12	; Present for DI :->

;--------------
;Anti Imp-stone
;--------------

idist	equ	2200
ddist	equ	3720
st	equ	2667

boot	MOV.I	{dcptr,	<dptr
	SPL.B	iboot,	<-200
for 5
	MOV.I	{dcptr,	<dptr
rof
dptr	JMP.B	ddist,	#ddist+4

dgate	DAT.F	#0,	#100
dbmb	DAT.F	<5334,	<2667
	SPL.B	#0,	<dgate-2667
dcptr	SPL.B	#3,	<dgate-2667
	MOV.I	dbmb,	>dgate
	DJN.F	-1,	{dgate

iboot  	MOV.I   <iloc1, {ipos1
for 4
   	MOV.I   <iloc1, {ipos1
rof
ipos1   JMP.B   boot+idist, <-200

spin    SPL.B   #0,     >prime
prime   MOV.I   impy,   impy
        ADD.F   #st+1,  jump
jump    JMP.B   impy-st-1, <-535
impy    MOV.I   #st,    *0
iloc1   DAT.F   $0,     $0

end pcode

for 9
	spl.b	#1,	>1
	spl.b	#1,	{1
	spl.b	#1,	<1
rof

;-----------
;The Machine
;-----------

step	equ	2430	; Slightly better against Sandstone
gate	equ	top
away	equ	2000
bomb	equ	(bmb+3)

ptr	spl	#0,	step
top	mov.i  bomb,>ptr          
scan	seq.i  2*step,2*step+5 
	mov.ab scan,@top
a	sub.f  inc,scan
	jmn.b  top,@top
inc	spl.i  #-step,>-step
	mov.i  clr,>gate
btm	djn.f  -1,>gate
clr	dat.f  <2667,clr-gate+2

bmb	spl.i  #1,#1
mboot	mov.i  clr,<dest
for 8
	mov.i  {mboot,<dest
rof
dest	mov.i  bmb,*away
	spl @dest,{-1000
	mov.i  {mboot,<dest
	dat <dest,<dest
	mov.i  {-8,<1

end pcode

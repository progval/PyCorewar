;redcode-94 verbose
;name Blurstone
;author M. J. Pihlaja
;strategy Is it a scanning stone? Is it a stoning scanner?
;strategy Read 'stone' with a grin on your face.
;strategy  - testing some anti-stone features
;assert CORESIZE==8000

load0
z	for	0
	rof

;***** Blurstone
; Not quite Blur.  It needs either a longer scanning phase (like Fire & Ice)
; or a pass or two clearing with spl before moving on to dat clearing.
; Perhaps the later is what Eraser does.

STEP	equ	3510
gate	equ	(cptr-2)
N	equ	-1
x	equ	5

cptr	mov.ab	@scan	,	#-2500
	mov	step	,	>cptr
sp	sub	step	,	@scan
sptr	mov	-5-(N*STEP)+x,	<1-(N*STEP)+x
scan	jmz.f	-3	,	<sptr
	jmn.a	@sp-1	,	@scan
step	spl	#-STEP	,	-STEP-1
	mov	bdat	,	>gate
	djn.f	-1	,	>gate
bdat	dat	>5335	,	bdat+3-gate

z	for	25
	dat	0	,	0
	rof

DIST	equ	(scan-load0+1504)

boot	mov	>src	,	>dst
	mov	>src	,	>dst
	mov	>src	,	>dst
	mov	>src	,	>dst
	mov	>src	,	>dst
	djn	boot	,	#2
	sub	#7	,	dst
src	spl	@dst	,	cptr
dst	div.f	#0	,	#load0+DIST

z	for	20
	dat	0	,	0
	rof

; decoy and crude brainwash with spl/stp pairs
z	for	4
	spl	#1	,	}1
	stp.a	#CORESIZE/32,	#1
	spl	#1	,	{1
	stp.a	#CORESIZE/32,	#1
	spl.a	#1	,	}1
	stp.a	#1	,	#1
	spl.a	#1	,	{1
	stp.a	#0	,	#1
	rof

	end	boot


;redcode
;name Blurstone '88
;author M. J. Pihlaja
;strategy Blur like scanner.
;strategy - more resistant against stones?
;assert CORESIZE==8000

STEP	equ	70

; with ending gate
x	equ	-2

top	mov	sptr	,	@1
	mov	bspl	,	<cptr
	sub	step	,	sptr
sptr	mov	STEP+x	,	<STEP+1+5+x
scan	jmz	-3	,	<sptr
	jmz	top	,	top-7
bspl	spl	0	,	<-STEP+1
	mov	step	,	<top-6
tp	djn	-1	,	<top-7+2667	;top-7+4
step	dat	<-STEP	,	#-STEP-1
cptr	dat	<-STEP	,	#-4500

	end	sptr


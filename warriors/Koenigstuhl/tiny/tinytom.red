;redcode-94x verbose
;name Tiny Tom
;author M Joonas Pihlaja
;strategy clear, clp
;assert 1

load0
z for 0
  rof

	org	think

; switch on loss, state 0 on tie

state	equ	(load0+30)

think	ldp	}state	,	state
	ldp.ab	state	,	@state
	stp.a	@state	,	<state+1
	jmz.b	clp	,	@state+1

	mov.i	clr+4	,	#0
gate	equ	(clr-2)
clr	spl	#-250	,	clr+5-gate
	mov	-1	,	>gate
	mov	-2	,	>gate
	djn.a	-2	,	{clr
	dat	clp-27+DIST,	clr+5-gate


; tiny clp
DIST	equ	509	; 5093 -> 409
pb	equ	(clp-1)
cp	equ	(px+1)

clp	sub.a	#DIST	,	{px		; .x -> .a
	mov	{px	,	*fptr
	mov.f	px	,	cp
	mov	}px	,	@fptr
	mov	}px	,	{pb		; ,>pb -> ,{pb
fptr	sne	clp-26	,	cp+20
	jmp	-2	,	{px
	mov	}cp	,	>cp
	jmn.a	-1	,	cp
px	jmp	*clp	,	>clp+DIST-2

	end


;redcode-94x verbose
;name Tiny Tim
;author M Joonas Pihlaja
;strategy stone,paper
;assert 1

load0
z for 0
  rof

	org	think

; stone
STEP	equ	315

w1
stn	spl	#STEP	,	<-STEP
	mov	{0+STEP	,	2-STEP
	add	-2	,	-1
	djn.f	-2	,	<stn-STEP
	mov	3	,	>stn-2
	djn.f	-1	,	>stn-2
	dat	>268	,	1-stn+2
	dat	>535	,	1-stn+2

; switch on loss, state 0 on tie
;state	equ	(load0-3)
state	equ	(load0-250)

think	ldp	}state	,	state
	ldp.ab	state	,	@state
	stp.a	@state	,	<state+1
	jmz.b	w1	,	@state+1

; paper
d2	equ	-305
d3	equ	350

w2	spl	2	,	}paper+5	; create paper bomb
	spl	1	,	>paper+5
	spl	1	,	{400+6
paper	spl	@0	,	{d2
	mov	}-1	,	>-1
	mov	3	,	>-2
	mov	{-3	,	{1
	jmz.a	d3	,	*0

	end


;redcode-94x
;name Y.A.O.S.
;author Ben Ford
;strategy Y.et A.nother O.ne S.hot
;strategy a 0.66c z-shot variant
;assert CORESIZE==800 && MAXLENGTH==20

gate	equ	(bye-3)
step	equ	310	; 3910
init	equ	(gate+step)

	dat	<gate,	{7
	spl	#gate,	{8
bye	spl	#init,	{init+7
clr	mov	@bmbp,	>gate
	mov	@bmbp,	>gate ; .67c clear
bmbp	djn	clr,	{bye  ; .33c djn

	dat	0,	0
	dat	0,	0
	dat	0,	0
	dat	0,	0

loop	add.f	inc,	bye
star	sne	*bye,	@bye	; .66c scan
	djn	loop,	#161
	mov.ab	@star,	gate
	jmp	@star,	<gate
inc	dat	#step,	#step

for	MAXLENGTH-CURLINE
	dat	0,	0
rof

end	star

;redcode
;name lockdown
;author Ben Ford
;assert MAXPROCESSES==8
;strategy a strange scanner

STEP	equ	194
INIT	equ	(schk+2*STEP)
GATE	equ	(sptr-3)

sptr	mov	 STEP,	{INIT
sadd	add.ab	{   0,	}   0	; invisible
scan	jmz.f	 sadd,	@sptr
schk	mov	 sjmp,	@sptr
	jmn	@schk,	*   0
	spl	#   0,	    0	; invisible
	mov	 sbmb,	>GATE
sjmp	jmp	{   0,	}   0   ; invisible
sbmb	dat	#  -1,	#  15

for	sptr+STEP
	dat         0,	    0
rof

	jmp	#   1,	<   1

end	scan


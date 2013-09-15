;redcode-94lp
;name lp-Shot v0.1
;author Ben Ford
;strategy oneshot -> jjd clear
;assert CORESIZE==8000 && MAXPROCESSES==8

gate	equ	(bye-3)
step	equ	4961
time	equ	2076
init	equ	(-1-time*step)

loop	add.a	#step,	bye
star	jmz.f	loop,	*bye	; .5c scan
	mov.ab	@star,	gate
	jmp	clr,	<gate

for	89
	dat	0,	0
rof

	dat	<gate,	{10
	jmp	#gate,	{11
bye	jmp	#init,	{11	; scanned
clr	mov	@bmbp,	>gate
	mov	@bmbp,	>gate	; .66c clear
bmbp	djn	clr,	{bye	; .33c djn
	jmp	{0,	}0

	end	star

_____________________________________________________________________________________
Get more from the Web.  FREE MSN Explorer download : http://explorer.msn.com



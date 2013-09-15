;redcode-94x
;name Dusting Webs
;author Ben Ford
;strategy pspace -> clear/silk
;assert (CORESIZE==800) && (MAXLENGTH>=20)

top	equ	silk

; mode 1
; ***** PAPER *****

dst1	equ	305
dst2	equ	350

silk	spl	    1,	{ 400
	spl	    1,	{ 600

pap1	spl	@   0,	>dst1
	mov	}pap1,	>pap1
	mov	{pap1,	{pap2
pap2	jmz.a	 dst2,	*   0

; ***** BRAIN *****
; switch on loss, mode 0 on tie

mode	equ	(top-250)

brain	ldp	}mode,	 mode
	ldp.ab	 mode,	@mode
	stp.a	@mode,	<mode+1
	jmz.b	 silk,	@mode+1

; mode 0
; ***** CLEAR *****

clen	equ	(cbmb-cptr+3)
cinc	equ	10

cadd	add	#cinc,	 cptr
	jmz.f	 cadd,	@cptr
cptr	djn.b	 cspl,	#  35
	dat	# -10,	{clen
cspl	spl	# -10,	{clen
cmov	mov	@cbmb,	>cptr
	mov	@cbmb,	>cptr
	mov	@cbmb,	>cptr
cbmb	djn.f	 cmov,	{cspl

; *****  END *****

end	brain

;redcode-94x
;name Tiny Netpaper
;author David Houston
;strategy Paper carrying a distributed mov/mov/add
;strategy bomber.
;assert CORESIZE == 800

org	boot

;-----------------------------------------------------
; Boot

bpdist	equ	300

zero
boot	mov	<bpptr, {bpptr
	spl	2, <612
	spl	2, <740
	spl	1, <638
	mov	<bpptr, {bpptr
	mov	<bpptr, {bpptr
bpptr	jmp	zero + bpdist + 10, pap1 + 10

;-----------------------------------------------------
; Netpaper!

poff1	equ	66
poff2	equ	171
poff3	equ	701

pkill	equ	442
phop	equ	138
pstep	equ	795

	spl	1, <728
pap1	spl	@0, {poff1
	mov	}pap1, >pap1
pap2	spl	@0, <poff2
	mov	}pap2, >pap2
	mov	bomb, >pkill
	mov	bomb, <-1 + poff2
	add	#pstep, -2 + 2*poff2
	mov	{pap2, <pap3
pap3	djn.f	@0, >poff3
bomb	dat	>267, >phop

end

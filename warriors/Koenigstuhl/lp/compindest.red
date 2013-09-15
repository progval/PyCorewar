;redcode-lp
;name Completely Indestructible v1.0
;author Ian Sutton
;strategy Paper which is hard to kill.
;assert CORESIZE == 8000

step	equ	3337

	org	boot

boot	mov	#7, #0
	mov	<-1, {bptr
	jmn.b	-1, @boot
bptr	spl	-step+100, 1	; only split to a new copy if we can
	add.a	#step, bptr	; pseudo random step since it adds even if we
				; don't split
	jmp	boot, 1
	dat	1, 1

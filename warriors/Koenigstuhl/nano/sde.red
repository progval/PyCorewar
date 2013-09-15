;redcode-fancy
;name sde
;author LG
;assert (CORESIZE==80)

	add.a   #24	, imp
	mov	imp	, *imp
	spl	*imp	, 0
	jmp	-3
imp	mov.i #0	, 1

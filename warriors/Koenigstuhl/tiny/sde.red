;redcode-fancy
;name sde
;author LG
; (CORESIZE==80)
;assert 1

	add.a   #24	, imp
	mov	imp	, *imp
	spl	*imp	, 0
	jmp	-3
imp	mov.i #0	, 1

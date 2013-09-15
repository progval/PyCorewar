;redcode-b verbose
;name Fire-master 1.3
;author P._V._K.
;strategy Bigger, faster (1.33 c with the decrements)
;assert 1

cptr	dat.f	sb,	0
db	dat.f	sb+1,	12
sb	spl	#1,	12
	mov.i	*cptr,	>cptr
	djn.b	-1,	<-20

	dat.f	100,	0

start	add.f	inc,	1
	sne.i	{-2,	{3
	jmp	-2

	mov.ab	-2,	cptr
	jmp	sb

inc	dat.f	3510,	3510
	end	start

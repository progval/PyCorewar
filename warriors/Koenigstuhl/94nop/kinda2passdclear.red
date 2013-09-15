;redcode
;name kinda 2-pass dclear
;author P._V._K.
;assert 1	

cptr	dat.f	1,	100
	spl	#db+1,	8

	mov.i	*cptr,	>cptr
start	spl	-1,	>cptr-1; the key is here
	mov.i	*cptr,	>cptr
	jmp.b	-2,	>cptr-1
db	dat.f	1,	8

	end	start-1

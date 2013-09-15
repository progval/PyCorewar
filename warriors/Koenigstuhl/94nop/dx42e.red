;redcode-94nop
;name dx42e
;author inversed
;strategy Untypical scanner: fixlen ongoing spl carpet
;assert (CORESIZE==8000) && (MAXPROCESSES==8000)

h	equ	8
zofs	equ	bi
gap1	equ	6
gap2	equ	2
cnt	equ	h
bi	equ	2*h*7
check	equ	(wipe-1)
decoy	equ	3011
bomb	equ	bptr
cptr	equ	(bptr-3)
org	start

wipe	mov	bomb,	>bptr
	mov	*wipe,	>bptr
tst	djn	wipe,	#cnt
e1	mov	#cnt,	tst
	for	gap1
	dat	0,	0
	rof
bptr	spl	#0,	decoy
loop	add	inc,	ptr
ptr	sne	zofs,	zofs+h
	add	inc,	ptr
	sne	*ptr,	@ptr
stst	jmz.f	loop,	check
	mov.ab	ptr,	bptr
start	spl	wipe,	0
	jmn.a	loop,	ptr
inc	spl	#bi,	bi
	mov	kill,	>cptr
last	djn.f	-1,	>cptr
	for	gap2
	dat	0,	0
	rof
kill	dat	0,	(last-cptr+4)




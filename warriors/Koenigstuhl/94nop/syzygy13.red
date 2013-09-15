;redcode-94
;name Syzygy 1.3
;author Philip Kendall
;strategy Scan / spl carpet -> spl/spl/dat coreclear
;strategy 1.3: major rewrite
;assert CORESIZE==8000

scan1	equ	109
sep	equ	5
step	equ	15
bomblen equ	10
stream	equ	(-211+loop)
cstart	equ	(cptr+5-ptr)
ptr	equ	(dbomb-5)

dbomb	dat.f	-20,cstart
sbomb	spl.a	#0,cstart
loop	add.f	inc,scan
scan	sne.i	scan1,scan1+sep
	add.f	inc,scan
	sne.i	*scan,@scan
	djn.f	loop,<stream
	mov.ab	#bomblen,count
bloop	mov.i	sbomb,}scan
count	djn.b	bloop,#0
	sub.a	#bomblen,scan
	jmn.a	loop,*0
inc	spl.a	#step,>step
clear	mov.i	@cptr,>ptr
	mov.i	@cptr,>ptr
cptr	djn.b	clear,{sbomb

	end	scan

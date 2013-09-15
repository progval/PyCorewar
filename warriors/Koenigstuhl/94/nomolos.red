;redcode-94
;name Nomolos
;author Ian Oversby
;strategy Stone, One-shot Scanner
;strategy then try to tie
;strategy v2 Added mini-HSA
;strategy One scanner is never enough :-)
;assert 1

;--------
; Paper
;--------

pdist	equ	4000	; Not really

dist0	equ	5689
dist1	equ	1021
dist2	equ	3607
range1	equ	4723
range2	equ	6892

pboot	spl.b	1,	<-300
for 6
	mov.i	<pptr,	{pptr
rof
pptr	jmp.b	pdist,	#bomba+1

	mov.i	-pdist+5,	#0
	mov.i	-1,	#0
	mov.i	-1,	#0
silk	spl.b	@0,	<dist0
	mov.i	}-1,	>-1
silk1	spl.b	@0,	<dist1
	mov.i	}-1,	>-1
	mov.i	bomba,	}range1
	mov.i	bomba,	>range1
	mov.i	{silk1,	<silk2
silk2	jmp.b	@0,	<dist2
bomba	dat.f	<2667,	<5334

;---------
; P-Logic
;---------

w1	equ	cboot
w2	equ	tboot
w3	equ	boot
w4	equ	pboot

plc	equ	123

init	dat.f	#0,	#0
loss	dat.f	#0,	#1
win	dat.f	#0,	#-1
tie	dat.f	#0,	#0

pcode	ldp.a	#0,	loss
	ldp.a	#plc,	table
	add.ba	*loss,	table
	mod.a	#19,	table	; (-1 mod 19) = 0 :-)
	stp.ab	*table,	#plc
table	jmp.b	@0,	w1	; State 0

	dat.f	#1,	w1	; Stone
	dat.f	#2,	w1
	dat.f	#3,	w1
	dat.f	#4,	w1

	dat.f	#6,	w2	; Must always waste one line :-(
	dat.f	#6,	w2	; One-shot
	dat.f	#7,	w2
	dat.f	#8,	w2
	dat.f	#9,	w2
	dat.f	#10,	w2

	dat.f	#12,	w3	; Must always waste one line :-(
	dat.f	#12,	w3	; Mini-HSA
	dat.f	#13,	w3
	dat.f	#14,	w3
	dat.f	#15,	w3

	dat.f	#17,	w4	; Paper
	dat.f	#17,	w4

	dat.f	#17,	w4	; Safety net

;----------
; Mini HSA
;----------

mst	equ	9
ptr	equ	(bomb-5)

away	equ	5000

bomb	spl    #1,{1
kill	mov    bomb,<ptr
mptr	mov    >ptr,>ptr
	jmn.f  kill,>ptr
a	add    #mst+1,@mptr
scan	jmz.f  a,<ptr
	slt    @mptr,#btm-ptr+3
	djn    kill,@mptr
	djn    a,#16
btm	jmp    a,{kill
hp	dat.f	0,	-1

boot	mov    btm,@dest
for 4
	mov	<hp,<dest
rof
	djn.b	-4,	#2
	spl    @dest,1
dest	mov    #250,@away
	mov    bomb,<dest
	div.f  #0,dest

;-----------
;CARBONITE++
;-----------

caway	EQU	1800	; not really

cboot	mov	tar+1,	<cdest
	mov	tar,	<cdest
	mov	tar-1,	<cdest
cdest	mov	dbomb,	*caway
	spl	<cdest,	<2000
	mov	tar-2,	@cdest
	div.f	#0,	cdest
	spl	#0,	<-3000+3
	mov	197,	tar-197*3500
tar	add.ab	{0,	}0	
	djn.f	-2,	<-3000

dbomb	dat	>-1,	>1

;-----------------
; One-shot scanner
;-----------------

tgate	equ	(tloop-8)
half	equ	10
step	equ	(2*half)
dstr	equ	3001
tdist	equ	700

tpos	equ	(cptr+1)

tboot	mov.i	<tpos,	<tptr
for 4
	mov.i	<tpos,	<tptr
rof
	djn.b	tboot,	#2
	spl.b	*tptr,	<-202
tptr	div.f	#tdist,	#tdist+7
	dat.f	}-200,	>-303
	dat.f	#-25,	#cptr+4-tgate
	spl.b	#-20,	#20
b1	spl.b	#120,	#120-half
tloop	sub.f	tstep,	b1
	sne.i	*b1,	@b1
	djn.f	tloop,	<-dstr
tstep	spl.b	#-step,	<-step
	mov.i	@cptr,	>tgate
	mov.i	@cptr,	>tgate
cptr	djn.b	-2,	{b1

end pcode

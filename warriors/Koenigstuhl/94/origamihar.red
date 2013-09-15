;redcode-94
;name Origami Harquebus
;strategy I've got an Harquebus...
;strategy ...fabricati diem, pvnc!
;strategy scanner/paper
;author mjp
;assert 1

load0 z	for 0
	rof

len	equ	10

;=========
; paper
;

pdist	equ	2300

d1	equ	1137	;4431	;1137	;4583	;1354
d2	equ	4372	;3151	;4372	;3462	;6277

i1	equ	5380	;	;	;	;

pap	nop	0	,	0
	spl	1	,	<1
	jmn	-1	,	#1+2+4

	spl	@0	,	}-d1
	mov	}-1	,	>-1
	spl	@0	,	}-i1
	mov	}-1	,	>-1
	mov	{-2	,	<1
	spl	@0	,	>d2
	mov.i	#2*i1	,	}-i1

z	for	28
	dat	0,0
	rof

;============
; Mini-HSA
;

sdist	equ	1900
slen	equ	len

ptr	equ	(bspl-6)

top
bspl	spl	#1	,	}1
wipe	mov	bspl	,	<ptr
pptr	mov	>ptr	,	>ptr
	jmn.f	wipe	,	>ptr
	add	#7+1	,	@pptr
scan	jmz.f	-1	,	<ptr
	slt	@pptr	,	#bot-ptr+4
	jmp	wipe	,	<ptr
	djn	scan-1	,	#13
	jmp	scan-1	,	{wipe
bot

z	for	29
	dat	0,0
	rof

;========
; think
;
; switch-on-two-losses-or-ties

state	dat	0	,	10	;s1
	dat	pap-top	,	3	;p1
	dat	0	,	6	;s0
	dat	pap-top	,	7	;p0
tab	dat	0	,	3
	dat	0	,	4
think	ldp.a	#0	,	@3
	ldp.ba	tab	,	state
	mod.ba	*tab	,	state
	stp.b	*state	,	tab
	add.ab	*state	,	bootp
z	for	len
	mov	<bootp	,	{bootp
	rof
bootp	spl	*load0+sdist+slen,top+slen
	mov	#-sdist+350,	load0+sdist+(ptr-top)

	end	think


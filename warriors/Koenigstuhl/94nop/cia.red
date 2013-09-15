;redcode-94
;name C I A
;author Anders Ivner
;assert (CORESIZE == 8000)
;strategy .5c bomber with intelligence bombs

STEP	equ	3119
A	equ	(c-1)
BOFF	equ	2500
SPYOFF	equ	STEP*1400

eye	equ	(A-SPYOFF)
spy	equ	(A+SPYOFF)
bomber	equ	(b0+BOFF)

	org	boot

bpt	dat	bomber-11,bomber
bpt2	dat	(spy+BOFF),0
boot	mov	b0,	@bpt
	mov	{boot,	<bpt
	mov	{boot,	<bpt
	mov	{boot,	<bpt
	mov	{boot,	<bpt
	mov	{boot,	<bpt
	mov	{boot,	<bpt
	mov	{boot,	<bpt
	mov	{boot,	<bpt
	mov	cb,	*bpt
	mov	{-1,	{bpt
	mov	#2000,	{bpt
	mov	spy0,	*bpt2
	spl	@bpt
	mov.f	#0,	bpt
	mov.f	#0,	bpt2

	dat	-1,	15
cb	spl	#-2,	15

start	spl	#0,	<-50
loop	add	c,	@ip
ip	mov	@ip,	@spy
	mov	@ip,	*spy
	jmz.b	loop,	eye
c	spl	#STEP,	<-STEP
	mov	@2,	>b0-13
	mov	@1,	>b0-13
b0	djn.b	-2,	{b0-11

spy0	dat	<-SPYOFF,	<-SPYOFF

i	for	MAXLENGTH-CURLINE
	spl	#i*17,	i*11
	rof

	end

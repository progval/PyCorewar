;redcode
;name Griffin 2
;author Anders Ivner
;strategy small spl/jmp bombing cmp-scanner
;assert 1

boot	mov	<spt,		<dpt
	mov	<spt,		<dpt
	mov	<spt,		<dpt
	mov	<spt,		<dpt
	mov	<spt,		<dpt
	mov	<spt,		<dpt
	mov	<spt,		<dpt
	mov	<spt,		<dpt
	mov	<spt,		<dpt
	mov	flip,		3000+flip-13
	mov	gate,		const+3000-132
spt	jmp	eyes+3000,	const+1
dpt	dat		#const+3000+1

gate	dat	<-21,		#0

flip	jmp	@4000,		3999

attack	mov	flip-13,	@eyes
dp	mov	bomb,		<eyes
	sub	flip-13,	@dp

eyes	cmp	bomb-132,	bomb-132+4000
	jmn	attack,		@dp
	add	const,		@dp
	djn	eyes,		#997

bomb	spl	0,		<-20
const	mov	-132,		<-132

	end	boot

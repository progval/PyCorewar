;redcode
;name Leprechaun 1b
;author Anders Ivner
;strategy Combined Bomber/B-scanner, giving a total speed of 67% of c
;assert 1

offset	equ	5016

boot	mov	<spt,		<dpt
	mov	<spt,		<dpt
	mov	<spt,		<dpt
	mov	<spt,		<dpt
	mov	<spt,		<dpt
	mov	<spt,		<dpt
	mov	<spt,		<dpt
	mov	<spt,		<dpt
	mov	<spt,		<dpt
	mov	<spt,		<dpt
	mov	bomb2+1,	bomb+17+2500
spt	jmp	start+2500,	bomb2+1
dpt	dat		#bomb2+2501

loop	add	#offset,	eye
start	mov	bomb,		@eye
eye	jmz	loop,		@offset+test+20
test	mov	eye,		eye-20
	mov	bomb2,		@eye-20
	mov	bomb,		<eye-20
pt	jmn	loop,		test
bomb	spl	0,		<-20
	mov	16,		<pt
bomb2	jmp	-1,		0

	dat	<-21,		#0

	dat		#1
	dat		#1
	dat		#1
	dat		#0
	dat		#1
	dat		#1
	dat		#1
	dat		#0

	dat		#1
	dat		#1
	dat		#1
	dat		#0
	dat		#1
	dat		#1
	dat		#1
	dat		#0

	dat		#1
	dat		#1
	dat		#1
	dat		#0
	dat		#1
	dat		#1
	dat		#1
	dat		#0

	dat		#1
	dat		#1
	dat		#1
	dat		#0
	dat		#1
	dat		#1
	dat		#1
	dat		#0

	dat		#1
	dat		#1
	dat		#1
	dat		#0
	dat		#1
	dat		#1
	dat		#1
	dat		#0

	dat		#1
	dat		#1
	dat		#1
	dat		#0
	dat		#1
	dat		#1
	dat		#1
	dat		#0

	dat		#1
	dat		#1
	dat		#1
	dat		#0
	dat		#1
	dat		#1
	dat		#1
	dat		#0

	dat		#1
	dat		#1
	dat		#1
	dat		#0
	dat		#1
	dat		#1
	dat		#1
	dat		#0

	dat		#1
	dat		#1
	dat		#1
	dat		#0
	dat		#1
	dat		#1
	dat		#1
	dat		#0

	dat		#1
	dat		#1
	dat		#1
	dat		#0

	end	boot

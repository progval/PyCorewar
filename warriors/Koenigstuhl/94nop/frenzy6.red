;redcode-94nop
;name frenzy v6
;author Lukasz Grabun
;assert 1
		org	boot

step		equ	2936

start		add	#step+step,2
		mov	bomb,	@1
		mov	bomb,	@1
cl		jmp	-3,	>-8		;hit to start clear
		mov	dbomb,	>start-4
		djn.f	-1,	>start-4
dbomb		dat.f	<5334,	dbomb-start+7
bomb		spl	#0,	#step

for 83
		dat	0,	0
rof

boot		mov	bomb,	2000
for 7
		mov	{boot,	<boot
rof
		jmp	@boot,	<-1000


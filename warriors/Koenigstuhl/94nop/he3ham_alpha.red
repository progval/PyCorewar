;redcode-94nop
;author Sheep
;name HE3HAM alpha
;strategy bomber and scanner with moving clear
;assert (CORESIZE==8000)


RANGE equ 7
SSIZE equ 60
INIT  equ 109

BINIT1	equ	848
BINIT2	equ	-140
BSTEP1	equ	56
BSTEP2	equ	-140

IMPGATE	equ (target - 40)

	dat.f $0, $0
	dat.f $0, $0
target	dat.f	stun1, #100
stun1	spl.b	#(stun2-target), #19
stun2	spl.b	#(stun3-target), #19
stun3	spl.b	#(kill-target), #19
kill	dat.f	#0, #18
count	spl.b	#BINIT1, #BINIT2
loop	mov.i	count, @count
	mov.i	count, *count
	add.f	sstep, count
	add.f	sstep, scn	
scn	sne.i 	INIT, INIT+RANGE	
	jmp	loop, <IMPGATE	
	mov.ab	scn, target
hit	spl.b	loop, <IMPGATE
carpet	mov.i	*target, >target
	mov.i	*target, >target
last	jmp	carpet, <IMPGATE
sstep	dat.f 	SSIZE, SSIZE
bstep	dat.f	BSTEP1, BSTEP2
	
	end scn


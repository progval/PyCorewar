;redcode-x2
;name Black Box v1
;author JKW
;assert (CORESIZE == 55440)
;(MAXPROCESSES == 10000)

d	  equ 34117
hideboot equ 20000

org think

PSTATE equ 100
think	ldp.a  #0,      in
	ldp.a  #PSTATE, table
	mod.ba *in,     table
	stp.b  *table,  #PSTATE
table   jmp }0, 175
        dat w0, 50
        dat w1, 177
        dat w1, 192
in      dat 0, 6
        spl 1, 5
        spl 1, 7

for 15
dat 0,0
rof

; evol paper/imps
w0	mov	<booter,{booter
	mov	<booter,{booter
	mov	<booter,{booter
	mov	<booter,{booter
	mov	<booter,{booter
	mov	<booter,{booter

	mov	b1,	b1+boot
	mov	imp2,   imp2+boot
	spl	1
	spl	1
	mov	-1,	0
	spl	1
booter  jmp	evol+6+boot,   evol+6

for 15
dat 0,0
rof

TSTEP equ 3520;20480;18466+47 ;17710
bstep equ 16373;21470 ;18655 ;16211
boot  equ (21703-10-(80+15)*4-1)

evol:   spl	@evol,  }TSTEP
	mov.i   }evol,  >evol
evoli:  spl	#d,    bstep-1
	mov	b1,	>2
	add.f   evoli,  j
j:	jmp	imp2-(d*14), {+1+bstep
	dat	0,	0
	dat	0,	0
	dat	0,	0
	dat	0,	0
	dat	0,	0
	dat	0,	0
b1	dat	<1,	1
imp2    mov.i   #d,	*0

for 15
dat 0,0
rof

; anti-scanner suicidal stone with pretty good core coverage
w1
	mov	<booter1,{booter1
	mov	<booter1,{booter1
	mov	<booter1,{booter1
booter1 jmp	stone+20000, stone+3

sStep	equ	16238
off	equ	145
stone	mov	}off,	1-sStep
		sub.x	#sStep,	-1
		jmp	-2,	}-2


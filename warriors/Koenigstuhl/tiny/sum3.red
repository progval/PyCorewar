;redcode-94x
;name SUM 3
;author Sheep
;strategy scan -> coreclear ( oneshot =) )
;assert (CORESIZE == 800)

INIT 	equ	33
STEP	equ	10

	add.ab	#STEP, trig
scn	jmz	-1, @trig
	jmp	cc, }300

	for	5
	dat.f	$0, $0
	rof

trig	dat.f	#cc, #INIT
	dat.f	#1, #8
cc	spl	#1, #8
	mov.i	*trig, >trig
	mov.i	*trig, >trig
	djn.b	-2, {-40

	end 	scn


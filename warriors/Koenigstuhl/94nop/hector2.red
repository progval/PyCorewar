;redcode
;assert CORESIZE == 8000
;author Kurt Franke
;name Hector 2
;strategy qscan -> replicator

start       ;'94 scan (from FAQ)
s1	for 4
	  sne	start+400*s1, start+400*s1+100
	  seq	start+400*s1+200, start+400*s1+300
	  mov	#start+400*s1-found, found
	rof
	jmn	which, found

s3	for 4
	  sne	start+400*(s3+8), start+400*(s3+8)+100
	  seq	start+400*(s3+8)+200, start+400*(s3+8)+300
	  mov	#start+400*(s3+8)-found, found
	rof
	jmn	which, found

s2	for 4
	  sne	start+400*(s2+4), start+400*(s2+4)+100
	  seq	start+400*(s2+4)+200, start+400*(s2+4)+300
	  mov	#start+400*(s2+4)-found-100, found
	rof

found	jmz	paper, #0       ;skip attack if qscan found nothing
	add	#100, -1        ;increment pointer till we get the right place
which	jmz	-1, @found
 	mov	start-1, @found
	sub	#24, found
	mov	start-1, @found
	add	#8, found
	djn	-2, #7
	jmp	paper

	for	40
	  dat	0,0
	rof

ASTEP equ 2268			;; replicator (test1)
BSTEP equ 5879
CSTEP equ 7901

paper	spl	1, <-200
	mov	-1, 0
	spl	1, <-300

one	spl	@one, }ASTEP
onea	mov	}one, >one
two	spl	@two, }BSTEP
twoa	mov	}two, >two
threea	mov	{two, <three
three	jmp	@three, >CSTEP

end start

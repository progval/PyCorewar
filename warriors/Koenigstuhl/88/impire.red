;redcode
;name The IMPire strikes back
;author Anders Ivner
;strategy 9 layers of 7-segment cyclic imps.
;assert CORESIZE==8000
start	spl	1
	spl	1
	spl	1
	spl	1
	spl	1
	mov	-1,	0

pt	jmp	<pt,	imp

	jmp	imp+1143*6
	jmp	imp+1143*5
	jmp	imp+1143*4
	jmp	imp+1143*3
	jmp	imp+1143*2
	jmp	imp+1143*1
	jmp	imp+1143*0
	jmp	imp+1143*6
	jmp	imp+1143*5
	jmp	imp+1143*4
	jmp	imp+1143*3
	jmp	imp+1143*2
	jmp	imp+1143*1
	jmp	imp+1143*0
	jmp	imp+1143*6
	jmp	imp+1143*5
	jmp	imp+1143*4
	jmp	imp+1143*3
	jmp	imp+1143*2
	jmp	imp+1143*1
	jmp	imp+1143*0
	jmp	imp+1143*6
	jmp	imp+1143*5
	jmp	imp+1143*4
	jmp	imp+1143*3
	jmp	imp+1143*2
	jmp	imp+1143*1
	jmp	imp+1143*0
	jmp	imp+1143*6
	jmp	imp+1143*5
	jmp	imp+1143*4
	jmp	imp+1143*3
	jmp	imp+1143*2
	jmp	imp+1143*1
	jmp	imp+1143*0
	jmp	imp+1143*6
	jmp	imp+1143*5
	jmp	imp+1143*4
	jmp	imp+1143*3
	jmp	imp+1143*2
	jmp	imp+1143*1
	jmp	imp+1143*0
	jmp	imp+1143*6
	jmp	imp+1143*5
	jmp	imp+1143*4
	jmp	imp+1143*3
	jmp	imp+1143*2
	jmp	imp+1143*1
	jmp	imp+1143*0
	jmp	imp+1143*6
	jmp	imp+1143*5
	jmp	imp+1143*4
	jmp	imp+1143*3
	jmp	imp+1143*2
	jmp	imp+1143*1
	jmp	imp+1143*0
	jmp	imp+1143*6
	jmp	imp+1143*5
	jmp	imp+1143*4
	jmp	imp+1143*3
	jmp	imp+1143*2
	jmp	imp+1143*1
	jmp	imp+1143*0

imp	mov	0,	1143
	end	start

;redcode verbose
;name Bullwhip 1.0
;author Ray Cromwell
;(rjc@gnu.ai.mit.edu)
;strategy Fast B-field scan with extra checking to defeat B-field evaders
;strategy with a B-field Decoy routine to confuse splitbomb,etc.
;strategy More robust, hides from B-field scaners by having mod-2/4
;strategy instructions contain zero B-fields.
;assert 1

ptr	dat	#0,#0
	dat	#0,#0
start	add	#212,ptr
	cmp	<ptr,<ptr
	jmp	bomb,0
	djn	start,<-500
	jmp	start,0
	dat	#0,#0
spl0	jmp	0,<0
bomb	slt	#endp-start,ptr
	add	#212,ptr
	add	#11,ptr
	jmp	1,0
	mov	#13,cnt
loop	mov	spl0,<ptr
cnt	djn	loop,#11
	jmp	1,0
	djn	start,#30
	mov	ptr,ptr-10
	jmp	-1,<-1
	dat	#0,#0
endp	dat	#0,#0
	end	start

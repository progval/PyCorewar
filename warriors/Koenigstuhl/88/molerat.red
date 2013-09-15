;redcode
;name Molrat A.K.A paper
;author Scott Nelson
;strategy - Replicate -
;assert  1
; start up five inline process
start	spl	1
	mov	-1,	0
	mov	-1,	0
	spl	paper4		;type add
	spl	paper3		;type sub
	spl	paper2		;type add
	jmp	paper1		;type sub
count	dat		#5
 
src1	mov	#10,	10	;initialize src for copy
	sub	<203,	204	;subtract for pit-bombing 
paper1	mov	<src1,	<dest1	;copy five locations
	mov	<src1,	<dest1	;copy five more
	spl	back1		;if we can, make more copies
	mov	bomb1,	<200	;bomb the pit (we hope)
dest1	jmz	@dest1,	6101	;if copy worked, jump there
back1	jmz	src1,	src1	;if copy worked, split back
	mov	0,	-1	;hmm . . . something went wrong, try to die.
bomb1	dat		#-10	;die
;
	dat		#1	
	dat		#1
	dat		#1
;
src2	mov	#10,	10
	add	<203,	204
paper2	mov	<src2,	<dest2
	mov	<src2,	<dest2
	spl	back2
	mov	bomb2,	<200
 
dest2	jmz	@dest2,	6301
back2	jmz	src2,	src2
	mov	0,	-1
bomb2	dat		#-10
	dat		#1
	dat		#1
	dat		#1
 
	mov	#10,	10
	sub	<203,	204
paper3	mov	<-2,	<4
	mov	<-3,	<3
	spl	3
	mov	4,	<200
	jmz	@0,	6501
	jmz	-7,	-7
	mov	0,	-1
	dat		#-10
	dat		#1
	dat		#1
	dat		#1
 
	mov	#10,	10
	add	<203,	204
paper4	mov	<-2,	<4
	mov	<-3,	<3
	spl	3
	mov	4,	<200
	jmz	@0,	6701
	jmz	-7,	-7
	mov	0,	-1
	dat		#-10
	end	start 

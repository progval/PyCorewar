;redcode quiet
;name Note Paper
;author Scott Nelson
;strategy Small version of Plain Paper.
;strategy smaller.
;assert 1 
start	spl	p2	;decrease chance of lucky hit by dwarf.
	spl	1
	spl	1
	spl	1	;start 8 processes going
	spl	paper2
	spl	paper3
	spl	paper4
	spl	paper5
;
	mov	#8,	0	;set source
paper1	mov	<-1,	<1	;make copy
	spl	@0,	6301	;split to copy
	mov	2,	<-1	;make next copy a little further away
	jmz	-4,	-4	;loop
	dat		#-100	
	dat	#8
	dat	#8
 
	dat	#8
 
	mov	#8,	8
paper2	mov	<-1,	<1
	spl	@0,	6501
	mov	2,	<-1
	jmz	-4,	-4
	dat		#-100
	dat	#8
	dat	#8
 
	dat	#8
 
	mov	#8,	8
paper3	mov	<-1,	<1
	spl	@0,	6701
	mov	2,	<-1
	jmz	-4,	-4
	dat		#300
	dat	#8
	dat	#8
 
	dat	#8
 
	mov	#8,	8
paper4	mov	<-1,	<1
	spl	@0,	6901
	mov	2,	<-1
	jmz	-4,	-4
	dat		#-100
	dat	#8
	dat	#8
 
	dat	#8
 
	mov	#8,	8
paper5	mov	<-1,	<1
	spl	@0,	5901
	mov	2,	<-1
	jmz	-4,	-4
	dat		#-100
	dat	#8
	dat	#8
 
	dat	#8
 
	mov	#8,	8
paper6	mov	<-1,	<1
	spl	@0,	5701
	mov	2,	<-1
	jmz	-4,	-4
	dat		#-100
	dat	#8
	dat	#8
 
	dat	#8
 
	mov	#8,	8
paper7	mov	<-1,	<1
	spl	@0,	5501
	mov	2,	<-1
	jmz	-4,	-4
	dat		#-100
	dat	#8
	dat	#8
 
	dat	#8
 
	mov	#8,	8
paper8	mov	<-1,	<1
	spl	@0,	5301
	mov	2,	<-1
	jmz	-4,	-4
	dat		#-100
	dat	#8
	dat	#8
 
	dat	#8
 
	mov	#8,	8
paper9	mov	<-1,	<1
	spl	@0,	5201
	mov	2,	<-1
	jmz	-4,	-4
	dat		#-100
;
p2	spl	1
	spl	1
	spl	1
 
	spl	paper6
	spl	paper7
	spl	paper8
	spl	paper9
 
paper10	mov	#8,	0
	mov	<-1,	<1
	spl	@0,	7001
	mov	2,	<-1
	jmz	-4,	-4
 
	end	start

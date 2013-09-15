;redcode-94
;name Spreader 2.0
;author Scott Adkins
;assert 1
;strategy By the use of copying some heavy-duty bombing programs to the 
;strategy extremeties of the write limit, this program effectively bombs
;strategy 1100 memory locations quickly and thorougly.  Just in case the
;strategy enemy program does not venture into this war zone, two bombing
;strategy programs are sent out into the core in opposite directions to
;strategy clean everything else out.

length	equ	dst1-pest1+100
source	equ	dst1-src1+100
output1	equ	-15
output2	equ	200

pest1	mov	#length,  count1
	mov	#source,  src1
	mov	#output1, dst1
move1	mov	<src1,	  <dst1
count1	djn	move1,	  #length
src1	spl	@dst1,	  #source
dst1	dat	#0,	  #output1

copy1	mov	kill1a,	-250
	mov	kill1b,	-250
	mov	kill1c,	-250
	mov	kill1d,	-250
	mov	kill1e,	-250
	mov	kill1f,	-250
	mov	kill1g,	-250
	mov	kill1h,	-250
	mov	kill1i,	-250
	spl	-259

scan1a	mov	bomb1,	<scan1c
	mov	bomb1,	<scan1c
	mov	bomb1,	<scan1c
	mov	bomb1,	<scan1c
	mov	bomb1,	<scan1c
scan1b	djn	scan1a,	#50
	mov	#50,	scan1b
	mov	#-9,	scan1c
scan1c	jmp	scan1a,	#-9
	
kill1a	mov	bomb1,	<kill1i
kill1b	mov	bomb1,	<kill1i
kill1c	mov	bomb1,	<kill1i
kill1d	mov	bomb1,	<kill1i
kill1e	mov	bomb1,	<kill1i
kill1f	djn	kill1a,	#50
kill1g	mov	#50,	kill1f
kill1h	mov	#-9,	kill1i
kill1i	jmp	kill1a,	#-9

bomb1	dat	#0,	#0

start	spl	pest1
	spl	pest2
sleep	djn	sleep,	#1000
	spl	copy2
	jmp	copy1

scan2a	mov	bomb2,	>scan2c
	mov	bomb2,	>scan2c
	mov	bomb2,	>scan2c
	mov	bomb2,	>scan2c
	mov	bomb2,	>scan2c
scan2b	djn	scan2a,	#50
	mov	#50,	scan2b
	mov	#1,	scan2c
scan2c	jmp	scan2a,	#1

kill2a	mov	bomb2,	>kill2i
kill2b	mov	bomb2,	>kill2i
kill2c	mov	bomb2,	>kill2i
kill2d	mov	bomb2,	>kill2i
kill2e	mov	bomb2,	>kill2i
kill2f	djn	kill2a,	#50
kill2g	mov	#50,	kill2f
kill2h	mov	#1,	kill2i
kill2i	jmp	kill2a,	#1

bomb2	dat	#0,	#0

copy2	mov	kill2a,	250
	mov	kill2b,	250
	mov	kill2c,	250
	mov	kill2d,	250
	mov	kill2e,	250
	mov	kill2f,	250
	mov	kill2g,	250
	mov	kill2h,	250
	mov	kill2i,	250
	spl	241
	jmp	scan2a

pest2	mov	#length,  count2
	mov	#source,  src2
	mov	#output2, dst2
move2	mov	<src2,	  <dst2
count2	djn	move2,	  #length
src2	spl	@dst2,	  #source
dst2	dat	#0,	  #output2

	end	start

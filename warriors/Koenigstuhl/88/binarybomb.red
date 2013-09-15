;redcode
;name Binary bomber
;author Scott Nelson
;assert 1
; basic bomber
loop	mov	bomb,	@offsets
l2	add	@i1,	@loop
	djn	loop,	@i2
; now change the parameters
	add	#1,	loop
	add	#1,	i1
	add	#1,	i2
	jmp	loop
;
i1	dat	#addvals
i2	dat	#counts
 
 
;the table of add values
addvals	dat		#0
	dat		#4096
	dat		#2048
	dat		#1024
	dat		#512
	dat		#256
	dat		#128
	dat		#64
	dat		#32
	dat		#16
	dat		#8
	dat		#4
	dat		#2
;the table of counts
counts	dat		#1
	dat		#2
	dat		#4
	dat		#8
	dat		#16
	dat		#32-1
	dat		#64-2
	dat		#128-4
	dat		#256-8
	dat		#512-15
	dat		#1024-30
	dat		#2048-60
	dat		#4096-120
 
;the table of offsets
offsets	
	dat		#bomb+4096
	dat		#bomb+2048
	dat		#bomb+1024
	dat		#bomb+512
	dat		#bomb+256
	dat		#bomb+128
	dat		#bomb+64
	dat		#bomb+32
	dat		#bomb+16
	dat		#bomb+8
	dat		#bomb+4
	dat		#bomb+2
	dat		#bomb+1
;
bomb	dat	#0

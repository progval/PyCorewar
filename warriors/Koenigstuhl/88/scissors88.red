;redcode
;name scissors88
;author Scott Nelson
;strategy  capture the enemy and put him to work.
;assert 1
;
;main code loop
;
loop	add	s,	ptr	;double add makes ptr both jump and point
	mov	ptr,	@ptr	;move the jmp to the right place
	jmp	loop		;Tiny, isn't it?
ptr	jmp	pit
s	dat	#5084,	#-5084
;
;Slave pit
; 
wptr	dat	#loop
p	dat	#1
	jmp	pit
pit	mov	p,	<wptr	;enemy falls in here
	spl	pit		;SPL's to slow him down
	mov	p,	<wptr	;eventually this will kill itself
	jmp	pit		;Gee, the pit is bigger than the main code!
;
	end	loop

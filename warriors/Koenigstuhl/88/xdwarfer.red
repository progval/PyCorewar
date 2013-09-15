;redcode
;author Adam Caldwell
;<acaldwel@bird08.cs.ohiou.edu>
;name XDwarfer
;strategy Scatter bomb throught memory and then start up a dwarfer
;assert 1
start	mov	bomb, -1
	sub	#415, -1
	djn	start, #900
	jmp	dwarfer
	dat	#0, #0
	dat	#0, #0

dwarfer mov	d2,	<dst
	mov	d1,	<dst
	spl	@dst
	add	#200,	dst
	jmp	dwarfer

d1	mov	-1,	-1
d2	jmp	d1, 	<d1

dst	dat	#0,	#200

bomb	spl	0, #1
	end	start

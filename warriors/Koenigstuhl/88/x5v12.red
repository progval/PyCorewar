;redcode
;
; Since this program has been in the top 10 for a week or two, I
; decided I would post it here.
;
;author Adam Caldwell
;name X5 V1.2
;strategy unleash 3000 spl 0, #1 statements into the core
;strategy at 411 byte intervals.  Next, repair the damage
;strategy that this caused to my program and then sweep
;strategy through memory with the deadly dat #0,#0
;assert 1
start	mov	bomb, -1
	sub	#411, -1
	djn	start, #3000
	spl	0, #0
	mov	0, <0
	jmp	1, #0
	mov	0, <0

kill	mov	bomb1, <kill
	djn	kill, #-4
	jmp	1, #0
	mov	0, <0
	jmp	kill
bomb	spl	0, #1
bomb1	dat	#0, #0
	end	start

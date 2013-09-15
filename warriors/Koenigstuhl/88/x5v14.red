;redcode verbose
;author Adam Caldwell
;(acaldwel@bird08.cs.ohiou.edu)
;name X5 V1.4
;strategy unleash 1925 spl 0, #1 statements into the core
;strategy at 411 byte intervals.  Jump past the splits that
;strategy hit itself, then sweeps through memory with deadly
;strategy dat #0 statements.  If is completes a full sweep
;strategy through memory, it releases an imp to go for the
;strategy tie.
;assert 1
start	mov	bomb, -1
	sub	#411, -1
	djn	start, #1925
	jmp	kill
	dat	#0, #0
	dat	#0, #0

kill	mov	bomb1, <bomb1
	djn	kill, #-4
	jmp	2, #0
	mov	0, <0
	mov	0, 1
bomb	spl	0, #1
bomb1	dat	#0, #kill-1
	end	start

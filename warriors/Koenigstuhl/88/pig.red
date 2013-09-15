;redcode-icws verbose
;name PIG
;author gabler alexander
;assert CORESIZE == 8000
	spl	start
	spl	imp
status	dat	#-5
status2	dat	#10
start	mov	6	, @status
	mov	5	, @status2
	sub	#5	, status
	add	#5	, status2
	spl	start	
	dat	#0	, #0
imp	spl	stimp
	mov	0	, 0
	mov	0	, 0
stimp	mov	0	, 1


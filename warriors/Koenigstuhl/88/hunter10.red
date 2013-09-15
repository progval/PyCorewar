;redcode-x  verbose
;author Rob Shultz
;name Hunter 1.0
;strategy  hits warriors with a SPL and then hunts them down.
;assert 1

start	equ	stop

temp	DAT	#0
target	DAT	#0
bomb	DAT	#0
stop	SPL	stop2
bomb2	MOV	bomb,target
stop2	JMP	bomb2
	SPL	imp
	DJN	killer,temp
	MOV	@start,@temp+611
	MOV	@start+1,@temp+611
	MOV	@start+2,@temp+611
	MOV	@start+3,@temp+611
	MOV	@start+4,@temp+611
	JMP	start
killer	SPL	stop,0
	JMP	start
imp	MOV	imp,imp+1
	end	stop

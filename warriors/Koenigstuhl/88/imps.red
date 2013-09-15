;redcode
;name Imps!
;author Andy Pierce
;strategy  this appears to be the most effective version
;assert 1
start	add #5138,1
	mov bomb,back-68
	djn start,start-41
back	mov #-1,<start-4
	jmp -1,<start-4
bomb	mov 0,1

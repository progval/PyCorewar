;redcode verbose
;name Crimp 2
;author Andy Pierce
;strategy  cmp scanner with decoy
;strategy  v2:  smaller, faster core clear, original constants
;assert 1
ret	add offset,start
start	cmp -50,-1
	slt #11,start
count	djn ret,<6024
	mov bomb1,@start
	mov bomb2,<start
	add next,start
	jmn start,ret
bomb2	spl 0,2
next	mov @-49,<-48
bomb1	jmp -1,0
offset	dat #-98,#-98

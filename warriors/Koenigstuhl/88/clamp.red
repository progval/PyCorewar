;redcode verbose
;name ClaMP
;author Andy Pierce
;strategy  small cmp scanner
;assert 1

ret	add offset,start
start	cmp -50,-1
	slt #65,start
count	djn ret,#2000
hit	mov bomb2,@start
	mov bomb1,<start
	add next,start
	jmn start,count
bomb1	spl 0,0
	mov 2,<1
bomb2	djn -1,#-3
next	dat #-49,#-48
offset	dat #-98,#-98

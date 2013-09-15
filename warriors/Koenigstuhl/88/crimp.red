;redcode
;name Crimp
;author Andy Pierce
;strategy  small cmp scanner
;strategy  bigger than ClaMP, more destructive than ClaMP
;strategy  full release version, optimize constants
;assert 1

ret	add offset,start
start	cmp -834,-551			;15 - 2n
	jmp hit,0
count	djn ret,<start
	add #1,start
hit	slt #20,start
	jmp back,<start
	mov bomb2,@start
	mov bomb1,<start
back	add next,start
	jmz start,ret-1
bomb1	spl 0,-15
	mov 2,<1
bomb2	djn -1,#-3
next	dat #-283,#-282
offset	dat #-566,#-565
	end start

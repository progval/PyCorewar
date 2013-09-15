;redcode verbose
;name Binrary Tree 2.0 (beta)
;author Ray Cromwell
;strategy Greatly enhanced version of my Binary Tree program
;strategy thousands of times faster!
;assert 1

bomb	spl	0,#42
offset	dat	#0,#0
temp	dat	#0,#0
	dat	#0,#0
num	dat	#16,#16
start	mov	<ptr,dest	;fetch next vlaue from offset table
	jmn	ploop,ptr	;if 0, turn into a dwarf bombing with dats
	mov	bomb-1,<bomb-1
	jmp	-1,<bomb-1
ploop	mov	dest,offset	;dest is the destination which is offsetted
	add	offset,offset   ;offset is the value added to dest each loop
				;which is 2*dest
				;this gets rid of the "bomb some loc twice"
				;by making each bombing run out of phase
				;by 1/2 the dist between two previous bombs
	slt	#62,num		;check to prevent us from bombing ourselve
	jmp	2,0		
	sub	#2,num
	mov	num,temp	;temp=number of bombs to lay out
	add	temp,num	;num=num*2, for next iteration
bloop	mov	bomb,@dest
	add	offset,dest
	djn	bloop,temp	;bomb code

	jmp	start,<4000	;impstomp/decoy jump back to begining
	dat	#0,#0
	dat	#0,#0
	dat	#0,#0
	dat	#0,#0
	dat	#0,#0
	dat	#0,#0
	dat	#0,#0
	dat	#0,#0
	dat	#0,#0
	dat	#0,#0
	dat	#0,#0           ;move the table away from the main code
	dat	#0,#0
	dat	#0,#0
	dat	#0,#0
	dat	#0,#0
	dat	#0,#0
	dat	#0,#0
	dat	#0,#0
	dat	#0,#0
	dat	#0,#0
	dat	#0,#0
	dat	#0,#0
	dat	#0,#0
	dat	#0,#0
	dat	#0,#0
	dat	#0,#0
	dat	#0,#0
	dat	#0,#0
	dat	#0,#0
	dat	#0,#0
	dat	#0,#0
	dat	#0,#0
	dat	#0,#0
	dat	#0,#0
	dat	#0,#0
	dat	#0,#0
	dat	#0,#0
	dat	#0,#0
	dat	#0,#0
	dat	#0,#0
	dat	#0,#0
	dat	#0,#0
	dat	#0,#0
	dat	#0,#0
	dat	#0,#0
	dat	#0,#0
	dat	#0,#0
	dat	#0,#0
ptr	dat	#tbl+1,#tbl+1
	dat	#2,#2
	dat	#4,#4
	dat	#8,#8
	dat	#16,#16
	dat	#31,#31
	dat	#62,#62
	dat	#125,#125
tbl	dat	#250,#250
dest	dat	#0,#0
	end	start

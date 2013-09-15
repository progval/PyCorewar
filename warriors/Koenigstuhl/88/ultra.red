;redcode-x verbose
;name UltraSlick
;author Ray Cromwell
;strategy Bomb with dwarves in 1 directions, sweep with imps.
;strategy Update: Sweeps with spl bombers in one direction, and
;strategy closes the trap with dat bombs on the other side.
;strategy Update: Slick now bombs optimal for certain opponents, much faster
;assert 1
dest1	dat	#-230,#-230
dest2	dat	#230,#230
src1	dat	#endp1+1,#endp1+1
src2	dat	#endp2+1,#endp2+1
size	dat	#endp1+1-prog1,#endp1+1-prog1

start	jmp	1
cploop	mov	<src1,<dest1
	mov	<src2,<dest2
	djn	cploop,size
	spl	@dest1
	spl	@dest2
	dat	#0,#0
	dat	#0,#0
	dat	#0,#0
	dat	#0,#0
	dat	#0,#0
	dat	#0,#0
prog1	mov	#-250,prog1-1
	mov	endp1,@prog1-1
	add	#10,prog1-1
        jmn	-2,prog1-1
	djn	2,cnt
cnt	dat	#16,#16
	mov	#endp1+1-prog1+1,prog1-1
	mov	#-220,prog1-2
	mov	<prog1-1,<prog1-2
	jmn	-1,prog1-1
	add	#1,prog1-2
	jmp	@prog1-2
endp1	spl    -1,0
	dat	#0,#0
	dat	#0,#0
	dat	#0,#0
	dat	#0,#0
	dat	#0,#0
prog2	mov	#240,endp2+1
	mov	prog2-2,@endp2+1
	sub	#4,endp2+1
        jmn	-2,endp2+1
	mov	#endp2+1-prog2+1,prog2-1
	mov	#220,prog2-2
	mov	<prog2-1,<prog2-2
	jmn	-1,prog2-1
	add	#1,prog2-2
	jmp	@prog2-2,0
	dat	#0,#0
	dat	#0,#0
endp2	dat	#0,#0

	end	start

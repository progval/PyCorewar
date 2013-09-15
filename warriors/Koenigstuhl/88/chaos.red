;redcode verbose
;name		CHAOS
;author		Kenneth D. Miller III
;strategy	A slightly optimized version of my old Cloner II program;
;strategy	it copies itself, then seeks a target for a new copy.
;assert 1

src	mov	 fix,	 -1
cpy	mov	@src-1,	<dst
	mov	<src-1,	<dst
	djn	 cpy,    src-1
	spl	@dst,	<dst
hit	cmp	<dst,	<dst
dst	jmp	 src,	#5555
	jmp	 hit,	<dst
fix	dat	 #0,	#10
	end

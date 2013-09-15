;redcode verbose
;name BANZAI
;author	Kenneth D. Miller III
;strategy Dumps JMP bombs all over the core.  These JMP's all point to
;strategy a somewhat dwarf-like "cleanup" routine.  I think this one's
;strategy a slaver, but I'm not sure.
;assert 1

front	jmp	 start
a	jmp	 zap,	#0
start	slt	#10,	 a
	add	 inc,	 a
	add	 inc,	 a
	mov	 a,	@a
targ	jmp	 start,	 a-1
inc	dat	#498,	#-498
zap	mov	 inc,	<targ
	spl	 0
	jmp	 -2
	end

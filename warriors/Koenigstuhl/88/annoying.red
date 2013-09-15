;redcode verbose
;name		ANNOYING
;author		Kenneth D. Miller III
;strategy	Oh no!  Another CMP-scanning SPL bomber!  Run and hide! ;^)
;assert 1

init	jmp	 2
a	spl	 0,	-1
scan	cmp	<a,	<a
	slt	#10,	 a
	jmp	 scan,	<a
hit	mov	 a,	@a
	jmn	 hit,	<a
cnt	slt	#-2,	 30
	jmp	 scan,	<cnt
	spl	 scan,	<cnt
zot	mov	 2,	 init
	jmp	 zot,	<zot	
	end

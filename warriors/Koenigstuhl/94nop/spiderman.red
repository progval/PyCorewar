;redcode-94
;name Spiderman
;author Ben Ford
;strategy silk/vamp
;assert (CORESIZE==8000)

p1	EQU	2936
p2	EQU	3044

silk	spl	$   2,	>5000
	spl	$   2,	>6000
	spl	$   1,	}   0
	spl	$   1,	>7000

slk0	spl	@   0,	<  p1
	mov	}slk0,	>slk0
	mov	 sbmb,	>slk0
	mov	{slk0,	<slk1
slk1	jmp	@   0,	<  p2
svmp	spl	#   0,	 sbmb
	mov	 sbmb,	>svmp
	djn.f	 svmp,	>slk0
sbmb	dat	<2667,	<5334

end	silk


;redcode-94 test
;name otest2
;author M. J. Pihlaja
;assert 1

gate	equ	(once-2)

once	add	#13	,	gate
	jmz.f	-1	,	<gate
	add.f	#-1333	,	gate
clear	spl	#6	,	{gate
	mov	*clear	,	>gate
	mov	*clear	,	>gate
	djn.f	-2	,	{gate
	dat	<2*2667	,	<2667
	spl	#6	,	13
	spl	#6	,	13

	end


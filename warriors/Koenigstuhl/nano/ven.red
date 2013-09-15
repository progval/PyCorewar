;redcode-odd
;author Will 'Varfar'
;name Ven
;strategy DClear
;assert 1

gate	equ	(clear-10)

clear	spl	#1,	1
	mov	bmb,	>gate
	mov	bmb,	>gate
	djn.f	-1,	>gate
	
bmb	dat	0,	2-gate 


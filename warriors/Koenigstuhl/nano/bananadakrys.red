;redcode-imt2
;name Those Lovely Banananana-na dakrys
;author mjp
;strategy decrement -> dat clear
;assert 1
;CORESIZE==80 && MAXPROCESSES==80 && MAXLENGTH==4 && MAXCYCLES==800

gate	equ	(magrat-2)

	dat	0	,	6-gate
magrat	djn.f	#-1	,	<gate	; {-2
	spl	#1	,	1
	mov	*-2	,	>gate

	end	magrat


;redcode-tiny
;name Tiny Lord 4
;author Neo
;assert 1
;strategy Qbomb->paper/imp

	dest equ (60)
	QGAP EQU 23 ;7

QBOMB:				;The Quick punch :)
I FOR 11
	MOV.I {QBOMB-40-(2*I*QGAP),<QBOMB-40-((2*I+1)*QGAP)
ROF
launch:	spl 2,{QBOMB-40-(24*QGAP)
	spl 1,<QBOMB-40-(25*QGAP)
	spl 1,{QBOMB-40-(16*QGAP)
	spl @0,<dest
	mov }-1,>-1
	spl @0,<268
	mov }-1,>-1
	mov.i #267,}400
	mov.i #267,*0
end QBOMB


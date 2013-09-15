;redcode-94x
;name Borkked
;author Soren Bog
;strategy First scan and bomb the core,
;strategy then release an imp ring.
;assert CORESIZE == 800

;imp constants
IJUMP	equ	267
IOFF1	equ	IJUMP + 1
IOFF2	equ	IJUMP * 2 - 1

;bombing constants
KDIST	equ	5
SDIST	equ	12
SJUMP	equ	42
OFFBY1	equ	SJUMP * (SJUMP / 40 + 1) + SDIST
OFFBY2	equ	SJUMP * (SJUMP / 40 + 1)
HITS	equ	(CORESIZE - OFFBY1) / SJUMP

scan	ADD.f	incr,	comp
comp	CMP.i	OFFBY1,	OFFBY2
	JMP	drop
	DJN	scan,	#HITS

	SPL	IMP3			;split for the third imp
	SPL	IOFF1			;split and launch the second imp
	MOV	0,	IJUMP		;launch the first imp
IMP3	JMP	IOFF2			;launch the third imp

drop	MOV.i	bomb,	>comp
	DJN	drop,	#KDIST
	JMP	scan

bomb
incr	DAT	#SJUMP,	#SJUMP

	END	comp


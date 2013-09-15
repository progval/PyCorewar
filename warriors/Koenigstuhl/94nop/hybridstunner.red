;redcode-94
;name Hybrid Stunner
;author Alex
; <alterlat@hotmail.com>
;strategy scan -> split bomber -> spl/dat coreclear
;assert CORESIZE == 8000

gap	EQU 213
fsthit	EQU 397
reps    EQU 700
shtgun	EQU 6

	ORG boot
trig	SPL	#1,		>5335
boot	MOV     trig,           600
	JMP	scan,		>3000
FOR 20
	DAT	0,		0
ROF

scan	JMZ.A	#32,		}scan
hit	MOV	s,		}scan
	DJN	hit,		#shtgun
step	ADD.A	#gap,		s
t	MOV	s,		*s
j	DJN	step,		#reps
	SPL	@hit,		{hit
	DAT     >j,		{t
d	DAT	#6,		>5335
	SPL	#10,		>5335
s	SPL	#fsthit,	#1

FOR 30
	DAT	0,		0
ROF
FOR 2
 FOR 10
	DAT	0,		0
 ROF
	SPL	#0,		1
	SPL	#0,		2
	SPL	#0,		3
ROF
END

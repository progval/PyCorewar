;redcode-94
;name A Quickscanner's Paper
;author Jens Gutzeit
;strategy paper
;assert CORESIZE == 8000

	ORG	boot

	pStep1	EQU	2341
	pStep2	EQU	2421
	pStep3	EQU	3241

	pAway1	EQU	2000
	pAway2	EQU	6000

	pEnd	EQU	(silk3 + 1)


boot	spl	1
	mov.i	-1,		0
	spl	1

	mov.i	< pBoot1,	{ pBoot1
pBoot1	spl	pAway1,		pEnd

	mov.i	< pBoot2,	{ pBoot2
pBoot2	jmp	pAway2,		pEnd

silk1	spl	@ silk1,	< pStep1
	mov.i	} silk1,	> silk1

silk2	spl	@ silk2,	< pStep2
	mov.i	} silk2,	> silk2

	mov.i	{ silk2,	< silk3
silk3	djn.f	@ silk3,	< pStep3

	END


;redcode-94 verbose
;name Harquebus
;author M. J. Pihlaja
;strategy Tuning Harquebus, tuning brain.
;strategy Switching hsa and stone/imp resistance based on P-clear.
;strategy Thanks to Robert Macrae for all his suggestions and hints.
;assert CORESIZE==8000

load0
z	for	0
	rof

;***** __meld
;*****
;

; these are relative to __meld_boot
_PDIST	equ	((5300/__mld_STEP)*__mld_STEP+70-(__meld_boot-load0))
_SDIST	equ	((-2700/__mld_STEP)*__mld_STEP+70-(__meld_boot-load0))

__meld_boot
bootpair
	mov	#__mld_FIRST,__meld_boot+_PDIST+(paGate-Pair) ; not erased
_cploop	mov	<psrc	,	<pdst
	mov	<psrc	,	<pdst
	mov	<psrc	,	<pdst
	djn	_cploop	,	#3
psrc	spl	@pdst	,	Pair+10
	mov	<psrc	,	<pdst
	mov	{pscan	,	<pscan
	mov	{pscan	,	<pscan
	mov	{pscan	,	<pscan
	mov	{pscan	,	<pscan
	spl	@pscan	,	1
pscan	mul.x	#scan+4	,	#__meld_boot+_SDIST+4
pdst	div.f	#0	,	#__meld_boot+_PDIST+10

__mld_STEP	equ	13

; rel. to booted paGate
__mld_FIRST	equ	(-_PDIST+scan+8-__meld_boot+5*__mld_STEP)

paGate		equ	(Pair-5)

Pair
sclr1	spl	#0	,	{paGate+2 ; for #x,*0 imps ; Pair-paGate+2667
	mov	dclr	,	>paGate
	mov	dclr	,	>paGate
	djn.f	-1	,	>paGate
sclr2	spl	#0	,	>Pair-paGate+2667
	mov	dclr	,	>paGate
	mov	dclr	,	>paGate
	djn.f	-1	,	>paGate
	dat	>5335	,	>Pair-paGate+10
dclr	dat	>5335	,	>Pair-paGate+10

scPair	equ	(scan+_PDIST-_SDIST)
scan	add	#__mld_STEP*2667-2,paGate-Pair+scPair
	jmz.f	-1	,	@paGate-Pair+scPair
	spl	scPair	,	<paGate-Pair+scPair
	jmp	scPair+4,	<paGate-Pair+scPair

z	for	14
	dat	0	,	0
	rof

;***** Mini-HSA
;*****
;

; step/self scans
; unrequited love: 7/12
; Marcia Trionfale: 8/12, 7/12
; paper01o:  8/11
; paperone: 7/12
; ccpaper2: 8/12, 7/12 (very close)
; Diehard: 8/12, 7/13 also 7/12
; FlashPaper 3.7: 8/13
; nobody special: 8/11, 8/12, 7/11
; Timescape: 7/11
; obvious:

sFIRST	equ	(swipe-sptr-SDIST+100)
sSTEP	equ	(8)

sptr	equ	(swipe-5)

swdat	dat	0	,	{0
swspl	spl	#1	,	}1
swipe	mov	swspl	,	<sptr
spptr	mov	>sptr	,	>sptr
	jmn.f	swipe	,	>sptr
sscan	add	#sSTEP	,	@spptr
	jmz.f	sscan	,	<sptr
	slt	@spptr	,	#ssend+3-sptr
	djn	swipe	,	@spptr		; is this causing problems?
	djn	sscan	,	#12
ssend	jmp	sscan	,	{swipe

SDIST	equ	(2000)

HSA	mov	#sFIRST	,	sptr+SDIST
scploop	mov	<ssrc	,	<sdst
	mov	<ssrc	,	<sdst
	mov	<ssrc	,	<sdst
	djn	scploop	,	#3
ssrc	spl	@sdst	,	ssend+1
	mov	<ssrc	,	<sdst
	mov	<ssrc	,	<sdst
sdst	div.f	#0	,	#swdat+SDIST+11

z	for	15
	dat	0	,	0
	rof

;*****  P^2b
;*****
;

PSTATE	equ	8
NSTATES	equ	(statesend-state)
_hsa	equ	HSA
_mld	equ	__meld_boot

	spl	#0	,	init-state
t1	spl	#1	,	1
	spl	#0	,	0
	spl	#0	,	0
t2	spl	#1	,	1
	spl	#0	,	-1
	spl	#0	,	-1
t3	spl	#3	,	3
	spl	#0	,	-2
	spl	#0	,	-1

think	ldp.a	#0	,	in
load	ldp.a	#PSTATE	,	state
	add.ba	*state	,	in
in	add.ba	0	,	state
	mod.a	#NSTATES,	state
	stp.a	state	,	load
	mov.i	#0	,	-1
state	jmp	}0	,	t1-in
	spl	#_hsa	,	t2-in
init	spl	#_hsa	,	t3-in
	spl	#_mld	,	t1-in
	spl	#_mld	,	t2-in
	spl	#_mld	,	t3-in
statesend

datzero		; if anything needs it

dumi
	end	think


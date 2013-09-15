;redcode-94 verbose
;name Silccon
;author M. J. Pihlaja
;strategy Trying to regain some foothold on the hill.
;strategy Switch a scanner, a clear, and a stone.
;strategy I'll tinker some more later.
;assert CORESIZE==8000

load0
z	for	0
	rof

;***** There may still be some bugs in this
;*****
;
;

SDIST	equ	1650

sboot	mov	<ssrc	,	<sdst
	mov	<ssrc	,	<sdst
	mov	<ssrc	,	<sdst
	djn	sboot	,	#3
	mov	<ssrc	,	<sdst
ssrc	spl	@sdst	,	send
	mov	<ssrc	,	<sdst
sdst	div.f	#0	,	#load0+SDIST

; My own version of "There may still be some bugs in this" which is
; exactly the same as the original. "There may still..." is a very
; ingenius piece of code. Tilts of the hat to Anton.

STEP	equ	(3039)
CLDIST	equ	3000	; not so

sgate	equ	(clptr-1)

clptr	spl	#0	,	CLDIST
scan	add	#STEP	,	#STEP
mv	mov	sclr	,	>clptr
pscan	jmz.f	scan	,	@scan
	slt	scan	,	#send+1-scan
chg	mov.i	@pscan	,	@mv
chk	jmn	scan	,	scan
	mov.f	dclr	,	>chk
	djn.f	<chg	,	{chg
dclr	dat	381	,	send+1-sgate
sclr	spl	#0	,	0

send

z	for	9
	dat	0	,	0
	rof
	
;***** Clear
;*****
;

KDIST	equ	2500	; not so

kboot	mov.i	gateins	,	@kdst
	add	#clear-2-gate,	kdst
	mov	b	,	>kdst
	mov	b	,	>kdst
ksrc	spl	@kdst	,	clear
	mov	>ksrc	,	>kdst
	mov	>ksrc	,	>kdst
	mov	>ksrc	,	>kdst
	mov	>ksrc	,	>kdst
	djn	ksrc	,	#2
kdst	div.f	#0	,	load0+KDIST+gate-clear

z	for	7
	dat	0	,	0
	rof

; Clobbers most 3-pt stone/imps.

gateins	spl	#0	,	clend+2
gate	equ	(clear-5)
;	dat	0	,	0
;	dat	0	,	0
;	dat	<-2666	,	<2667
b	dat	<-2666	,	<2667
clear	spl	#0	,	<gate-2666
	mov	b	,	>gate
	mov	b	,	>gate
	djn.f	-1	,	{gate
	spl	#0	,	<gate-2666
	mov	b	,	>gate
	mov	b	,	>gate
	djn.f	-1	,	{gate
clend

z	for	6
	dat	0	,	0
	rof

;***** Stone
;*****
;
; Alladin-like stone picked up from CW 65
;

stboot
	mov	Stone+2	,	<stndst
	mov	Stone+1	,	<stndst
	mov	Stone	,	<stndst
stndst	jmp	@0	,	@3920+3	; not so

sStep	equ	3174
Stone	mov	{1545	,	1-sStep
	sub.x	#sStep	,	-1
	jmp.b	-2	,	}-2

z	for	4
	dat	0	,	0
	rof

;***** Brains
;*****
;

tie_table
win_table
	spl	#sboot	,	0	; 0
	spl	#sboot	,	0	; 1
	spl	#sboot	,	0	; 2
	spl	#kboot	,	3	; 3
	spl	#kboot	,	3	; 4
	spl	#kboot	,	3	; 5
	spl	#stboot	,	6	; 6
	spl	#stboot	,	6	; 7
wtend

loss_table
	spl	#sboot	,	1	; 0
init	spl	#sboot	,	2	; 1
	spl	#kboot	,	5	; 2
	spl	#kboot	,	4	; 3
	spl	#kboot	,	5	; 4
	spl	#stboot	,	6	; 5
	spl	#stboot	,	7	; 6
	spl	#sboot	,	1	; 7


	spl	#0	,	init-state
in	spl	#0	,	loss_table-state
	spl	#0	,	win_table-state
	dat	0	,	tie_table-state

NSTATES	equ	wtend-win_table

PSTATE	equ	90	; not so
think	ldp.a	#0	,	in
load	ldp.a	#PSTATE	,	state
	mod.a	#NSTATES,	state
	add.ba	*in	,	state
	stp.ba	*state	,	load
	mov.i	#0	,	-1
state	jmp	*0


	end	think


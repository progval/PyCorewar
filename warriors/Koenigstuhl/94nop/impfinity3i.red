;redcode-94
;name Impfinity v3i
;author Planar
;strategy boot,imp,stone,clear
;assert CORESIZE == 8000

; The constants on the lines marked with "C" are all different
; from the version on the hill.
; To synchronize the two stones, I had to do a lot of tweaking of
; magic01, magic02, stnof01, and stnof02.  Thanks to cdb, it only
; took a few hours.

istep	equ	1143
bstep01	equ	2214
bstep02	equ	3285
magic01	equ	(-2)                  ; C
magic02	equ	(-3)                  ; C
fuse	equ	13                    ; C

trash	equ	(Z-200)               ; C
impoff	equ	(Z+500)               ; C
prmof01	equ	(impoff+2*istep+20)   ; C
prmof02	equ	(impoff+5*istep+20)   ; C
pmpof01	equ	(impoff+4*istep-20)   ; C
pmpof02	equ	(impoff+1*istep-20)   ; C
stnof01	equ	(impoff+3*istep-21)   ; C
stnof02	equ	(impoff+6*istep-19)   ; C

	org	boot
Z
boot	spl	boot02

i FOR 2

boot&i	mov.i	{ppmp&i, <ppmp&i
	mov.i	{ppmp&i, <ppmp&i
	mov.i	{ppmp&i, <ppmp&i

	mov.i	{pprm&i, <pprm&i
	mov.i	{pprm&i, <pprm&i
	mov.i	{pprm&i, <pprm&i
	mov.i	{pprm&i, <pprm&i

	mov.i	{pstn&i, <pstn&i
	mov.i	{pstn&i, <pstn&i
	mov.i	{pstn&i, <pstn&i
	mov.i	{pstn&i, <pstn&i
	mov.i	{pstn&i, <pstn&i

	mov.i	>trash-15-i*2, pstn&i
	spl	@ppmp&i, >pprm&i
	mov.i	>trash-i*2, ppmp&i
	spl	@pprm&i, >trash-5-i*2
	mov.i	>trash-10-i*2, pprm&i

ppmp&i	dat	ptr&i+1, pmpof&i+ptr&i+1-pump&i
pprm&i	dat	prime&i+3, prmof&i+prime&i+3-instr&i
pstn&i	dat	jump&i+1, stnof&i+jump&i+1-bomb&i

pump&i	spl	#1, >ptr&i
	add.f	#istep+1, ptr&i
ptr&i	jmp	pump&i-pmpof&i+impoff-istep-1, {200   ; C

instr&i	mov.i	#1, istep
prime&i	spl	#instr&i-prmof&i+impoff, >23          ; C
	mov.i	instr&i, }prime&i
	jmn.b	instr&i-prmof&i+stnof&i+1, instr&i-prmof&i+impoff+fuse

bomb&i	dat	<5334, <2667
stone&i	spl	#stone&i+bstep&i+magic&i, {-1000      ; C
	mov.i	bomb&i, }stone&i
	add.f	#bstep&i-1, stone&i
jump&i	djn.f	stone&i, <-30                         ; C

ROF

FOR (MAXLENGTH-CURLINE)/3
	mov	#1, 1
	mov	#1, @1
	spl	#1, 1
ROF

FOR MAXLENGTH-CURLINE
	dat	#1, 1
ROF

	end

;redcode-94 verbose
;name Three Men in a Boat
;author M Joonas Pihlaja
;strategy q^2 -> stone/paper/imp
;assert CORESIZE==8000

SDIST	equ	2850
PDIST	equ	(SDIST+3010)
P2DIST	equ	(SDIST-1001)

load0
z for	0
  rof
	org	qscan

boot	mov	bdat	,	load0+SDIST+2+STEP
	mov	<sptr	,	{sptr
	spl	1	,	1
sboot	mov	<pptr	,	{pptr
	mov	<pptr	,	{pptr
	mov	<pptr	,	{pptr
	mov	<pptr	,	{pptr
	mov	<sptr	,	{sptr
	mov	stone	,	{sptr
sptr	spl	load0+SDIST+5,stone+4
	spl	*sptr	,	1
	spl	1	,	1
	mov	<p2ptr	,	{p2ptr
p2ptr	spl	load0+P2DIST+4,pap+4
pptr	jmp	load0+PDIST+8,paper+8

;--------
; paper

; tiny
pap	spl	@0	,	}1958
	mov	}-1	,	>-1
	mov	{pap	,	<3039
	jmp	pap	,	>pap

; paper w/ imps
A	equ	2609

paper	spl	1	,	1
	spl	@0	,	1050
	mov	}-1	,	>-1
	spl	@0	,	A
	mov	}-1	,	>-1
	spl	i+5334-A,	{351
	spl	i+2667	,	<-1+A
i	mov.i	#0	,	2667

;--------------------------------
; low-profile Carbonite variant

N	equ	3499
STEP	equ	197


bdat	dat	>-1	,	>1
stone	spl	#0	,	0
	mov	STEP	,	1-N*STEP
	add.ab	{0	,	}0
	djn	-2	,	<-2500


z	for	29
	dat	0,0
	rof

;-------------------------------------
; q^2 scan based The Fugitive's same

QB equ -1000  ; scan pattern
QS equ -550
QI equ 4000

qscan seq qscan+QB+(QS*0), qscan+QB+(QS*0)+QI
      jmp q0, 0

      seq qscan+QB+(QS*3), qscan+QB+(QS*3)+QI
      jmp q1, 0
      seq qscan+QB+(QS*6), qscan+QB+(QS*6)+QI
      jmp q1, {q1
      seq qscan+QB+(QS*7), qscan+QB+(QS*7)+QI
      jmp q1, }q1

      seq qscan+QB+(QS*1), qscan+QB+(QS*1)+QI
      djn.a q2, >q1
      seq qscan+QB+(QS*2), qscan+QB+(QS*2)+QI
      jmp q2, >q1
      seq qscan+QB+(QS*4), qscan+QB+(QS*4)+QI
      jmp q2, {q2
      seq qscan+QB+(QS*5), qscan+QB+(QS*5)+QI
      jmp q2, 0
      seq qscan+QB+(QS*8), qscan+QB+(QS*8)+QI
      jmp q2, {q1
      seq qscan+QB+(QS*9), qscan+QB+(QS*9)+QI
      jmp q2, }q1
      seq qscan+QB+(QS*10), qscan+QB+(QS*10)+QI
      jmp q2, }q2

      jmp boot, >393

;-------------
; q^2 bomber

qb1   dat 23,  23
qb2   dat  1,  34

      dat  QS*1,  QS*6
tab   dat  QS*2,  QS*3
      dat  QS*7,  QS*7

q2    add.ab tab, fwd
q1    add.b  tab, @-1
q0    sne   @fwd, load0-5
      add  #QI-2, @2
      add.ba fwd, fwd
      mov    qb2, *fwd
      mov    qb2, @fwd
fwd   mov     88, @qscan+QB+(QS*0)
      sub    qb1, @-3
      djn     -4, #5
      jmp  boot,  0

	end


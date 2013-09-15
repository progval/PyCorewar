;redcode
;name Stillborn Bomber v0.2
;author mjp
;strategy q^2 -> incendiary bomber
;strategy v0.2 fixed bomb spread
;assert 1

load0 z	for 0
	rof

null	equ	(load0+300)

z	FOR	1


BOOTDIST	equ	-2800

a1	equ	1
a2	equ	2
b1	equ	3
b2	equ	5
c1	equ	6
c2	equ	4

QD	equ	11
QN	equ	8
QS	equ	(7500/13)
QI	equ	(QS/2)
qb	equ	(load0+580)

qscan
	cmp	qb	,	qb+QI			; 0
psrc	jmp	q0	,	top+9

	cmp	qb+QS*a1,	qb+QS*a1+QI		; 1
qp1	jmp	q1	,	qt1
	cmp	qb+QS*a2,	qb+QS*a2+QI		; 2
	jmp	q1	,	<qp1

	cmp	qb+QS*b1,	qb+QS*b1+QI		; 3
	jmp	q2	,	<q1
	cmp	qb+QS*(a1+b1),	qb+QS*(a1+b1)+QI	; 4
qp2	jmp	q2	,	qt2
	cmp	qb+QS*(a2+b1),	qb+QS*(a2+b1)+QI	; 5
	jmp	q2	,	<qp1
	cmp	qb+QS*(a1+b2),	qb+QS*(a1+b2)+QI	; 6
	jmp	q2	,	<qp2

	cmp	qb+QS*(a1+c1),	qb+QS*(a1+c1)+QI	; 7
	jmp	q3	,	<q2
	cmp	qb+QS*(a1+b1+c2),qb+QS*(a1+b1+c2)+QI	; 8
	jmp	q3	,	<qp3
	cmp	qb+QS*(b1+c1),	qb+QS*(b1+c1)+QI	; 9
	jmp	q3	,	<q1
	cmp	qb+QS*(a1+b1+c1),qb+QS*(a1+b1+c1)+QI	; 10
qp3	jmp	q3	,	qt3
	cmp	qb+QS*(a2+b1+c1),qb+QS*(a2+b1+c1)+QI	; 11
	jmp	q3	,	<qp1
	cmp	qb+QS*(a1+b2+c1),qb+QS*(a1+b2+c1)+QI	; 12
	jmp	q3	,	<qp2

	jmp	boot	,	<QS*a2
qt1	spl	0	,	QS*a1
	spl	0	,	QS*b2
qt2	spl	0	,	QS*b1
	spl	0	,	QS*c2
qt3	spl	0	,	QS*c1
qbm	dat	<1	,	<QD*(QN+3)

q3	add	@qp3	,	fnd
q2	add	@qp2	,	@-1
q1	add	@qp1	,	@-2
q0	cmp	null	,	@fnd
	sub	#QI	,	@-1
	add	#QI+1*QD,	@-2
	mov	qbm	,	@fnd
fnd	mov	3000	,	@qb
	sub	#QD	,	fnd
	djn	-3	,	#QN
boot	mov	<psrc	,	<pdst
	mov	<psrc	,	<pdst
	mov	<psrc	,	<pdst
	mov	<psrc	,	<pdst
	mov	<psrc	,	<pdst
	mov	<psrc	,	<pdst
	mov	<psrc	,	<pdst
	mov	<psrc	,	<pdst
	mov	<psrc	,	<pdst
pdst	jmp	@0	,	load0+BOOTDIST

	ROF	; qscan

;------------------------------------

; STEP	primary step of bomber
; DD	distance of spl from mov part of incendiary
; D	distance of clear from gate
; the carpet length of the incendiary is DD-D

;bomb spread		;21.96	;21.95	;21.94	;21.91	;21.78	;21.70	;27.54
;spl-mov time		;795	;602	;523	;771	;414	;317	;~600?
STEP	equ	2231	;3351	;2937	;2937	;2231	;5063	;3281	;6339
N	equ	900	;1356	;1144	;1223	;900	;967	;1046	;1286
DD	equ	100	;44	;73	;50	;100	;81	;76	;44
D	equ	(DD-7)


tgt	equ	(realtgt-DD)

top
bspl	spl	0	,	<-D
	add	#STEP	,	1
	mov	bspl	,	@tgt-(N*STEP)
	mov	bmov	,	@-1
realtgt	jmz	-3	,	@0
	mov	2	,	<-2
	djn	-1	,	<4290
;	dat	<-D-1	,	<-D-1
	dat	<(-D-1)-2668,	<-D-1	; alternate gate
bmov	mov	DD	,	<DD

	end


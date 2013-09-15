;redcode-94nop
;name Really Frenzy II
;author Lukasz Grabun
;strategy optimized and altered version of Really Frenzy
;assert 1

	org	qGo
	
step	equ	3510
gate	equ	(TOP-4)
away	equ	2000
dist	equ	15

boot	mov	bim		, away+20+TOP
src	spl	2		, TOP+10
dest	spl	2		, TOP+10+away
	spl	1		, <-away
	mov	<src		, <dest
	mov	<src		, <dest
	djn	>dest		, #5
	jmp	TOP+away+1	, <-away

TOP
start	add	#step		, 2
	mov	19		, @1
	mov	>bis		, @2-dist
	jmz.b	-3		, <bis
bis	spl	#-dist+1	, #0
	mov	bmb		, >gate
	djn.f	-1		, >gate
bmb	dat	>5335		, 2-gate
for 5
	dat	0		, 0
rof

bim	mov	dist		, }dist

for 36
	dat	0		, 0
rof

qf equ qKil
qs equ 200
qd equ 4000
qi equ 7
qr equ 8

qBmb	dat   	{qi*qr-10	, {1

;    -+)>] 0/1 cycles [(<+-

qGo  	seq   	qd+qf+qs	, qf+qs      ; 1
     	jmp   	qSki		, {qd+qf+qs+qi+2

     	sne   	qd+qf+5*qs	, qf+5*qs    ; B+1
     	seq   	qf+4*qs		, {qTab      ; B
	jmp   	qFas		, }qTab

     	sne   	qd+qf+8*qs	, qf+8*qs    ; A
     	seq   	qf+7*qs		, {qTab-1    ; A-1
     	jmp   	qFas		, {qFas

	sne   	qd+qf+10*qs	, qf+10*qs   ; C
     	seq   	qf+9*qs		, {qTab+1    ; C-1
	jmp   	qFas		, }qFas

	seq   	qd+qf+2*qs	, qf+2*qs    ; B-2
	jmp   	qFas		, {qTab

	seq   	qd+qf+6*qs	, qf+6*qs    ; A-2
	djn.a 	qFas		, {qFas

	seq   	qd+qf+3*qs	, qf+3*qs    ; B-1
        jmp   	qFas		, {qd+qf+3*qs+qi+2

;    -+>)] 2 cycles [(<+-

	sne   	qd+qf+14*qs	, qf+14*qs   ; E+1
	seq   	qf+13*qs	, <qTab      ; E
	jmp   	qSlo		, >qTab

	sne   	qd+qf+17*qs	, qf+17*qs   ; D
	seq   	qf+16*qs	, <qTab-1    ; D-1
	jmp   	qSlo		, {qSlo

	seq   	qd+qf+11*qs	, qf+11*qs   ; E-2
	jmp   	qSlo		, <qTab

	seq   	qd+qf+15*qs	, qf+15*qs   ; D-2
	djn.b 	qSlo		, {qSlo

	sne   	qd+qf+12*qs	, qf+12*qs   ; E-1
	jmz   	boot		, qd+qf+12*qs-qi     ; Free Scan ;-)

qSlo  	mov.ba 	qTab		, qTab
qFas  	mul.ab 	qTab		, qKil
qSki  	sne   	qBmb-1		, @qKil
      	add   	#qd		, qKil

qLoo  	mov.i  	qBmb		, @qKil
qKil  	mov.i  	qBmb		, *qs
      	sub.ab 	#qi		, qKil
      	djn    	qLoo		, #qr
      	jmp    	boot		, <-away
     	dat   	5408		, 7217       ; A*qs =  8*qs ,D*qs = 17*qs
qTab  	dat   	4804		, 6613       ; B*qs =  4*qs ,E*qs = 13*qs
      	dat   	5810		, 1          ; C*qs = 10*qs ,F unused


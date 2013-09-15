;redcode-94nop
;author Lukasz Grabun
;name Disincentive
;strategy MiniQ^3 -> Paper
;assert CORESIZE==8000

	org	qGo

pHit0	equ	1369
pHit1	equ	543
pDst0	equ	4187
pDst1	equ	3065
pDst2	equ	1282

pGo     spl 	2		, 0
	spl	2		, 0
	spl	1		, }0
	spl	1		, 0

pSilk0  spl     @0		, <pDst0
   	mov     }pSilk0		, >pSilk0
pSilk1  spl     @0		, <pDst1
        mov     }pSilk1		, >pSilk1
	mov     pBmb		, >pHit0
	mov	pBmb		, >pHit1
        mov     {pSilk1		, <pSilk2
pSilk2  djn.f   @0		, <pDst2
pBmb	dat     >2667		, >5334

	for	57
	dat	0		, 0
	rof

qf 	equ 	qKil
qs 	equ 	200
qd 	equ 	4000
qi 	equ 	7
qr 	equ 	8

qBmb	dat   	{qi*qr-10	, {1
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
	jmz   	pGo		, qd+qf+12*qs-qi     ; Free Scan ;-)

qFas  	mul.ab 	qTab		, qKil
qSki  	sne   	qBmb-1		, @qKil
      	add   	#qd		, qKil
qLoo  	mov.i  	qBmb		, @qKil
qKil  	mov.i  	qBmb		, *qs
      	sub.ab 	#qi		, qKil
      	djn    	qLoo		, #qr
dDest  	jmp    	pGo		, 0
     	dat   	5408		, 0       ; A*qs =  8*qs ,D*qs = 17*qs
qTab  	dat   	4804		, 0       ; B*qs =  4*qs ,E*qs = 13*qs
dSrc   	dat   	5810		, 0   ; C*qs = 10*qs ,F unused


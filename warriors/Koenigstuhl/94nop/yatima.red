;redcode-94nop
;name Yatima
;version 2.0.5
;author Jens Gutzeit
;strategy MiniQ^3 -> paper
;assert CORESIZE == 8000

	ORG	qGo

	step1	EQU     4271	
	step2	EQU	2307
	step3	EQU     3777
	bstep	EQU	5249

pGo	spl	1, < -4000
	mov.i	-1, 0
	mov	-1, 0
	spl	1, < -5000

silk1	spl	@ silk1, { step1
	mov.i	} silk1, > silk1

silk2	spl	@ silk2, < step2
	mov.i	} silk2, > silk2

	mov	> -bstep, { bstep
	mov	> -bstep * 2, { bstep * 2
	mov	> -bstep * 3, { bstep * 3

	mov.i	{ silk2, < silk3
silk3	djn.f	@ silk3, > step3

for 45
	dat.f	$ 0, $ 0
rof

; MiniQ^3 (Core Warrior 73)

     	qf EQU 	qKil
     	qs EQU 	(qd*2)
     	qd EQU 	107
     	qi EQU 	7
     	qr EQU	11

;    -+)>] 0/1 cycles [(<+-

qGo	seq   	qd+qf+qs,    qf+qs      ; 1
     	jmp   	qSki,        {qd+qf+qs+qi
     	seq   	qd+qf+6*qs,  qf+6*qs    ; B
     	jmp   	qFas,        {qd+qf+6*qs+qi
     	seq   	qd+qf+5*qs,  qf+5*qs    ; B-1
     	jmp   	qFas,        <qBmb
     	seq   	qd+qf+7*qs,  qf+7*qs    ; B+1
     	jmp   	qFas,        >qBmb
     	seq   	qd+qf+9*qs,  qf+9*qs    ; A-1
     	djn   	qFas,        {qFas
     	seq   	qd+qf+10*qs, qf+10*qs   ; A
     	jmp   	qFas,        {qFas

;    -+>)] 2 cycles [(<+-

     	seq   	qd+qf+3*qs,  qf+3*qs    ; C
     	jmp   	>qFas,       {qd+qf+3*qs+qi
     	seq   	qd+qf+2*qs,  qf+2*qs    ; C-1
     	jmp   	>qFas,       {qSlo
     	seq   	qd+qf+4*qs,  qf+4*qs    ; C+1
     	jmp   	>qFas,       }qSlo
     	seq   	qd+qf+12*qs, qf+12*qs   ; B*C-B
     	jmp   	qSlo,        {qSlo
     	seq   	qd+qf+15*qs, qf+15*qs   ; B*C-C
     	jmp   	qSlo,        <qBmb
    	seq   	qd+qf+21*qs, qf+21*qs   ; B*C+C
     	jmp   	qSlo,        >qBmb
     	seq   	qd+qf+24*qs, qf+24*qs   ; B*C+B
     	jmp   	qSlo,        }qSlo
     	seq   	qd+qf+27*qs, qf+27*qs   ; A*C-C
     	djn   	qSlo,        {qFas
     	seq   	qd+qf+30*qs, qf+30*qs   ; A*C
     	jmp   	qSlo,        {qFas
     	sne   	qd+qf+18*qs, qf+18*qs   ; B*C
     	jmz.f 	pGo,         qd+qf+18*qs-10

qSlo	mul.ab 	#3,         qKil       ; C=3
qFas	mul.b 	qBmb,        @qSlo
qSki	sne   	>3456,       @qKil
     	add   	#qd,         qKil
qLoo	mov   	qBmb,        @qKil
qKil	mov   	qBmb,        *qs
     	sub   	#qi,         qKil
     	djn   	qLoo,        #qr
     	jmp   	pGo,         >10        ; A=10
qBmb	dat   	{qi*qr-10,   {6         ; B=6

	END


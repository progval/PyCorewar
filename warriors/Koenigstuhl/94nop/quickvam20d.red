;redcode-94
;name quick vampire 2.0d
;strategy Q^3 by L. Humberto & J. Metcalf, thankyouverymuch
;strategy Q^3/stun -> vampire/stun -> clear
;author Lukasz Grabun
;assert 1

qf 		equ 	qKil
qs 		equ 	100
qd 		equ 	4000
qi 		equ 	7
qr 		equ 	11
		org	qGo

     		dat   	15,	10         ; A,D
qTab		dat   	7,	4          ; B,E
     		dat   	13,	11         ; C,F
qBmb		dat   	{qi*qr-10,{1
qKil		dat	0,	qs

;    -+)>] 0/1 cycles [(<+-

qGo 		seq   	qd+qf+qs,qf+qs        ; 1
		jmp   	qSki,	{qd+qf+qs+qi
		seq   	qd+qf+7*qs,qf+7*qs    ; B
		jmp   	qFas,	{qd+qf+7*qs+qi
		seq   	qd+qf+6*qs,qf+6*qs    ; B-1
		jmp   	qFas,	{qTab
		seq   	qd+qf+8*qs,qf+8*qs    ; B+1
		jmp   	qFas,	}qTab
		seq   	qd+qf+13*qs,qf+13*qs  ; C
		jmp   	qFas,	}qFas
	        seq	qd+qf+14*qs,qf+14*qs  ; A-1
	        djn.a 	qFas,	{qFas
		seq 	qd+qf+15*qs,qf+15*qs  ; A
		jmp	qFas,	{qFas

;    -+>)] 2 cycles [(<+-

		seq	qd+qf+4*qs,qf+4*qs    ; E
	        jmp   	>qFas,	{qd+qf+4*qs+qi
		seq   	qd+qf+3*qs,qf+3*qs    ; E-1
		jmp   	>qFas,	<qTab
		seq   qd+qf+5*qs,qf+5*qs      ; E+1
     jmp   >qFas,       >qTab
     seq   qd+qf+9*qs,  qf+9*qs    ; D-1
     djn.b >qFas,       {qSlo
     seq   qd+qf+10*qs, qf+10*qs   ; D
     jmp   >qFas,       {qSlo
     seq   qd+qf+11*qs, qf+11*qs   ; F
     jmp   >qFas,       }qSlo
     seq   qd+qf+18*qs, qf+18*qs   ; B*E+1-B-E
     djn.f qSlo,        qTab
     seq   qd+qf+21*qs, qf+21*qs   ; B*E-B
     jmp   qSlo,        <qTab
     seq   qd+qf+24*qs, qf+24*qs   ; B*E-E
     jmp   qSlo,        {qTab
     seq   qd+qf+32*qs, qf+32*qs   ; B*E+E
     jmp   qSlo,        }qTab
     seq   qd+qf+35*qs, qf+35*qs   ; B*E+B
     jmp   qSlo,        >qTab
     seq   qd+qf+39*qs, qf+39*qs   ; C*E-C
     djn.b qSlo,        }qFas
     seq   qd+qf+52*qs, qf+52*qs   ; C*E
     jmp   qSlo,        }qFas
     seq   qd+qf+56*qs, qf+56*qs   ; A*E-E
     djn.a qSlo,        {qFas
     seq   qd+qf+60*qs, qf+60*qs   ; A*E
     jmp   qSlo,        {qFas
     seq   qd+qf+63*qs, qf+63*qs   ; B*D-B
     djn.b qSlo,        {qSlo
     seq   qd+qf+66*qs, qf+66*qs   ; B*F-F
     djn.a qSlo,        }qSlo
     seq   qd+qf+70*qs, qf+70*qs   ; B*D
     jmp   qSlo,        {qSlo
     seq   qd+qf+77*qs, qf+77*qs   ; B*F
     jmp   qSlo,        }qSlo
     sne   qd+qf+28*qs, qf+28*qs   ; B*E
     jmz   boot,         qd+qf+28*qs-10  ; Free Scan :-)

qSlo:mul.b qTab,        qKil       ; decode
qFas:mul.ab qTab,       @qSlo
qSki:sne   >3456,       @qKil
     add   #qd,         qKil

		mov.ba	qKil,	qKil
		mov	trap,	>qKil
		mov	jumpy,	>qKil
		mov	jumpy,	{qKil
		mov	trap,	{qKil
		djn	-4,	#25
		
;moje

offset		equ	3359
lp		equ	3362
repeat		equ	1116

ca1		equ	4000
ca2		equ	3000

boot		mov	jumpy,	ca1
		mov	{boot,	<boot

boot2		mov	incr,	ca2
for 7
		mov	{boot2,	<boot2
rof

		jmp	@boot2

start		add.f	incr,	bomba
		mov	bomba,	@bomba
		djn	start,	#repeat

clear		spl	#0,	<-2
		mov	1,	{-1
		dat	<-4,	<-3

bomba		jmp (ca1-1)-(ca2-1)-lp-start-2,lp+start

incr		dat	#-offset,#offset

trap		spl	0
jumpy		jmp	-1


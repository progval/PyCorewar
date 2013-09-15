;redcode-94
;author Jakub Kozisek
;name JaLP
;assert CORESIZE==8000
;strategy Q^3 -> silk
;169.783

	org	qGo

STEP1	equ	1696
STEP2	equ	2461

start	spl	1, {2783
	spl	1, <4862
	spl	1, >1235

copy1	spl	@0, }STEP1	; first copy
	mov.i	}copy1, >copy1

copy2	spl	@0, }STEP2	; second copy
	mov.i	}copy2, >copy2

attack	mov.i   bomb, {1830	; a - indirect bombing
	mov.i	<-1, >3656	; b bombing
	djn.f	attack, <-2	; d-clear

bomb	dat	<2667, <5334

for 19
	dat	1, 1
rof

     qf equ qKil
     qs equ 100
     qd equ 4000
     qi equ 7
     qr equ 11

     dat   15,          10         ; A,D
qTab:dat   7,           4          ; B,E
     dat   13,          11         ; C,F
qBmb:dat   {qi*qr-10,   {1

;    -+)>] 0/1 cycles [(<+-

qGo: seq   qd+qf+qs,    qf+qs      ; 1
     jmp   qSki,        {qd+qf+qs+qi
     seq   qd+qf+7*qs,  qf+7*qs    ; B
     jmp   qFas,        {qd+qf+7*qs+qi
     seq   qd+qf+6*qs,  qf+6*qs    ; B-1
     jmp   qFas,        {qTab
     seq   qd+qf+8*qs,  qf+8*qs    ; B+1
     jmp   qFas,        }qTab
     seq   qd+qf+13*qs, qf+13*qs   ; C
     jmp   qFas,        }qFas
     seq   qd+qf+14*qs, qf+14*qs   ; A-1
     djn.a qFas,        {qFas
     seq   qd+qf+15*qs, qf+15*qs   ; A
     jmp   qFas,        {qFas

;    -+>)] 2 cycles [(<+-

     seq   qd+qf+4*qs,  qf+4*qs    ; E
     jmp   >qFas,       {qd+qf+4*qs+qi
     seq   qd+qf+3*qs,  qf+3*qs    ; E-1
     jmp   >qFas,       <qTab
     seq   qd+qf+5*qs,  qf+5*qs    ; E+1
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
     jmz   start,         qd+qf+28*qs-10  ; Free Scan :-)

qSlo:mul.b qTab,        qKil       ; decode
qFas:mul.ab qTab,       @qSlo
qSki:sne   >3456,       @qKil
     add   #qd,         qKil
qLoo:mov   qBmb,        @qKil      ; .5c negative bomber, scores better
qKil:mov   qBmb,        *qs        ; overall than a bi-directional
     sub   #qi,         qKil
     djn   qLoo,        #qr
     jmp   start,         >4567
     end


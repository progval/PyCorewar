;redcode-94nop
;name Lord of the imp-rings II
;author Neogryzor
;assert CORESIZE==8000
;strategy MiniQ^3->paper/imp
;strategy Improved and optimized version of the Lord, (not at all...)

	STEP1 EQU 2667
	OFFSET EQU 3632	;419
	DEST1 EQU 1071	;1073
	DEST2 EQU 2575	;2578
	DEST3 EQU 1180	;1182

LCH:	SPL 1,{0
	SPL 1,}0
	SPL 1
	SPL A
	SPL C
B:	MOV <SET1,{SET1
SET1:	JMP PAP1+STEP1+OFFSET,PAP1+7
C:	MOV <SET2,{SET2
SET2:	JMP PAP1+2*STEP1+OFFSET,PAP1+7
A:	MOV <SET3,{SET3
SET3:	JMP PAP1+OFFSET,PAP1+7

PAP1:	SPL @0,DEST1
	MOV }PAP1,>PAP1
PAP2:	SPL DEST2,0
	MOV >PAP2,}PAP2
	MOV <PAP2,<PAP3
PAP3:	SPL @0,DEST3
IMP:	MOV.I #0,STEP1
FOR 40
	DAT 0,0
ROF
;   cut and pasted Qscan:

     qf equ qKil
     qs equ (qd*2)
     qd equ 107
     qi equ 7
     qr equ 11

;    -+)>] 0/1 cycles [(<+-

qGo: seq   qd+qf+qs,    qf+qs      ; 1
     jmp   qSki,        {qd+qf+qs+qi
     seq   qd+qf+6*qs,  qf+6*qs    ; B
     jmp   qFas,        {qd+qf+6*qs+qi
     seq   qd+qf+5*qs,  qf+5*qs    ; B-1
     jmp   qFas,        <qBmb
     seq   qd+qf+7*qs,  qf+7*qs    ; B+1
     jmp   qFas,        >qBmb
     seq   qd+qf+9*qs,  qf+9*qs    ; A-1
     djn   qFas,        {qFas
     seq   qd+qf+10*qs, qf+10*qs   ; A
     jmp   qFas,        {qFas

;    -+>)] 2 cycles [(<+-

     seq   qd+qf+3*qs,  qf+3*qs    ; C
     jmp   >qFas,       {qd+qf+3*qs+qi
     seq   qd+qf+2*qs,  qf+2*qs    ; C-1
     jmp   >qFas,       {qSlo
     seq   qd+qf+4*qs,  qf+4*qs    ; C+1
     jmp   >qFas,       }qSlo
     seq   qd+qf+12*qs, qf+12*qs   ; B*C-B
     jmp   qSlo,        {qSlo
     seq   qd+qf+15*qs, qf+15*qs   ; B*C-C
     jmp   qSlo,        <qBmb
     seq   qd+qf+21*qs, qf+21*qs   ; B*C+C
     jmp   qSlo,        >qBmb
     seq   qd+qf+24*qs, qf+24*qs   ; B*C+B
     jmp   qSlo,        }qSlo
     seq   qd+qf+27*qs, qf+27*qs   ; A*C-C
     djn   qSlo,        {qFas
     seq   qd+qf+30*qs, qf+30*qs   ; A*C
     jmp   qSlo,        {qFas
     sne   qd+qf+18*qs, qf+18*qs   ; B*C
     jmz.f LCH,         qd+qf+18*qs-10

qSlo:mul.ab #3,         qKil       ; C=3
qFas:mul.b qBmb,        @qSlo
qSki:sne   >3456,       @qKil
     add   #qd,         qKil
qLoo:mov   qBmb,        @qKil
qKil:mov   qBmb,        *qs
     sub   #qi,         qKil
     djn   qLoo,        #qr
     jmp   LCH,         >10        ; A=10
qBmb:dat   {qi*qr-10,   {6         ; B=6

	end qGo


;redcode-94nop
;name Wipe Uncle
;author Christian Schmidt
;strategy qscanner and paper
;strategy based on Benji's Revenge
;assert 1

org qGo

bStep1  EQU     4409 
bStep2  EQU      271 
pStep1  EQU     3030
pStep2  EQU     2365
pStep3  EQU      777

pStart  spl     1
        spl     1
        mov     -1,     0

pap     spl     @0,    <pStep1
        mov     }-1,    >-1
        mov     }-2,    >-2
        spl     @0,     <pStep2
        mov     }-1,    >-1
        spl     @0,     <pStep3
        mov     }-1,    >-1
        mov.i   #1,     {1
        mov.i   #bStep1,   <1
        djn.f   -2,     <bStep2

	  for     45
	  dat	    0,      0
	  rof

qf 	equ 	qKil
qs 	equ 	200
qd 	equ 	4000
qi 	equ 	7
qr 	equ 	8

qBmb	dat   	{qi*qr-10, {1
qGo  	seq   	qd+qf+qs, qf+qs
     	jmp   	qSki, {qd+qf+qs+qi+2
     	sne   	qd+qf+5*qs, qf+5*qs
     	seq   	qf+4*qs, {qTab
	jmp   	qFas, }qTab
     	sne   	qd+qf+8*qs, qf+8*qs
     	seq   	qf+7*qs, {qTab-1
     	jmp   	qFas, {qFas
	sne   	qd+qf+10*qs, qf+10*qs
     	seq   	qf+9*qs, {qTab+1
	jmp   	qFas, }qFas
	seq   	qd+qf+2*qs, qf+2*qs
	jmp   	qFas, {qTab
	seq   	qd+qf+6*qs, qf+6*qs
	djn.a 	qFas, {qFas
	seq   	qd+qf+3*qs, qf+3*qs
      jmp   	qFas, {qd+qf+3*qs+qi+2
	sne   	qd+qf+14*qs, qf+14*qs
	seq   	qf+13*qs, <qTab
	jmp   	qSlo, >qTab
	sne   	qd+qf+17*qs, qf+17*qs
	seq   	qf+16*qs, <qTab-1
	jmp   	qSlo, {qSlo
	seq   	qd+qf+11*qs, qf+11*qs
	jmp   	qSlo, <qTab
	seq   	qd+qf+15*qs, qf+15*qs
	djn.b 	qSlo, {qSlo
	sne   	qd+qf+12*qs, qf+12*qs
	jmz   	pStart, qd+qf+12*qs-qi     
qSlo  mov.ba 	qTab, qTab
qFas  mul.ab 	qTab, qKil
qSki  sne   	qBmb-1, @qKil
      add   	#qd, qKil
qLoo  mov.i  	qBmb, @qKil
qKil  mov.i  	qBmb, *qs
      sub.ab 	#qi, qKil
      djn    	qLoo, #qr
      jmp    	pStart, <-4000
     	dat   	5408, 7217
qTab  dat   	4804, 6613
dSrc  dat   	5810, qBmb-5 

end 


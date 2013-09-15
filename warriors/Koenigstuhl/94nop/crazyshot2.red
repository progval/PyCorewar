;redcode-94nop
;name CrazyShot 2
;author Christian Schmidt
;strategy mini Q^4 -> .66c Bishot-style Scanner
;strategy new qscan, slightly tweaked scanner
;assert 1

sOff    equ     (20*sStep-1)
sStep   equ     10
sDelet  equ     205
sSt     equ     3

sOne    add.f   sAdd,        sPtr
        sne.i   *sPtr,       @sPtr
        jmp     sOne,        0
        jmp     sBomb,       0
for sSt
        dat     0,           0
rof
        dat     0,           0
sAdd    dat.f   sStep,       sStep
sPtr    spl     {sOff,       >4000+sOff-sDelet
        dat     0,           0
        dat     0,           0
        dat     {10,         >4010-sDelet
sBomb   spl     #20,         <-100
sLoop   mov     sBomb,       >sPtr
        mov     sBomb,       }sPtr
sBack   djn.a   sLoop,       <sBomb

for 44-sSt
dat 0, 0
rof

org qGo

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
	jmz   	sOne, qd+qf+12*qs-qi     
qSlo  mov.ba 	qTab, qTab
qFas  mul.ab 	qTab, qKil
qSki  sne   	qBmb-1, @qKil
      add   	#qd, qKil
qLoo  mov.i  	qBmb, @qKil
qKil  mov.i  	qBmb, *qs
      sub.ab 	#qi, qKil
      djn    	qLoo, #qr
      jmp    	sOne, <-4000
     	dat   	5408, 7217
qTab  dat   	4804, 6613
dSrc  dat   	5810, qBmb-5 

end 


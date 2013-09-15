;redcode-94nop
;name Claw
;author Fizmo
;assert 1
;strategy scanner

sStep	  equ    2987
sDist     equ    12
sStart    equ    (sScan+(sStep*10))
tDecoy    equ    (sScan-1195)

          sub    sAdd,     sScan
sScan	  seq    sStart,   sStart+sDist
	  slt.ab #40,      sScan
sBack	  djn    -3,       #1700
sLen	  mov    #8,       #0
	  mov    sScan,    sScan-3
	  mov    sBomb,    }sScan-3
	  mov    sBomb,    >sScan-3
	  djn    -2,       sLen
	  jmn.b  sBack,    sBack
	  add.a  #(8001/21)+1,cBomb
	  mov    @-1,      {cBomb
	  jmp     -2,      0
cBomb	  spl    #1,       #4
sAdd	  dat    -sStep,   -sStep
sBomb	  spl    -1,       0

for 42
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
	jmz   	sScan, qd+qf+12*qs-qi     
qSlo  mov.ba 	qTab, qTab
qFas  mul.ab 	qTab, qKil
qSki  sne   	qBmb-1, @qKil
      add   	#qd, qKil
qLoo  mov.i  	qBmb, @qKil
qKil  mov.i  	qBmb, *qs
      sub.ab 	#qi, qKil
      djn    	qLoo, #qr
      jmp    	sScan, <-4000
     	dat   	5408, 7217
qTab  dat   	4804, 6613
dSrc  dat   	5810, qBmb-5 

end 


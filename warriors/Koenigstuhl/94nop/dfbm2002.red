;redcode-94nop
;name Digital FireBreathingMonster 2002
;author Christian Schmidt
;strategy q^3 -> d-clear + 7pt imps
;strategy name suggested by a r.g.c. post from Pihlaja ;-)
;strategy it's an improved version of Digital Dragon 
;strategy and scores on my test suit much, much better. 
;strategy But there will be always a weakness against
;strategy silk's and some scanner, so it will never
;strategy be successfull for a longer term on the hill:-(
;strategy Bootdistance now optimized against Silver Talon
;assert 1

impoff  equ     627+200
impsize equ     1143
cBoot   equ     6800
iBoot   equ     cBoot-1201

pGo      mov.i clrb,         cEnd+cBoot-18-3
         mov.i ptr,         cEnd+cBoot-19-3
         spl   2
         spl   1
         mov -1, 0
         mov.i {cEnd,        {cBoo
         mov.i {iEnd,        {iBoo
cBoo     djn   cEnd+cBoot,   #5
iBoo     jmp   iEnd+iBoot

ptr      dat    0,      6000 
clrb     dat    >2667,       25
clear    spl    #0,          >ptr-15
loop     mov    clrb-15,     >ptr-15
cc       djn.f  loop,        >ptr-15
         dat    0,           0
         dat    0,           0
cEnd     dat    0,           0

pump     spl     #1,         >prime
prime    mov.i   imp,        impoff-4
         add.f   #impsize+1, iptr
iptr     jmp     pump+impoff-(impsize+1), >-200
imp      mov.i   #impsize,   *0
iEnd     dat     0, 0

for 35
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
	jmz   	pGo, qd+qf+12*qs-qi     
qSlo  mov.ba 	qTab, qTab
qFas  mul.ab 	qTab, qKil
qSki  sne   	qBmb-1, @qKil
      add   	#qd, qKil
qLoo  mov.i  	qBmb, @qKil
qKil  mov.i  	qBmb, *qs
      sub.ab 	#qi, qKil
      djn    	qLoo, #qr
      jmp    	pGo, <-4000
     	dat   	5408, 7217
qTab  dat   	4804, 6613
dSrc  dat   	5810, qBmb-5 

end 

	end


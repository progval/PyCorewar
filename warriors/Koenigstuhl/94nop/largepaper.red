;redcode-94nop
;name Large Paper
;author Christian Schmidt
;strategy Q^3 -> large paper
;strategy 
;assert 1

org qGo

pStep1 equ  354 
pStep2 equ  4416 
pStep3 equ  6017 
bStep1 equ  6165 
bStep2 equ  125 
bStep3 equ  7244 

pGo    spl   1
       spl   1
       spl   1

silk1  spl   @0,     {pStep1
       mov.i }-1,    >-1
       mov.i }-2,    >-2
silk2  spl   @0,     {pStep2
       mov.i }-1,    >-1
       mov.i pBmb,   >bStep1
       mov.i pBmb,   >bStep2
       mov.i pBmb,   >bStep3
       mov.i {silk2, <silk3
silk3  jmz.a @0,     pStep3
pBmb   dat   >2667,  >5334

for   39
      dat    0,      0
rof

qf     equ qKil
qs     equ 200
qd     equ 4000
qi     equ 14
qr     equ 8

qBmb	dat    {qi*qr-10, {1
qGo  	seq    qd+qf+qs, qf+qs
     	jmp    qSki, {qd+qf+qs+qi+2
     	sne    qd+qf+5*qs, qf+5*qs
     	seq    qf+4*qs, {qTab
	jmp    qFas, }qTab
     	sne    qd+qf+8*qs, qf+8*qs
     	seq    qf+7*qs, {qTab-1
     	jmp    qFas, {qFas
	sne    qd+qf+10*qs, qf+10*qs
     	seq    qf+9*qs, {qTab+1
	jmp    qFas, }qFas
	seq    qd+qf+2*qs, qf+2*qs
	jmp    qFas, {qTab
	seq    qd+qf+6*qs, qf+6*qs
	djn.a  qFas, {qFas
	seq    qd+qf+3*qs, qf+3*qs
        jmp    qFas, {qd+qf+3*qs+qi+2
	sne    qd+qf+14*qs, qf+14*qs
	seq    qf+13*qs, <qTab
	jmp    qSlo, >qTab
	sne    qd+qf+17*qs, qf+17*qs
	seq    qf+16*qs, <qTab-1
	jmp    qSlo, {qSlo
	seq    qd+qf+11*qs, qf+11*qs
	jmp    qSlo, <qTab
	seq    qd+qf+15*qs, qf+15*qs
	djn.b  qSlo, {qSlo
	sne    qd+qf+12*qs, qf+12*qs
	jmz    pGo, qd+qf+12*qs-qi

qSlo  mov.ba qTab,   qTab
qFas  mul.ab qTab,   qKil
qSki  sne    qBmb-1, @qKil
      add    #qd,    qKil
qLoo  mov.i  qBmb,   @qKil
qKil  mov.i  qBmb,   *qs
      sub.ab #qi,    qKil
      djn    qLoo,   #qr
      jmp    pGo,    <-4000
      dat    5408,   7217
qTab  dat    4804,   6613
dSrc  dat    5810,   qBmb-5

end


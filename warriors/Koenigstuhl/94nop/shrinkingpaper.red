;redcode-94nop
;name Shrinking Paper
;author Christian Schmidt
;strategy A curious paper!! It looses
;strategy in the beginning some of its
;strategy processes, because of the uncommon
;strategy front silk-engine. It scores ok
;strategy against stone/imps and some scanner.
;assert 1

org qGo

pStep1 EQU    6372
pStep2 EQU    2676 
pStep3 EQU    4157

spec  spl    pStep1, <pStep1-1
      mov.i  }-2,    >-1
silk1 spl    @0,     <pStep2
      mov.i  }-1,    >-1
silk2 spl    @0,     <pStep3
      mov.i  }-1,    >-1
bomb  mov.i  #1,     <1
cc    djn    -2,     <-22-pStep1
      dat    0,      0
      dat    0,      0

pGo   spl 2
      spl 2
      spl 1
      mov.i  -1,     #0

      mov    {cc+2,  {pBo1
pBo1  spl    cc+2000
      mov    <cc+2,  {pBo2
pBo2  jmp    cc+6000

for   40
      dat    0,      0
rof

qf 	 equ qKil
qs     equ 200
qd 	 equ 4000
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


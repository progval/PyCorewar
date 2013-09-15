;redcode-94nop
;name Revenge of the Papers
;author Fizmo+Roy
;strategy Papers...and a scan...thats all!
;assert 1

org qGo

;constants for the coreclear paper
nstep1 equ 1319
cstep1 equ 1871
tstep1 equ 1471

pAw1   equ 6000
pAw2   equ 2000

pGo   spl    1,    <pGo+1169
      spl    1,    <pGo+1217
      spl    1,    <pGo+1482

      mov    {cp,    {pBo1
pBo1  spl    pEnd+pAw1,{2093

      mov    {pEnd,    {pBo2
pBo2  jmp    pEnd+pAw2,{2093

cp    spl    @pEnd,  <tstep1
      mov.i  }cp,    >cp
nothA spl    @nothA, <cstep1
      mov.i  }nothA, >nothA
nothB spl    @nothB, <nstep1
      mov.i  }nothB, >nothB
bomb  mov.i  #1,     <1
cc    djn    -2,     <2335

pEnd  dat    0,      0

for   42
      dat    0,      0
rof

;constants for the quickscanner
qf 	equ 	qKil
qs      equ     200
qd 	equ 	4000
qi      equ     14
qr      equ     8
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


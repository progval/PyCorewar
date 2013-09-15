;redcode-94nop
;name badness
;strategy Sadly, one human, some IRC'ing and a bunch of computers were used
;strategy to make this warrior. Its a pair of ugly evolved papers,
;strategy and Roys qscan magic I've shamelessly poached.
;author bvowk
;assert 1

org qGo

away equ        1866
away2 equ       -765

pGo     spl.ab $    2 , < 1379
        spl.ba $    1 , < 2971
        spl.a  $    1 , < 2943
        spl.a    pgo2 , < 1379
        mov.i  < pBoo , { pBoo
pBoo    jmp    pGo+away, silke+1
        spl.a  @    0 , $ 1949
        mov.i  }   -1 , >   -1
        mov.i  #-2855 , {    1
        mov.i  >  214 , >   -3
        mov.i  {   -4 , {    1
silke   djn.f  $ 2868 , {-3318

for 28
dat $0,$0
rof

;constants for the quickscanner
qf 	equ 	qKil
qs      equ     200
qd 	equ 	4000
qi      equ     5
qr      equ     11
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

for 10
dat <2,<3
rof

for 0
dat $0,$0
rof

pgo2   mov.i  < pBoo2 , { pBoo2
pBoo2  jmp    pgo2+away2, silke2+1

       SPL.B  @     0, $  2356
       MOV.I  }    -1, >    -1
       MOV.I  #    -1, {     1
       MOV.I  >   214, >    -3
       MOV.I  {    -4, {     1
silke2 DJN.F  $  2163, <  3000


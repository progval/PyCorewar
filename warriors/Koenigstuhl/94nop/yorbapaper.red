;redcode-94nop
;name Yorba Paper
;author Roy van Rijn
;strategy I'm tired of those stone/papers
;strategy So this is just a plain paper!
;assert 1

cStep1  equ     5382
cStep2  equ     2471
cStep3  equ     3428

bStep1  equ     6964
bStep2  equ     1200

bDist1  equ     3640
bDist2  equ     4631

pGo     spl     1       , <3555
        spl     1       , <5335
        spl     1       , <2363

        mov     <pEnd   , {1
pBoot1  spl     bDist1  , >5747

        mov     {pEnd   , {1
pBoot2  djn.f   bDist2  , >4584

for     14
        dat     0       , 0
rof

        spl     @0      , >cStep1
        mov.i   }-1     , >-1
        spl     @0      , >cStep2
        mov.i   }-1     , >-1
        mov.i   pBomb   , <bStep1
        mov.i   {-3     , {1
        djn.f   cStep3  , >bStep2
pBomb   dat.f   <2667   , >5334
pEnd    dat     0       , 0

for     28
        dat     0       , 0
rof

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

end qGo


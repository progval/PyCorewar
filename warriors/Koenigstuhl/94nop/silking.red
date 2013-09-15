;redcode-94nop
;name SilKing
;author Christian Schmidt
;strategy mini Q^3 -> booting two different papers
;assert CORESIZE==8000

     org qGo

pStep1 equ 560
pStep2 equ 2680
pStep3 equ -1120
x      equ -3781
y      equ -2013

impy   equ 2667
aaa    equ 1880
bbb    equ 2050
ccc    equ  240

qf     equ qKil
qs     equ (qd*2)
qd     equ 107
qi     equ 7
qr     equ 11

pAway  equ 2000
pOff   equ 2000

pGo: spl   1,      >424
     spl   1,      {761
     spl   1,      {933

     mov   {pap1,  {pBoo
pBoo:spl   pEnd+pAway,}-2345

     mov   {paper,  {p1Boo
p1Boo:spl   xEnd+pAway+pOff,}-1234

     mov   {pEnd,  {p2Boo
p2Boo:jmp   pEnd+pAway+4000,}-2345

pap1:spl   @pEnd,  <pStep1
     mov.i }pap1,  >pap1
pap2:spl   @0,     {pStep2
     mov.i }pap2,  >pap2
     mov.i #1,     <1
     mov   x,      <y
     mov.i {pap2,  <pap3
pap3:jmz.a @0,     pStep3
pEnd:dat   0,0

a for 31
     dat   0,0
  rof

qGo: seq   qd+qf+qs,    qf+qs 
     jmp   qSki,        {qd+qf+qs+qi
     seq   qd+qf+6*qs,  qf+6*qs 
     jmp   qFas,        {qd+qf+6*qs+qi
     seq   qd+qf+5*qs,  qf+5*qs
     jmp   qFas,        <qBmb
     seq   qd+qf+7*qs,  qf+7*qs
     jmp   qFas,        >qBmb
     seq   qd+qf+9*qs,  qf+9*qs
     djn   qFas,        {qFas
     seq   qd+qf+10*qs, qf+10*qs
     jmp   qFas,        {qFas
     seq   qd+qf+3*qs,  qf+3*qs
     jmp   >qFas,       {qd+qf+3*qs+qi
     seq   qd+qf+2*qs,  qf+2*qs
     jmp   >qFas,       {qSlo
     seq   qd+qf+4*qs,  qf+4*qs
     jmp   >qFas,       }qSlo
     seq   qd+qf+12*qs, qf+12*qs
     jmp   qSlo,        {qSlo
     seq   qd+qf+15*qs, qf+15*qs
     jmp   qSlo,        <qBmb
     seq   qd+qf+21*qs, qf+21*qs
     jmp   qSlo,        >qBmb
     seq   qd+qf+24*qs, qf+24*qs
     jmp   qSlo,        }qSlo
     seq   qd+qf+27*qs, qf+27*qs
     djn   qSlo,        {qFas
     seq   qd+qf+30*qs, qf+30*qs
     jmp   qSlo,        {qFas
     sne   qd+qf+18*qs, qf+18*qs
     jmz.f pGo,         qd+qf+18*qs-10

qSlo:mul.ab #3,         qKil
qFas:mul.b qBmb,        @qSlo
qSki:sne   >3456,       @qKil
     add   #qd,         qKil
qLoo:mov   qBmb,        @qKil
qKil:mov   qBmb,        *qs
     sub   #qi,         qKil
     djn   qLoo,        #qr
     jmp   pGo,         >10
qBmb:dat   {qi*qr-10,   {6 

paper spl  @xEnd, >aaa
      mov }-1, >-1
      spl  @0, >bbb
      mov }-1, >-1
      spl  @0, <2668
      mov }-1, >-1
      mov.i #2*aaa, }-aaa
      mov.i #bbb, impy
xEnd  dat 0, 0

    end

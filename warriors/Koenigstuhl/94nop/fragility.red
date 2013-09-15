;redcode-94
;name Fragility
;author John Metcalf
;strategy Q^2 -> stone/imp
;assert CORESIZE==8000

; from 1997, my first attempt to create my own qscan!

     org   qGo
     qf equ (qGo+1111)
     qd equ (227)
     qs equ (qd*2)
     qi equ (7)

qGo: seq   qf,       qd+qf
     jmp   qFas,     }qf+2

     seq   qf+qs*2,  qd+qf+qs*2
     jmp   qSet,     <qPnt
     seq   qf+qs*3,  qd+qf+qs*3
     jmp   qSet,     >qPnt
     seq   qf+qs,    qd+qf+qs
     jmp   qSet,     {qf+qs+2

     seq   qf+qs*10, qd+qf+qs*10
     jmp   >qSet,    {qPnt
     seq   qf+qs*4,  qd+qf+qs*4
     jmp   >qSet,    }qPnt
     seq   qf+qs*6,  qd+qf+qs*6
     jmp   >qSet,    {qf+qs*6+2

     seq   qf+qs*8,  qd+qf+qs*8
     jmp   @qSet,    <qPnt
     seq   qf+qs*9,  qd+qf+qs*9
     jmp   @qSet,    >qPnt
     seq   qf+qs*12, qd+qf+qs*12
     djn.f @qSet,    qPnt

     seq   qf+qs*11, qd+qf+qs*11
     jmp   @qSet,    {qPnt
     seq   qf+qs*5,  qd+qf+qs*5
     jmp   @qSet,    }qPnt
     sne   qf+qs*7,  qd+qf+qs*7
     jmp   pGo,      {2493

     add.f *qPnt,    qKil
qSet:add.f @qPnt,    @-1

qFas:sne   qGo-1,    @qKil
     add   qDis,     qKil

qLoo:mov   qPnt,     *qKil
qKil:mov   qf+4,     qf
     add   qInc,     qKil
     djn   qLoo,     #10

     jmp   pGo,      {2584

qDis:dat   qd,       qd
qInc:dat   -qi,      qi
qPnt:dat   >qTb1,    >qTb2

     dat   10*qs,    10*qs
qTb1:dat   6*qs,     6*qs
     dat   4*qs,     4*qs

     dat   2*qs,     2*qs
qTb2:dat   qs,       qs
     dat   3*qs,     3*qs

     for   36
     dat   0,        0
     rof

     sStep equ (-2618)
     iStep equ (5091)

     sDist equ (pGo+6294)
     iDist equ (sDist+4000)

pGo:

iBoo:mov   iImp,     iDist

     for   4
     mov   <sBoo,    {sBoo
     rof

sBoo:spl   sDist,    off+4

     for   4
     mov   {iBoo,    <iBoo
     rof

     jmp   @iBoo,    {3493   

off: spl   #sStep,   <-sStep
sto: mov   >sStep,   1-sStep ; incremented
     add   off,      sto
     jmp   sto,      off     ; incremented


iPmp:spl   #iImp,    >-20
     sub.f #-iStep-1,iJmp
     mov   iImp,     }iPmp
iJmp:jmp   iImp-2*(iStep+1),>iImp-3*iStep-1
iImp:mov.i #0,       iStep

     end

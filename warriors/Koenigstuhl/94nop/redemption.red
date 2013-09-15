;redcode-94nop
;name Redemption
;author John Metcalf
;strategy MiniQ^3 -> Paper
;assert CORESIZE==8000

     org qGo

     pStep1 equ 3750
     pStep2 equ 1610
     pStep3 equ 1400

pGo: spl   }2,          >365
     spl   *1,          >258
     spl   0,           >571

pap1:spl   @0,          >pStep1
     mov   }pap1,       >pap1
     mov   }pap1,       >pap1
pap2:spl   pStep2,      0
     mov   >pap2,       }pap2
     mov.i #pStep2+10,  }-pStep3
     mov   <pap2,       <pap3
pap3:djn.f @0,          }pStep3+1

     for   47
     dat   0,0
     rof

     qf equ qKil
     qs equ (-250)
     qd equ (-125)
     qi equ 7
     qr equ 11

qGo: seq   qd+qf+qs,    qf+qs
     djn.f qSki,        {qd+qf+qs+qi
     seq   qd+qf+6*qs,  qf+6*qs
     djn.f qFas,        {qd+qf+6*qs+qi
     seq   qd+qf+5*qs,  qf+5*qs
     jmp   qFas,        <qBmb
     seq   qd+qf+7*qs,  qf+7*qs
     jmp   qFas,        >qBmb
     seq   qd+qf+9*qs,  qf+9*qs
     djn   qFas,        {qFas
     seq   qd+qf+10*qs, qf+10*qs
     jmp   qFas,        {qFas
     seq   qd+qf+3*qs,  qf+3*qs
     djn.f >qFas,       {qd+qf+3*qs+qi
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
qSki:sne   >594,        @qKil
     add   #qd,         qKil
qLoo:mov   *qKil,       @qKil
qKil:mov   qBmb,        *qs
     sub   #qi,         qKil
     djn   qLoo,        #qr
     djn.f pGo,         <10
qBmb:dat   {qi*qr-10,   {6
     end


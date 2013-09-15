;redcode-94
;name KafuFFLe
;author John Metcalf
;strategy Mini-Q^3 -> Paper/Stone
;assert CORESIZE==8000

     pBoot equ pGo+501
     sBoot equ pBoot-755           ; still tweaking!

     org qGo
pGo: spl   1,        >sBoot-2619
     mov   <sFrm,    {sPos
     spl   1,        >sBoot+2759
     mov   <sFrm,    {sPos
sPos:spl   sBoot+6,  >sBoot-3494   ; launch stone

     mov   {pap1,    {pPos
     mov   {pap1,    {pPos
pPos:djn.f pBoot+8,  <sBoot-1666   ; launch paper

     pStep1 equ 1312
     pStep2 equ 3692
     pStep3 equ 5323               ; still tweaking!

pap1:spl   @0+8,     <pStep1       ; paper (Nomad)
     mov   }pap1,    >pap1
     mov   }pap1,    >pap1
pap2:spl   @0,       <pStep2
     mov   }pap2,    >pap2
     mov   {pap2,    <pap3
pap3:spl   *pStep3-4,>pStep3
     mov.i #pStep2-pStep3+1,}pStep3-1

     for 36
     dat 0,0
     rof

     sStp equ 703
     sTim equ 1183

sFrm:spl   #0,       #0+6          ; stone (Uninvited)
sLp: mov   sBmb,     @sPtr
sSel:sub.x #sStp*2,  @sLp
sPtr:mov   {3582,    }sSel+2*sStp*sTim
     djn.f @sSel,    }sPtr
sBmb:dat   <sStp,    >1

     qf equ qKil                   ; Mini-Q^3
     qs equ 222
     qd equ 322
     qi equ 7
     qr equ 11

qGo: seq   qd+qf+qs,    qf+qs      ; 1
     djn.f qSki,        {qd+qf+qs+qi
     seq   qd+qf+6*qs,  qf+6*qs    ; B
     djn.f qFas,        {qd+qf+6*qs+qi
     seq   qd+qf+5*qs,  qf+5*qs    ; B-1
     jmp   qFas,        <qBmb
     seq   qd+qf+7*qs,  qf+7*qs    ; B+1
     jmp   qFas,        >qBmb
     seq   qd+qf+9*qs,  qf+9*qs    ; A-1
     djn   qFas,        {qFas
     seq   qd+qf+10*qs, qf+10*qs   ; A
     jmn   qFas,        {qFas

     seq   qd+qf+3*qs,  qf+3*qs    ; C
     djn.f >qFas,       {qd+qf+3*qs+qi
     seq   qd+qf+2*qs,  qf+2*qs    ; C-1
     jmn   >qFas,       {qSlo
     seq   qd+qf+4*qs,  qf+4*qs    ; C+1
     jmn   >qFas,       }qSlo
     seq   qd+qf+12*qs, qf+12*qs   ; B*C-B
     jmn   qSlo,        {qSlo
     seq   qd+qf+15*qs, qf+15*qs   ; B*C-C
     jmp   qSlo,        <qBmb
     seq   qd+qf+21*qs, qf+21*qs   ; B*C+C
     jmp   qSlo,        >qBmb
     seq   qd+qf+24*qs, qf+24*qs   ; B*C+B
     jmn   qSlo,        }qSlo
     seq   qd+qf+27*qs, qf+27*qs   ; A*C-C
     djn   qSlo,        {qFas
     seq   qd+qf+30*qs, qf+30*qs   ; A*C
     jmn   qSlo,        {qFas
     sne   qd+qf+18*qs, qf+18*qs   ; B*C
     jmz.f pGo,         qd+qf+18*qs-10

qSlo:mul   #3,          qKil       ; C=3
qFas:mul.b qBmb,        @qSlo
qSki:sne   >qf+23*qs,   >qKil
     add   #qd,         qKil
qLoo:mov   *qKil,       <qKil
qKil:mov   qBmb,        }qs
     sub   #qi-1,       @qLoo
     djn   qLoo,        #qr
     djn.f pGo,         <10        ; A=10
qBmb:dat   {qi*qr-10,   {6         ; B=6
     end


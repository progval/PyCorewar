;redcode-94nop
;name Seven
;author John Metcalf
;strategy simple anti-qscan -> paper
;assert CORESIZE==8000

     org qGo

pGo: spl 1,<4000
     spl 1,<2000
     pStep1 equ 7340 ; 4855
     pStep2 equ 3020 ; 2340
     pStep3 equ 2925 ; 3170
pap1:spl @0,   <pStep1
     mov }pap1,>pap1
     mov }pap1,>pap1
pap2:spl @0,   <pStep2
     mov }pap2,>pap2
     mov {pap2,<pap3
pap3:spl @0,   >pStep3
     mov.i #pStep2-pStep3+1,}pStep3-1

     for 45
     dat 0,0
     rof

     qf equ qKil
     qs equ (qd*2)
     qd equ 100
     qi equ 4
     qr equ 7

;    -+)>] 0/1 cycles [(<+-

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
     jmp   qFas,        {qFas

;    -+>)] 2 cycles [(<+-

     seq   qd+qf+3*qs,  qf+3*qs    ; C
     djn.f >qFas,       {qd+qf+3*qs+qi
     seq   qd+qf+2*qs,  qf+2*qs    ; C-1
     jmp   >qFas,       {qSlo
     seq   qd+qf+4*qs,  qf+4*qs    ; C+1
     jmp   >qFas,       }qSlo
     seq   qd+qf+12*qs, qf+12*qs   ; B*C-B
     jmp   qSlo,        {qSlo
     seq   qd+qf+15*qs, qf+15*qs   ; B*C-C
     jmp   qSlo,        <qBmb
     seq   qd+qf+21*qs, qf+21*qs   ; B*C+C
     jmp   qSlo,        >qBmb
     seq   qd+qf+24*qs, qf+24*qs   ; B*C+B
     jmp   qSlo,        }qSlo
     seq   qd+qf+27*qs, qf+27*qs   ; A*C-C
     djn   qSlo,        {qFas
     seq   qd+qf+30*qs, qf+30*qs   ; A*C
     jmp   qSlo,        {qFas
     sne   qd+qf+18*qs, qf+18*qs   ; B*C
     jmz.f pGo,         qd+qf+18*qs-10

qSlo:mul.ab #3,         qKil       ; C=3
qFas:mul.b qBmb,        @qSlo
qSki:sne   >qf+23*qs,   @qKil
     add   #qd,         qKil

     slt.ab @qKil,      #90
     mov   >qd+qf+23*qs,>qKil
     add.ab >qKil,      qKil

qLoo:mov   *qKil,       @qKil
qKil:mov   qBmb,        }qs
     add   #qi,         @qLoo
     djn   qLoo,        #qr
     djn.f pGo,         <10        ; A=10
qBmb:dat   {-92,        {6         ; B=6
     end
a

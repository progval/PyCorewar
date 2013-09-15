;redcode-94
;name Wintermute
;author John Metcalf
;strategy MiniQ^3 -> Stone/Imp
;assert CORESIZE==8000

     org qGo

     sBoot equ (sPtr+2093)
     iBoot equ (sBoot-sStep)

pGo: spl   2,           >-200      ; 5 processes
     spl   2,           >-350
     spl   1,           {-500
     mov   <sBmb,       {iPos      ; launch imp
     mov   <sPtr,       {sPos      ; launch stone
sPos:djn   sBoot+5,     #5         ; 4 processes for the stone
iPos:jmp   iBoot+5,     >-550      ; and 1 process for the imp

     sStep equ 3039
     sTime equ 3357

     spl   #0,          0
sLp: mov   sBmb,        @sP
sSel:add   #sStep,      sP
sP:  djn.f sLp,         {sSel-sStep*sTime
sBmb:dat   2,           >6         ; used as boot pointer for imp

     iStep equ 1143                ; 7-point imps

iPmp:spl   #iImp,       >-20
     sub.f #-iStep-1,   iJmp
sPtr:mov   iImp,        }iPmp      ; used as boot pointer for stone
iJmp:jmp   iImp-2*(iStep+1),>iImp+2*iStep-1
iImp:mov.i #iStep/2,    iStep

     for   41
     dat   0,0
     rof

     qf equ qKil
     qs equ (qd*2)
     qd equ 100
     qi equ 7
     qr equ 11

;    -+)>] 0/1 cycles [(<+-

qGo: seq   qd+qf+qs,    qf+qs      ; 1
     jmp   qSki,        {qd+qf+qs+qi
     seq   qd+qf+6*qs,  qf+6*qs    ; B
     jmp   qFas,        {qd+qf+6*qs+qi
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
     jmp   >qFas,       {qd+qf+3*qs+qi
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
qSki:sne   >3456,       @qKil
     add   #qd,         qKil
qKil:mov   qBmb,        *qs
     sub   #qi,         qKil
     mov   qBmb,        @qKil
     djn   qKil,        #qr
     jmp   pGo,         >10        ; A=10
qBmb:dat   {qi*qr-10,   {6         ; B=6
     end


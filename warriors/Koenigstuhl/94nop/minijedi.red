;redcode-94
;name Mini Return Of The Jedimp
;author John K W
;strategy MiniQ^3 -> Jedimp / Wimp
;assert CORESIZE==8000

      org qGo
d2    equ 1143
TSTEP equ 1751
bstep equ 1819 ;2283 ;1997
wBoot equ evol+1023

evol:   spl   @evol,    }TSTEP
        mov.i }evol,    >evol
evoli:  spl   #d2,      bstep-1
        mov   b,        >2
        add.f evoli,    j
j:      jmp.f imp2-d2*8,{-6+bstep
b       dat   <1,       1
imp2    mov.i #d2,      *0

     for   43
     dat   0,0
     rof

wimp:jmp   #0,          #0

     qf equ qKil
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
pGo: spl   2,           >-600
     spl   2,           {-1100
     spl   1,           }0
     spl   1,           {-1600
     djn   evol,        #1
     mov   wimp,        *1
     djn.f wBoot,       <10        ; A=10
qBmb:dat   {qi*qr-10,   {6         ; B=6
     end


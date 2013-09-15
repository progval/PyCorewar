;redcode-94
;name The Pendragon
;author Christian Schmidt
;strategy Q^3 -> stone/imp
;strategy v0.1  new engine for a stone/imp
;strategy v0.2  now 3 instructions smaller
;strategy v0.3  add corecoloring
;assert CORESIZE==8000

     org qGo

qf      equ     qKil
qs      equ  100
qd      equ     4000
qi      equ     7
qr      equ     11
cBptr   equ     3001-4
istep   equ     2667

iStart  spl     1,          }qd+qf+2*qs      ;vortex-launcher with some
        spl     1,    }qd+qf+12*qs     ;corecoloring add-ons
        spl     #0,         }qd+qf+16*qs
        add.f   iptr,       launch
launch  spl     imp-istep-1,}cSp+cBptr+200
        djn     cSp+cBptr,  }cSp+cBptr-200

    for 12
        dat     0,          0
    rof

iptr    dat     2667,       17
imp     mov.i   #istep,     *0
  mov.i   #istep,     *0

cBoot   spl     iStart,     }qd+qf+19*qs
        mov     cBomb,      cSp+cBptr+198
        mov     cSp,        cSp+cBptr
        mov     cSp+1,      cSp+cBptr+1
        mov  cSp+2,      cSp+cBptr+2
        mov     cSp+3,      cSp+cBptr+3
        jmp     cSp+cBptr,  {0

cSp     spl     #0,         <-1151+3
        mov     197,        cAd-(197*3496)
cAd     add.ab  {0,         }0
        djn.f   -2,         <-1151
cBomb   dat     >-1,        >1

  dat   15,          10         ; A,D
qTab:dat   7,           4          ; B,E
     dat   13,          11         ; C,F
qBmb:dat   {qi*qr-10,   {1

;    -+)>] 0/1 cycles [(<+-

qGo: seq   qd+qf+qs,    qf+qs      ; 1
     jmp   qSki,        {qd+qf+qs+qi
     seq   qd+qf+7*qs,  qf+7*qs    ; B
     jmp   qFas,        {qd+qf+7*qs+qi
     seq   qd+qf+6*qs,  qf+6*qs    ; B-1
     jmp   qFas,        {qTab
     seq   qd+qf+8*qs,  qf+8*qs    ; B+1
     jmp   qFas,        }qTab
     seq   qd+qf+13*qs, qf+13*qs   ; C
     jmp   qFas,        }qFas
     seq   qd+qf+14*qs, qf+14*qs   ; A-1
     djn.a qFas,        {qFas
     seq   qd+qf+15*qs, qf+15*qs   ; A
     jmp   qFas,        {qFas

;    -+>)] 2 cycles [(<+-

     seq   qd+qf+4*qs,  qf+4*qs    ; E
     jmp   >qFas,       {qd+qf+4*qs+qi
     seq   qd+qf+3*qs,  qf+3*qs    ; E-1
     jmp   >qFas,       <qTab
     seq   qd+qf+5*qs,  qf+5*qs    ; E+1
     jmp   >qFas,       >qTab
     seq   qd+qf+9*qs,  qf+9*qs  ; D-1
     djn.b >qFas,       {qSlo
     seq   qd+qf+10*qs, qf+10*qs   ; D
     jmp   >qFas,       {qSlo
     seq   qd+qf+11*qs, qf+11*qs   ; F
     jmp   >qFas,       }qSlo
     seq   qd+qf+18*qs, qf+18*qs   ; B*E+1-B-E
     djn.f qSlo,        qTab
     seq   qd+qf+21*qs, qf+21*qs   ; B*E-B
     jmp   qSlo,        <qTab
     seq   qd+qf+24*qs, qf+24*qs   ; B*E-E
     jmp   qSlo,        {qTab
     seq   qd+qf+32*qs, qf+32*qs   ; B*E+E
     jmp   qSlo,        }qTab
     seq   qd+qf+35*qs, qf+35*qs   ; B*E+B
     jmp   qSlo,        >qTab
  seq   qd+qf+39*qs, qf+39*qs   ; C*E-C
     djn.b qSlo,        }qFas
  seq   qd+qf+52*qs, qf+52*qs   ; C*E
     jmp   qSlo,        }qFas
     seq   qd+qf+56*qs, qf+56*qs   ; A*E-E
     djn.a qSlo,        {qFas
     seq   qd+qf+60*qs, qf+60*qs   ; A*E
     jmp   qSlo,        {qFas
     seq   qd+qf+63*qs, qf+63*qs   ; B*D-B
     djn.b qSlo,        {qSlo
     seq   qd+qf+66*qs, qf+66*qs   ; B*F-F
     djn.a qSlo,        }qSlo
     seq   qd+qf+70*qs, qf+70*qs   ; B*D
     jmp   qSlo,        {qSlo
     seq   qd+qf+77*qs, qf+77*qs   ; B*F
     jmp   qSlo,        }qSlo
     sne   qd+qf+28*qs, qf+28*qs   ; B*E
     jmz   cBoot,         qd+qf+28*qs-10  ; Free Scan :-)

qSlo:mul.b qTab,        qKil
qFas:mul.ab qTab,       @qSlo
qSki:sne   >3456,       @qKil
     add   #qd,         qKil
qLoo:mov   qBmb,        @qKil
qKil:mov   qBmb,        *qs
     sub   #qi,         qKil
     djn   qLoo,        #qr
     jmp   cBoot
  end

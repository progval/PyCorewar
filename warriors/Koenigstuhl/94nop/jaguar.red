;redcode-94
;name Jaguar
;author Christian Schmidt
;strategy Q^3 -> stone/imp
;strategy self modifying imp launcher, which
;strategy changes from a-driven to b-driven imps
;assert CORESIZE==8000

     org qGo

istep   equ     2667
cBptr   equ     2975
cDecr   equ     (0-1151)
iChange equ     30


iStart  spl     1,          }qd+qf+8*qs    ;vortex launch by
        spl     1,          }qd+qf+11*qs   ;Ilmari Karonen.
        spl     #0,         }qd+qf+13*qs
        add.f   iptr,       launch
launch  spl     imp-istep-1,}cSp+cBptr-100
        djn.b   cSp+cBptr,  #iChange       ;boost the stone.
        mov.a   #50,        launch         ;change from a-driven
                                           ;to b-driven imps.
    for 36
        dat     0,          0
    rof

cBoot   spl     iStart,     }qd+qf+14*qs
        mov     cBomb,      cSp+cBptr+198
        mov     cSp,        cSp+cBptr
        mov     cSp+1,      cSp+cBptr+1
        mov     cSp+2,      cSp+cBptr+2
        mov     cSp+3,      cSp+cBptr+3
        jmp     cSp+cBptr,  {0

cSp     spl     #0,         <cDecr+3       ;Carbonite
        mov     197,        cAd-(197*3496) ;the best stone ever!!!
cAd     add.ab  {0,         }0    
        djn.f   -2,         <cDecr
cBomb   dat     >-1,        >1

iptr    dat     istep,      -17
imp2    mov.i   #istep,     *0             ;b-driven imp

     qf equ qKil
     qs equ (qd*2)
     qd equ 107
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
     jmz.f cBoot,         qd+qf+18*qs-10

qSlo:mul.ab #3,         qKil       ; C=3
qFas:mul.b qBmb,        @qSlo
qSki:sne   >3456,       @qKil
     add   #qd,         qKil
qLoo:mov   qBmb,        @qKil
qKil:mov   qBmb,        *qs
     sub   #qi,         qKil
     djn   qLoo,        #qr
     jmp   cBoot,         >10        ; A=10
qBmb:dat   {qi*qr-10,   {6         ; B=6

imp     mov.i   #1,         istep             ;a-driven imp


     end



;redcode-94
;name Safety in Numbers
;author Ken Espiritu
;strategy q^3 -> imp/paper
;strategy binary launched imp spirals
;assert 1
org qGo

p equ 4
stepa equ -3604
stepb equ -2748
bstep equ -1306
istep equ 2667

pGo     spl 1, {imp+bstep+1+2*0       ; 4 processes
        spl 1, {imp+bstep+1+2*1
        mov {top, {middle
        mov {top, {middle
        mov <last, {last
        spl first, {imp+bstep+1+2*2
        spl last, {imp+bstep+1+2*3

middle  jmp istep*1+top+p*2, {imp+bstep+1+2*4
last    jmp istep*2+top+p*2,top+p*2
first   mov <last, {last

top     spl @top+p*2, {stepa
        mov }top, >top
        mov }top, >top
second  spl @0, >stepb
        mov }second, >second
        mov.i #1, {1
imp     mov.i #bstep, istep

for 41
        dat 0,0
rof

qf equ qKil
qs equ (qd*3)
qd equ 100
qi equ 7
qr equ 11

;    -+)>] 0/1 cycles [(<+-

qGo     seq   qd+qf+qs,    qf+qs      ; 1
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

qSlo    mul.ab #3,         qKil       ; C=3
qFas    mul.b qBmb,        @qSlo
qSki    sne   }imp+bstep+1+2*5, @qKil
        add   #qd,         qKil
qLoo    mov   qBmb,        @qKil
qKil    mov   qBmb,        *qs
        sub   #qi,         qKil
        djn   qLoo,        #qr
        jmp   pGo,         >10        ; A=10
qBmb    dat   {qi*qr-10,   {6         ; B=6
        end


;redcode-94nop
;name Blowrag
;author Metcalf/Schmidt
;strategy qscan, silk and imps
;assert CORESIZE==8000

        org     qGo

pStep1  equ     2850
pStep2  equ     464
pBomb   equ     7406
bDist   equ     (top+1441)
iStep   equ     2667

top     mov     <g3,            {g3
g3      jmp     bDist+iStep,    imp+1

s1      spl     @0,             <pStep1
        mov     }s1,            >s1
s2      spl     @0,             <pStep2
        mov     }s2,            >s2
        mov.i   #1,             <1
        spl     -2,             <pBomb
imp     mov.i   #iStep,         *0

pStart  spl     1
        spl     1
        mov.i   {0,             #0

        spl     top
        mov     <g1,            {g1
g1      spl     bDist,          imp+1
g2      spl     bDist+2*iStep-7
        mov     }s1,            }g2

        for     42
        dat     0,              0
        rof

qf      equ     qKil
qs      equ     200
qd      equ     4000
qi      equ     7
qr      equ     15

qGo     seq     qd+qf+qs,       qf+qs
        jmp     qSki,           {qd+qf+qs+qi+2
        sne     qd+qf+5*qs,     qf+5*qs
        seq     qf+4*qs,        {qTab
        jmp     qFas,           }qTab
        sne     qd+qf+8*qs,     qf+8*qs
        seq     qf+7*qs,        {qTab-1
        jmp     qFas,           {qFas
        sne     qd+qf+10*qs,    qf+10*qs
        seq     qf+9*qs,        {qTab+1
        jmp     qFas,           }qFas
        seq     qd+qf+2*qs,     qf+2*qs
        jmp     qFas,           {qTab
        seq     qd+qf+6*qs,     qf+6*qs
        djn.a   qFas,           {qFas
        seq     qd+qf+3*qs,     qf+3*qs
        jmp     qFas,           {qd+qf+3*qs+qi+2
        sne     qd+qf+14*qs,    qf+14*qs
        seq     qf+13*qs,       <qTab
        jmp     qSlo,           >qTab
        sne     qd+qf+17*qs,    qf+17*qs
        seq     qf+16*qs,       <qTab-1
        jmp     qSlo,           {qSlo
        seq     qd+qf+11*qs,    qf+11*qs
        jmp     qSlo,           <qTab
        seq     qd+qf+15*qs,    qf+15*qs
        djn     qSlo,           {qSlo
        sne     qd+qf+12*qs,    qf+12*qs
        jmz.f   pStart,         qd+qf+12*qs-qi

qSlo    mov.ba  qTab,           qTab
qFas    mul.ab  qTab,           qKil
qSki    sne     <123,           @qKil
        add     #qd,            qKil
qLoo    mov     qBmb,           @qKil
qKil    mov     qBmb,           @qs
        sub     #qi,            qKil
        djn     qLoo,           #qr
        jmp     pStart,         <-4000
        dat     5408,           7217
qTab    dat     4804,           6613
qBmb    dat     5810,           {qi*qr-10
        end

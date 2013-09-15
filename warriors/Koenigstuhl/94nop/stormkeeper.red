;redcode-94nop
;name The Stormkeeper
;author Christian Schmidt
;strategy q^3 -> stone/imp
;assert 1

impoff  equ     627
impsize equ     2667

sAway   equ 3000
iAway   equ (sAway+iOff)
iOff    equ -1007

pGo    mov.i cBomb, sEnd+sAway-3+197
         spl 2
         spl 1
         mov -1, 0
         mov {sEnd, {sBoo
         mov {iEnd, {iBoo
sBoo djn sEnd+sAway, #5
iBoo jmp  iEnd+iAway, <-1000

cSp2    spl     #0,         #0
cSp     spl     #0,         <-1151+3
        mov     197,        cAd-(197*3500)
cAd     add.ab  {0,         }0    
        djn.f   -2,         <-1151
sEnd dat 0, 0
cBomb   dat     >-1,        >1

pump     spl     #1,         >prime
prime    mov.i   imp,        impoff-4
         add.f   #impsize+1, ptr
ptr      jmp     pump+impoff-(impsize+1), >-200
imp      mov.i   #impsize,   *0
iEnd   dat 0, 0

org qGo

qf     equ qKil
qs     equ (qd*2)
qd     equ 107
qi     equ 7
qr     equ 11

b for 27
     dat   0,0
  rof

qGo: seq   qd+qf+qs,    qf+qs 
     jmp   qSki,        {qd+qf+qs+qi
     seq   qd+qf+6*qs,  qf+6*qs 
     jmp   qFas,        {qd+qf+6*qs+qi
     seq   qd+qf+5*qs,  qf+5*qs
     jmp   qFas,        <qBmb
     seq   qd+qf+7*qs,  qf+7*qs
     jmp   qFas,        >qBmb
     seq   qd+qf+9*qs,  qf+9*qs
     djn   qFas,        {qFas
     seq   qd+qf+10*qs, qf+10*qs
     jmp   qFas,        {qFas
     seq   qd+qf+3*qs,  qf+3*qs
     jmp   >qFas,       {qd+qf+3*qs+qi
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
qSki:sne   >3456,       @qKil
     add   #qd,         qKil
qLoo:mov   qBmb,        @qKil
qKil:mov   qBmb,        *qs
     sub   #qi,         qKil
     djn   qLoo,        #qr
     jmp   pGo,         >10
qBmb:dat   {qi*qr-10,   {6 

end


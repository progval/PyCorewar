;redcode-94
;name Baseline Deluxe
;author Ken Espiritu
;strategy q^3 -> imp/stone
;strategy overhauled everything
;strategy needs some tuning
;assert 1
org qGo
ploc equ -502
sloc equ (bdest-spin)+214*10+3
ifirst equ (iboot-2+ploc)
iboot equ (spin+sloc-3622)
sboot equ (spin+sloc)
step equ 214

ist equ 2667


        spl #0, #0
inc     spl #step, >-step
pt      mov {step, {-step+1
        add inc, pt
sptr	djn.f @0, {pt
spin    spl #0, >prime
        sub.f #-ist-1,jump
prime   mov ploc, ploc-1
jump    djn.f ploc+ist-2, {-1822+5
imp     mov.i #-1, ist
pGo
boot    mov imp, ifirst
        mov {boot, <bdest
        mov {boot, <bdest
        mov {boot, <bdest
        mov {boot, <bdest
        mov {boot, {bdest
        mov {boot, {bdest
        mov {boot, {bdest
        mov {boot, {bdest
        mov {boot, {bdest
	spl @bdest, }spin+4720
bdest	jmp sboot, iboot
for 36
dat 0,0
rof

     qf equ qKil
     qs equ (qd*3)
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
qLoo:mov   qBmb,        @qKil
qKil:mov   qBmb,        *qs
     sub   #qi,         qKil
     djn   qLoo,        #qr
     jmp   pGo,         >10        ; A=10
qBmb:dat   {qi*qr-10,   {6         ; B=6

	end

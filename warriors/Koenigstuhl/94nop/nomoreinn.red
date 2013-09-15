;redcode-94
;name No More Innocuous
;author Leonardo H. Liporati
;strategy Independently developed Q^4 -> Paper from Innocuous by John Metcalf
;strategy HINT:
;strategy    9 address pairs decoded in one extra cycle,
;strategy    against 6 pairs of Q^3.
;assert CORESIZE==8000

     org qGo

     qf equ qKil
     qs equ 200
     qd equ 4000
     qi equ 7
     qr equ 8

for 24
   dat 0,0
rof

qBmb:dat   {qi*qr-10,   {1

;    -+)>] 0/1 cycles [(<+-

qGo  seq   qd+qf+qs,    qf+qs      ; 1
     jmp   qSki,        {qd+qf+qs+qi+2

     sne   qd+qf+5*qs,  qf+5*qs    ; B+1
     seq   qf+4*qs,     {qTab      ; B
     jmp   qFas,        }qTab

     sne   qd+qf+8*qs,  qf+8*qs    ; A
     seq   qf+7*qs,     {qTab-1    ; A-1
     jmp   qFas,        {qFas

     sne   qd+qf+10*qs, qf+10*qs   ; C
     seq   qf+9*qs,     {qTab+1    ; C-1
     jmp   qFas,        }qFas

     seq   qd+qf+2*qs,  qf+2*qs    ; B-2
     jmp   qFas,        {qTab

     seq   qd+qf+6*qs,  qf+6*qs    ; A-2
     djn.a qFas,        {qFas

     seq   qd+qf+3*qs,  qf+3*qs    ; B-1
     jmp   qFas,        {qd+qf+3*qs+qi+2

;    -+>)] 2 cycles [(<+-

     sne   qd+qf+14*qs, qf+14*qs   ; E+1
     seq   qf+13*qs,    <qTab      ; E
     jmp   qSlo,        >qTab

     sne   qd+qf+17*qs, qf+17*qs   ; D
     seq   qf+16*qs,    <qTab-1    ; D-1
     jmp   qSlo,        {qSlo

     seq   qd+qf+11*qs, qf+11*qs   ; E-2
     jmp   qSlo,        <qTab

     seq   qd+qf+15*qs, qf+15*qs   ; D-2
     djn.b qSlo,        {qSlo

     sne   qd+qf+12*qs, qf+12*qs   ; E-1
     jmz   pGo, qd+qf+12*qs-qi     ; Free Scan ;-)

qSlo  mov.ba qTab, qTab
qFas  mul.ab qTab, qKil
qSki  sne   qBmb-1, @qKil
      add   #qd,   qKil

qLoo  mov.i  qBmb,  @qKil
qKil  mov.i  qBmb,  *qs
      sub.ab #qi,   qKil
      djn    qLoo,   #qr
      jmp    pGo
                             ;  (mod 8000)
      dat   5408, 7217       ; A*qs =  8*qs ,D*qs = 17*qs
qTab  dat   4804, 6613       ; B*qs =  4*qs ,E*qs = 13*qs
      dat   5810, 1          ; C*qs = 10*qs ,F unused

; Paper cloned from Innocuous by John Metcalf
     pstep1 equ  220 ; 1700
     pstep2 equ 6172 ; 4388
     pstep3 equ 3060 ; 4924
pGo  spl   1,       {-2475
     spl   1,       {1666
pap1:spl   @0,      {pstep1
     mov   }pap1,   >pap1
     mov   }pap1,   >pap1
pap2:spl   @0,      {pstep2
     mov   }pap2,   >pap2
     mov   {pap2,   {pap3
pap3:jmp   pstep3+1,>pstep3-3
     dat   >1,      }1

for 24
   dat 0,0
rof

 	end

;redcode-94
;name Cinammon
;author John Metcalf
;strategy Mini-Q^3 -> Paper/Imps and Wimp
;assert CORESIZE==8000

     pStep1 equ 6405                    ; computer optimized against scans
     pStep2 equ 4240                    ; from HSA, Snoopy & Recycled Bits
     pStep3 equ (pStep2-2667)
     wBoot  equ (pap1+5373)             ; pocket to place wimp, distance
                                        ; particularly effective against
     org qGo                            ; Recycled Bits scan :-)

ppGo:mov   {pap1,       {bb             ; binary launch
     mov   {pap1,       {bb
bb:  spl   pap1+4000+12,{qf+25*qs

pap1:spl   @12,         >pStep1
     mov   }pap1,       >pap1
     mov   }pap1,       >pap1           ; copy
pap2:spl   @0,          >pStep2
     mov   }pap2,       >pap2           ; copy
pap3:spl   @0,          >pStep3
     mov   }pap3,       >pap3           ; copy

     mov.i #-2669,      }4000-pStep3    ;   silk-imp
     mov.i #-pStep2,    2667            ; standard-imp
     mov.i #4001,       *0              ; mirrored-imp

     for 40
     dat 0,0
     rof

wimp:jmp   #0,          #0

     qf equ qKil
     qs equ 222
     qd equ 322
     qi equ 7
     qr equ 11

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

qSlo:mul   #3,          qKil       ; C=3
qFas:mul.b qBmb,        @qSlo
qSki:sne   >qf+23*qs,   >qKil
     add   #qd,         qKil
qLoo:mov   *qKil,       <qKil
qKil:mov   qBmb,        }qs
     sub   #qi-1,       @qLoo
     djn   qLoo,        #qr

pGo: spl   }0,          >qf+29*qs  ; 6 parallel processes and 1
     spl   0,           }qf+28*qs  ; stray process for the wimp
     djn   ppGo,        #1
     mov   wimp,        {1
     djn.f wBoot+1,     #10        ; A=10
qBmb:dat   {qi*qr-10,   {6         ; B=6
     end

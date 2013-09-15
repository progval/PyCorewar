;redcode-94
;name Innocuous
;author John Metcalf
;strategy Improved Q^2 -> Harmless Paper

;assert CORESIZE==8000

     org   qGo
     pstep1 equ  220 ; 1700
     pstep2 equ 6172 ; 4388
     pstep3 equ 3060 ; 4924
pGo: spl   1,       {qf+qs*3 ; harmless paper!
     spl   1,       {qf+qs*9
pap1:spl   @0,      {pstep1
     mov   }pap1,   >pap1
     mov   }pap1,   >pap1
pap2:spl   @0,      {pstep2
     mov   }pap2,   >pap2
     mov   {pap2,   {pap3
pap3:jmp   pstep3+1,>pstep3-3
     dat   >1,      }1

     for 23
     dat 0,0
     rof

     qf equ (pGo-200)        ; qscan constants
     qd equ (-101)
     qs equ (-201)

     qi equ (11)             ; qbomber constants
     qr equ (9)

     nop   {q_B,     {q_E
qP:  add   q_D,      q_B     ; decoder
qSlo:add   @qP,      @qLoo-1
qFas:add   *qP,      @qLoo-1
qSki:sne   >qf+qs*20,@qKil
     add   qDis,     qKil

qLoo:mov   qInc,     *qKil   ; .5c dat bomber
qKil:mov   qf,       @qf+5
     add.x qInc,     @qLoo-1
     djn   qLoo,     #qr
     jmp   pGo,      {qf+qs*27


qDis:dat   qd,       qd
qInc:dat   {qi,      {-qi

q_A: dat   10*qs,    10*qs   ; Can get 23 values from this
q_B: dat   13*qs,    13*qs   ; table and can also use the
q_C: dat   6*qs,     6*qs    ; initial value of qKil.
q_D: dat   1*qs,     1*qs    ; (Traditional Q^2 comment!)
q_E: dat   4*qs,     4*qs

; [0/1 cycles]
qGo: seq   qf,       qd+qf        ; 0
     jmp   qSki,     {qd+qf-2
     seq   qf+qs*10, qd+qf+qs*10  ; A
     djn.a qFas,     {qFas
     seq   qf+qs*13, qd+qf+qs*13  ; B
     jmp   qFas,     {qFas
     seq   qf+qs*6,  qd+qf+qs*6   ; C
     jmp   qFas,     {qP
     seq   qf+qs,    qd+qf+qs     ; D
     jmp   qFas,     {qd+qf+qs-2
     seq   qf+qs*4,  qd+qf+qs*4   ; E
     jmp   qFas,     }qP

; [2 cycles]
     seq   qf+qs*14, qd+qf+qs*14  ; DB
     jmp   qSlo,     {qd+qf+qs*4-2
     seq   qf+qs*19, qd+qf+qs*19  ; CB
     jmp   qSlo,     {qP
     seq   qf+qs*17, qd+qf+qs*17  ; EB
     jmp   qSlo,     }qP
     seq   qf+qs*11, qd+qf+qs*11  ; DA
     jmp   qSlo,     <qP
     seq   qf+qs*7,  qd+qf+qs*7   ; DC
     jmp   qSlo,     >qP
     seq   qf+qs*26, qd+qf+qs*26  ; BB
     jmp   qSlo,     {qFas
     seq   qf+qs*5,  qd+qf+qs*5   ; DE
     jmp   qSlo,     {qSlo
     seq   qf+qs*16, qd+qf+qs*16  ; CA
     djn.f qSlo,     qP
     seq   qf+qs*23, qd+qf+qs*23  ; BA
     djn.a qSlo,     {qFas
     seq   qf+qs*2,  qd+qf+qs*2   ; DD
     djn.b qSlo,     {qSlo

; [3 cycles]
     seq   qf+qs*15, qd+qf+qs*15  ; DDB
     jmp   qP,       {qd+qf+qs*4-2
     seq   qf+qs*12, qd+qf+qs*12  ; DDA
     jmp   qP,       <qP
     seq   qf+qs*8,  qd+qf+qs*8   ; DDC
     jmp   qP,       >qP
     seq   qf+qs*25, qd+qf+qs*25  ; CCB
     jmp   qP,       {qP
     seq   qf+qs*21, qd+qf+qs*21  ; EEB
     jmp   qP,       }qP
     seq   qf+qs*28, qd+qf+qs*28  ; DDBB
     jmp   qP,       {qFas
     seq   qf+qs*24, qd+qf+qs*24  ; DAB
     djn.a qP,       {qFas
     seq   qf+qs*22, qd+qf+qs*22  ; CCA
     djn.f qP,       qP
     jmp   pGo,      {qf+qs*27
     end


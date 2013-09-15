;redcode
;name Vala
;author John Metcalf
;strategy q^2 -> paper/stone
;assert CORESIZE==8000
        qf equ (qgo+1*qs)
        qd equ 100
        qs equ (2*qd)
        qi equ 7                             
        qr equ 7
qbomb   dat <qi/2-qi*qr,<qi*qr-qi/2
        dat #12*qs      ;a
qp1     dat #5*qs       ;b
qp2     dat #2*qs       ;c
qp3  ;  dat #1*qs       ;d

qgo     cmp qd+qf,      qf ;d
        jmp qskip,      <qf+4

        cmp qd+qf+qs*5, qf+qs*5
        jmp qfast,      <qf+qs*5+4
        cmp qd+qf+qs*12,qf+qs*12
q1      djn qfast,      #qp1

        cmp qd+qf+qs*7, qf+qs*7
        jmp qslow,      <qf+qs*7+4
        cmp qd+qf+qs*14,qf+qs*14
        jmp qslow,      <q1
        cmp qd+qf+qs*10,qf+qs*10
q2      djn qslow,      #qp2
        cmp qd+qf+qs*2, qf+qs*2
        jmp qslow,      <qfast

        cmp qd+qf+qs*8, qf+qs*8
        jmp qslower,    <qf+qs*8+4
        cmp qd+qf+qs*15,qf+qs*15
        jmp qslower,    <q1
        cmp qd+qf+qs*11,qf+qs*11
        jmp qslower,    <q2
        cmp qd+qf+qs*9, qf+qs*9
q3      djn qslower,    #qp3
        cmp qd+qf+qs*3, qf+qs*3
        jmp <qfast,     <qf+qs*3+4
        cmp qd+qf+qs*6, qf+qs*6
        jmp <qfast,     <q2
        cmp qd+qf+qs*4, qf+qs*4
        jmp <qfast,     <q3
        cmp qd+qf+qs*16,qf+qs*16
        slt <q3,        <q1

        jmz pgo,        qd+qf+qs*8+10

qslower add @q3,        @q2
qslow   add @q2,        qkil
qfast   add @q1,        @qslow

qskip   jmn qloop,      @qkil

; qskip cmp <734,       @qkil       ; would these two lines be
;       jmp qloop,      <qf+qs*6+4  ; better than the one above?

        add #qd,        qkil
qloop   mov qbomb,      @qkil
qkil    mov qbomb,      <qf
        sub #qi,        @qloop
        djn qloop,      #qr+2

        pdist equ (papto+1001)
        pstep equ 6300  ; 7324  ; 3865
        sdist equ 1285  ; 948   ; 1283
        sstep equ 24    ; 168   ; 24

pgo     spl 1,          <-1112
        spl 1,          <-1222
        mov <stofr,     <stoto
stoto   spl @0,         pdist+sdist
        spl @stoto,     <-1332
        spl 1,          <-1442
        mov <papfr,     <papto
papto   jmp @0,         pdist

papfr   mov #8,         8
        mov <papfr,     <pptr
pptr    spl @0,         pstep
        mov 3,          <pptr
        mov 3,          <pptr
        jmz papfr,      papfr
        mov 0,          <1
        dat <2667,      <5334

ston    spl 0,          <3-sstep
sloop   sub 2,          1
        mov <40,        0
        djn sloop,      <-sstep
stofr   end qgo


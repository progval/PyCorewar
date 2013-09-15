;redcode-94nop verbose
;name Lux Aeterna
;author Roy/Nenad
;assert CORESIZE==8000
;strategy scanner with modified zooom trick

pBoot   equ     4618

zero    equ     qbomb

qtab3   equ     qbomb
qbomb   dat     >qoff           , >qc2

bPtr    dat     b+1             , b+pBoot+1+8
bPtr2   dat     gate+1          , }qb1
qtab2   dat     gate+1+pBoot    , }qb2
        dat     0               , }qb3

wGo     mov.i   {bPtr           , <bPtr
        mov.i   {bPtr           , <bPtr
        mov.i   {bPtr2          , {qtab2

  mov.i   {bPtr           , <bPtr
  mov.i   {bPtr2          , {qtab2
  mov.i   {bPtr2          , {qtab2
  mov.i   {bPtr2          , {qtab2
  djn.b -4 , #2

        djn.f   scan+pBoot      , <7413

 for 3
 dat 0, 0
 rof

        dat     zero - 1,       qa1
qtab1   dat     zero - 1,       qa2

for     15
        dat     0               , 0
rof

        step    equ 6587
        ini     equ ((-(1100*step))-1)
        span    equ 8

top     mov.ab  scan            , #loop
shoot   mov.i   clear+8         , >top
incr    sub.f   clear+8         , scan
scan    seq     }ini            , }ini+span
att     djn.f   top             , @top
loop    djn.f   incr            , <2437
gate    djn.f   clear+8         , >2539

;8 dats

clear   spl     #-step          , >-step
        mov.i   b               , >gate-8
        djn.f   -1              , >gate-8
b       dat     <2667           , {16

for     18
        dat     0               , 0
rof

qc2     equ ((1+(qtab3-qptr)*qy)%CORESIZE)
qb1     equ ((1+(qtab2-1-qptr)*qy)%CORESIZE)
qb2     equ ((1+(qtab2-qptr)*qy)%CORESIZE)
qb3     equ ((1+(qtab2+1-qptr)*qy)%CORESIZE)
qa1     equ ((1+(qtab1-1-qptr)*qy)%CORESIZE)
qa2     equ ((1+(qtab1-qptr)*qy)%CORESIZE)
qz      equ 2108 ;3592;2108
qy      equ 243  ;3511;243         ;qy*(qz-1)=1

;q0 mutation
qgo

       sne     qptr+qz*qa1     , qptr+qz*qa1+qb2
       seq     <(qtab1-1)      , qptr+qz*(qa1-1)+qb2
       djn.a   q0              , {q0

       sne     qptr+qz*qc2     , qptr+qz*qc2+qb2
       seq     <qtab3          , qptr+qz*(qc2-1)+qb2
       jmp     q0              , }q0

       sne     qptr+qz*qa2     , qptr+qz*qa2+qb2
       seq     <qtab1          , qptr+qz*(qa2-1)+qb2
       jmp     q0              , {q0
                                       ;q1 mutation
       sne     qptr+qz*qb3     , qptr+qz*qb3+qb3
       seq     <(qtab2+1)      , qptr+qz*(qb3-1)+(qb3-1)
       jmp     q0              , }q1

       sne     qptr+qz*qb1     , qptr+qz*qb1+qb1
       seq     <(qtab2-1)      , qptr+qz*(qb1-1)+(qb1-1)
       jmp     q0              , {q1

       sne     qptr+qz*qb2     , qptr+qz*qb2+qb2
       seq     <qtab2          , qptr+qz*(qb2-1)+(qb2-1)
       jmp     q0              , 0

                                       ;qz mutation
       seq     >qptr           , qptr+qz+(qb2-1)
       jmp     q2              , <qptr
                                       ;q0 mutation
       seq     qptr+(qz+1)*(qc2-1),qptr+(qz+1)*(qc2-1)+(qb2-1)
       jmp     q0              , }q0

       seq     qptr+(qz+1)*(qa2-1),qptr+(qz+1)*(qa2-1)+(qb2-1)
       jmp     q0              , {q0

       seq     qptr+(qz+1)*(qa1-1),qptr+(qz+1)*(qa1-1)+(qb2-1)
       djn.a   q0              , {q0

       jmz.f   wGo             , qptr+(qz+1)*(qb2-1)+(qb2-1)

qoff    equ     -87
qstep   equ     -7
qtime   equ     19

q0      mul.b   *2              , qptr
q2      sne     {qtab1          , @qptr
q1      add.b   qtab2           , qptr
        mov     qtab3           , @qptr
qptr    mov     qbomb           , }qz
        sub     #qstep          , qptr
        djn     -3              , #qtime
        jmp     wGo             , <3623
end qgo


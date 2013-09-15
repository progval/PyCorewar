;redcode-94nop
;name  Bite the Bullet
;author Christian Schmidt
;strategy q^4.5, stone/imp
;strategy it uses a quite strange stone
;assert 1

;------------ Qscan Constant ---------------

zero    equ     qbomb
qtab3   equ     qbomb
qz      equ     2108
qy      equ     243

qc2 equ ((1 + (qtab3-qptr)*qy) % CORESIZE)
qb1 equ ((1 + (qtab2-1-qptr)*qy) % CORESIZE)
qb2 equ ((1 + (qtab2-qptr)*qy) % CORESIZE)
qb3 equ ((1 + (qtab2+1-qptr)*qy) % CORESIZE)
qa1 equ ((1 + (qtab1-1-qptr)*qy) % CORESIZE)
qa2 equ ((1 + (qtab1-qptr)*qy) % CORESIZE)

qoff    equ    -88
qstep   equ    -7
qtime   equ    20

;-------Constants for optimization----------

boot    equ     zero+7060 ; boot distance
bdista  equ     7         ; distance to anti-imp bomb
bdistb  equ     10        ; distance to standard bomb
ldist   equ     7876      ; distance to imp launcher
idist   equ     4897      ; distance to imp
istep   equ     1143

hop     equ     13
step    equ     119
time    equ     1478

;-------------------------------------------

        dat     0,              0
qbomb   dat     >qoff,          >qc2

;------ 45 instructions --------------------

pGo     mov     bomba,        boot+bdista
        mov     bombb,        boot+bdistb
        mov     imp,          boot+idist
        spl     2
        spl     1
        spl     1
        mov     <stone,       {sboot
        mov     <iboot,       {iboot
sboot   djn     boot+6,       #1
iboot   jmp     boot+ldist+3, iGo+6

bombb   dat     <1,           hop
bomba   dat     <5334,        <2667

for     7
        dat     0               , 0
rof

imp     mov.i   #istep,       *0
iGo     spl     1
        spl     1
        spl     1
launch  spl     #istep,       <3104
        add.f   launch,       iptr
iptr    djn.f   launch+idist-ldist-istep*8, <3633

for     7
        dat     0               , 0
rof

stone   spl     #0,           6
        spl     #0,           0
loop    mov     stone+bdista, >hit-(hop+time*step)
hit     mov     stone+bdistb, @loop
        add     #step,        @hit
        djn.f   loop,         <-1150

for     6
        dat     0               , 0
rof

;-------------------------------------------

        dat     0,              <qb1
qtab2   dat     0,              <qb2
        dat     0,              <qb3
        dat     0,              0
        dat     0,              0
        dat     0,              0
        dat     0,              0
        dat     zero-1,         qa1
qtab1   dat     zero-1,         qa2
        dat     0,              0
        dat     0,              0
        dat     0,              0
        dat     0,              0
        dat     0,              0

qgo sne qptr+qz*qc2, qptr+qz*qc2+qb2
    seq <qtab3,      qptr+qz*(qc2-1)+qb2
    jmp q0,          }q0
    sne qptr+qz*qa2, qptr + qz*qa2 + qb2
    seq <qtab1,      qptr+qz*(qa2-1)+qb2
    jmp q0,          {q0
    sne qptr+qz*qa1, qptr+qz*qa1+qb2
    seq <(qtab1-1),  qptr+qz*(qa1-1)+qb2
    djn.a q0,        {q0
    sne qptr+qz*qb3, qptr+qz*qb3+qb3
    seq <(qtab2+1),  qptr+qz*(qb3-1)+(qb3-1)
    jmp q0,          }q1
    sne qptr+qz*qb1, qptr+qz*qb1+qb1
    seq <(qtab2-1),  qptr+qz*(qb1-1)+(qb1-1)
    jmp q0,          {q1
    sne qptr+qz*qb2, qptr+qz*qb2+qb2
    seq <qtab2,      qptr+qz*(qb2-1)+(qb2-1)
    jmp q0,          }4443              ;extra attack
    seq >qptr,       qptr+qz+(qb2-1)
    jmp q2,          <qptr
seq qptr+(qz+1)*(qc2-1),qptr+(qz+1)*(qc2-1)+(qb2-1)
    jmp q0,          }q0
seq qptr+(qz+1)*(qa2-1),qptr+(qz+1)*(qa2-1)+(qb2-1)
    jmp q0,          {q0
seq qptr+(qz+1)*(qa1-1),qptr+(qz+1)*(qa1-1)+(qb2-1)
    djn.a q0,        {q0
    jmz.f pGo,       qptr+(qz+1)*(qb2-1)+(qb2-1)

q0      mul.b   *2,             qptr
q2      sne     {qtab1,         @qptr
q1      add.b   qtab2,          qptr
        mov     qtab3,          @qptr
qptr    mov     qbomb,          }qz
        sub     #qstep,         qptr
        djn     -3,             #qtime
        jmp     pGo,            }3256   ;extra attack
        dat     0,              0
        dat     0,              0
        dat     0,              0
        dat     0,              0

end qgo


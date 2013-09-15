;redcode-lp
;name Eve 15
;strategy No humans were used in the creation
;strategy of this strategy
;author bvowk + Fizmo
;assert 1

;------>qscan constants

zero    equ     qbomb
qtab3   equ     qbomb
qc2     equ     ((1+(qtab3-qptr)*qy) % CORESIZE)
qb1     equ     ((1+(qtab2-1-qptr)*qy) % CORESIZE)
qb2     equ     ((1+(qtab2-qptr)*qy) % CORESIZE)
qb3     equ     ((1+(qtab2+1-qptr)*qy) % CORESIZE)
qa1     equ     ((1+(qtab1-1-qptr)*qy) % CORESIZE)
qa2     equ     ((1+(qtab1-qptr)*qy) % CORESIZE)
qz      equ     2108
qy      equ     243

;------>qbomb constants

qoff    equ     -87
qstep   equ     -7
qtime   equ     14

;------>eve 15 constants

iAwa    equ     4174
train   equ     7903

;------>eve 15 code

pGo     mov.i   imp,            *2
        spl     imp
        spl     iAwa
        djn.a   #0,             <train
        djn.f   #0,             <train
        jmp.ba  #0,             <train
imp     mov.i   #-1,            1

        for     51
        dat     0,              0
        rof

;------>qscan code

qbomb   dat     >qoff,          >qc2
        dat     0,              0

        dat     0,              <qb1
qtab2   dat     0,              <qb2
        dat     0,              <qb3

        for     16
        dat     0,              0
        rof

        dat     zero - 1,       qa1
qtab1   dat     zero - 1,       qa2

        for     42
        dat     0,              0
        rof

qgo sne qptr+qz*qc2, qptr+qz*qc2+qb2
    seq <qtab3,      qptr+qz*(qc2-1)+qb2
    jmp q0,          }q0

    sne qptr+qz*qa2, qptr+qz*qa2+qb2
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
    jmp q0

    seq >qptr,       qptr+qz+(qb2-1)
    jmp q2,          <qptr

seq qptr+(qz+1)*(qc2-1),qptr+(qz+1)*(qc2-1)+(qb2-1)
jmp q0, }q0

seq qptr+(qz+1)*(qa2-1),qptr+(qz+1)*(qa2-1)+(qb2-1)
jmp q0, {q0

seq qptr+(qz+1)*(qa1-1),qptr+(qz+1)*(qa1-1)+(qb2-1)
djn.a q0, {q0

    jmz.f pGo,       qptr+(qz+1)*(qb2-1)+(qb2-1)

;------>qbomb code

q0      mul.b   *2,             qptr
q2      sne     {qtab1,         @qptr
q1      add.b   qtab2,          qptr
        mov     qtab3,          @qptr
qptr    mov     qbomb,          }qz
        sub     #qstep,         qptr
        djn     -3,             #qtime
        jmp     pGo

        end qgo


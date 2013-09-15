;redcode-lp
;name Revenge of the Silklander
;author Christian Schmidt
;strategy qscanner, self-replicating stone, paper
;assert 1

;------>paper

rSize   equ    (rBase-rPtr)
rStep   equ    4933
rStep2  equ    581
rAdd    equ    7000

rPtr    dat     0,              0
rNew    add.ab  #rAdd,          rBase
rFrst   mov.i   rBase,          rPtr
rLoop   mov.i   *rPtr,          <rPtr
        mov.i   rBase,          }rStep2
        djn.a   rLoop,          rPtr
        spl     rNew,           <3804
        jmp     @rPtr,          <6214
rBase   dat     <rSize,         <rSize+rStep

    for 25
        dat     0,              0
    rof

;------>self-replicating stone

pStep   equ     4878
sStep   equ     1998
sOff    equ     5629

pStrt   mov.ab  #7,             #7
pCopy   mov.i   <pStrt,         <pPtr
        jmn.b   pCopy,          pStrt
pPtr    spl.a   @pPtr,          pStep
pStn    mov     {sOff,          1-sStep
        sub.x   #sStep,         -1
        djn.f   @0,             {-2

for 29
        dat     0,              0
rof

;------>Q^4.5 scanner

zero    equ     qbomb
qtab3   equ     qbomb

qbomb   dat     >qoff,          >qc2
        dat     0,              0

paper   spl     pStrt,          <qb1
qtab2   jmp     rFrst,          <qb2
        spl     1,              <qb3

        for     16
        dat     0,              0
        rof

        dat     zero - 1,       qa1
qtab1   dat     zero - 1,       qa2

for 42
 dat 0, 0
 rof

qc2 equ ((1 + (qtab3-qptr)*qy) % CORESIZE)
qb1 equ ((1 + (qtab2-1-qptr)*qy) % CORESIZE)
qb2 equ ((1 + (qtab2-qptr)*qy) % CORESIZE)
qb3 equ ((1 + (qtab2+1-qptr)*qy) % CORESIZE)
qa1 equ ((1 + (qtab1-1-qptr)*qy) % CORESIZE)
qa2 equ ((1 + (qtab1-qptr)*qy) % CORESIZE)
qz equ 2108
qy equ 243
qgo sne qptr + qz*qc2, qptr + qz*qc2 + qb2
 seq <qtab3, qptr + qz*(qc2-1) + qb2
 jmp q0, }q0
 sne qptr + qz*qa2, qptr + qz*qa2 + qb2
 seq <qtab1, qptr + qz*(qa2-1) + qb2
 jmp q0, {q0
sne qptr + qz*qa1, qptr + qz*qa1 + qb2
 seq <(qtab1-1), qptr + qz*(qa1-1) + qb2
 djn.a q0, {q0
 sne qptr + qz*qb3, qptr + qz*qb3 + qb3
 seq <(qtab2+1), qptr + qz*(qb3-1) + (qb3-1)
 jmp q0, }q1
sne qptr + qz*qb1, qptr + qz*qb1 + qb1
 seq <(qtab2-1), qptr + qz*(qb1-1) + (qb1-1)
 jmp q0, {q1
 sne qptr + qz*qb2, qptr + qz*qb2 + qb2
 seq <qtab2, qptr + qz*(qb2-1) + (qb2-1)
 jmp q0
 seq >qptr, qptr + qz + (qb2-1)
 jmp q2, <qptr
seq qptr+(qz+1)*(qc2-1),qptr+(qz+1)*(qc2-1)+(qb2-1)
 jmp q0, }q0
seq qptr+(qz+1)*(qa2-1),qptr+(qz+1)*(qa2-1)+(qb2-1)
 jmp q0, {q0
seq qptr+(qz+1)*(qa1-1),qptr+(qz+1)*(qa1-1)+(qb2-1)
 djn.a q0, {q0
 jmz.f paper, qptr + (qz+1)*(qb2-1) + (qb2-1)
qoff equ -87
qstep equ -7
qtime equ 14
q0 mul.b *2, qptr
q2 sne {qtab1, @qptr
q1 add.b qtab2, qptr
 mov qtab3, @qptr
qptr mov qbomb, }qz
 sub #qstep, qptr
 djn -3, #qtime
 jmp paper
end qgo


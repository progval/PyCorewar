;redcode-94nop
;name Myth
;author Christian Schmidt
;strategy coreclear
;assert 1
;optimax clr

bAway   equ     5977 
b1Off   equ     500 
b2Off   equ     4045
b2Trn   equ     5-b2Off

zero    equ     qbomb
qtab3   equ     qbomb

qbomb   dat     >qoff,          >qc2
bPtr1   dat     gate2+1,        gate2+bAway

bPtr2   dat     bomb2+2,        <qb1
qtab2   dat     bomb2+1+bAway,  <qb2
bPtr3   dat     cend+1,         <qb3

gate1   dat     bomb1,       b1Off
gate2   dat     b2Trn,       b2Off

pGo     spl     1,           cend+bAway
        mov.i   {bPtr1,      <bPtr1
        mov.i   {bPtr2,      {qtab2
boot2   mov     {bPtr3,      <pGo
        mov     {bPtr3,      <pGo
        djn     @pGo,        #1
        mov.i   0,           -1

        for     7
        dat     0,              0
        rof

        dat     zero - 1,       qa1
qtab1   dat     zero - 1,       qa2

bomb1   spl     #bomb2-gate1, 45  
        mov     *gate1,      >gate1 
        mov     *bomb2,      >gate2 
cend    djn.f   -1,          {gate2 

        for 18
        dat     0,           0
        rof

bomb2   dat     #1,          45  
        spl     #-40,        45 

        for     18
        dat     0,              0
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

    jmz.f pGo, qptr + (qz+1)*(qb2-1) + (qb2-1)

qoff  equ -87
qstep equ -7
qtime equ 14

q0 mul.b *2, qptr
q2 sne {qtab1, @qptr
q1 add.b qtab2, qptr
 mov qtab3, @qptr
qptr mov qbomb, }qz
 sub #qstep, qptr
 djn -3, #qtime
 jmp pGo

end qgo


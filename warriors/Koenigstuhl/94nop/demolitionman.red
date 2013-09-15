;redcode-94nop
;name Demolition Man
;author Christian Schmidt
;assert CORESIZE == 8000
;strategy extended Q^4, ultra heavy stun bomber
;strategy containing 18!!! instructions

dOff    equ     4524
step    equ     184
stepb   equ     (step*2)
stepc   equ     (step*3)
cOff    equ     447
gatex   equ     (wipe-4)

zero    equ     qbomb
qtab3   equ     qbomb

qbomb   dat     >qoff,          >qc2
gate    dat    -cOff,           cOff*2

bBoo    dat     bomb2+1,        <qb1
qtab2   dat     gate+dOff+43,   <qb2
pBoo    dat     inc+1,          <qb3

loop    mov.i   12,             @targ
        mov.i   10,             <targ
        mov.i   -7,             *targ
targ    mov.i   step,           @stepc+1
        add.f   -8,             targ
        djn.b   loop,           #333
        jmp     -32

        dat     <5334,          <2667
        dat     -1,             12
wipe    spl     #3891,          20
        mov     wipe,           >gatex
        mov     *-1,            >gatex
        djn.a   -2,             gatex
cEnd    djn.a   -3,             *-1

ptr     jmp     step,           #2
inc     dat     #stepc,         #stepc+1

        dat     zero-1,         qa1
qtab1   dat     zero-1,         qa2

bomb1   spl     #2,             #-step
bomb2   mov.i   -1,             }-1

pboot
pBoo2   spl     sGo,            gate+dOff+27
        mov.i   gate,           gate+dOff
        mov.i   {bBoo,          {qtab2 
        mov.i   {bBoo,          {qtab2
        mov.i   {pBoo,          <pBoo2
        mov.i   {pBoo,          <pBoo2
cGo     mov.i   <cBoo,          {cBoo
        mov.i   <cBoo,          {cBoo
        mov.i   <cBoo,          {cBoo
        djn     -2,             #3
cBoo    dat     #gate+dOff+9,    #cEnd+1

        for     10
        dat     0,              0
        rof

sGo     mov.i   <dBoo,          {dBoo
        mov.i   <dBoo,          {dBoo
        mov.i   <dBoo,          {dBoo
        djn     -2,             #3
dBoo    jmp     gate+dOff+37, loop+7

        for     14
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

    jmz.f pboot, qptr + (qz+1)*(qb2-1) + (qb2-1)

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
 jmp pboot

end qgo


;redcode-94nop
;name The Utterer
;author Christian Schmidt
;strategy not sure how to call the strategy
;strategy Q^4.5 -> spreader
;assert CORESIZE==8000
;optimax sai

sBoo    equ     604
iBoo    equ     1780
sDst    equ     1686
iDst    equ     5030
iBmb    equ     4985
sStep   equ     2579
iStep   equ     2667
sGap1   equ     1

zero    equ     qbomb
qtab3   equ     qbomb

qbomb   dat     >qoff,          >qc2

dDst    dat     #sBoo,          #iBoo

        dat     0,              <qb1
pGo
qtab2   spl     1,              <qb2
        spl     1,              <qb3

sCpy    mov.i   <sSrc,          {dAwa
sAwa    spl     *dAwa,          >sSrc
iCpy    mov.i   <iSrc,          <dAwa
iAwa    spl     @dAwa,          >iSrc
        add.f   dDst,           dAwa
        djn.f   sCpy,           <2518

        for     sGap1
        dat     0,              0
        rof

dAwa    dat     #sDst,          #iDst

        for     9-sGap1
        dat     0,              0
        rof

        dat     zero-1,         qa1
qtab1   dat     zero-1,         qa2

        for     14
        dat     0,              0
        rof

        spl     #sStep,         >-sStep
        mov     {sStep,         {-sStep+1
        add     -2,             -1
pEnd    djn.f   @0,             {-2
sSrc    dat     0,              0

iStart  spl     #iStep,         <iBmb
        add.f   iStart,         launch
launch  djn.f   imp-iStep-1,    <6655
imp     mov.i   #iStep,         *0
iSrc    dat     0,              0

        for     18
        dat     0,              0
        rof

qc2 equ ((1 + (qtab3-qptr)*qy) % CORESIZE)
qb1 equ ((1 + (qtab2-1-qptr)*qy) % CORESIZE)
qb2 equ ((1 + (qtab2-qptr)*qy) % CORESIZE)
qb3 equ ((1 + (qtab2+1-qptr)*qy) % CORESIZE)
qa1 equ ((1 + (qtab1-1-qptr)*qy) % CORESIZE)
qa2 equ ((1 + (qtab1-qptr)*qy) % CORESIZE)
qz  equ 2108
qy  equ 243

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
 jmp pGo
end qgo

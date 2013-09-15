;redcode-94nop
;name S.D.N.
;author Christian Schmidt
;strategy "Satellite Defending Network"
;strategy a revolutionary strategical concept
;strategy which is much faster and less visible
;strategy I am still in progress to discover
;strategy this new and interesting field of
;strategy 'satellite using' warriors
;strategy including wipe check of the satellites
;strategy optimized test warrior
;assert 1

pStep1  equ    3161
pStep2  equ    2183

sStep1  equ    1171
sStep2  equ    826
sStep3  equ    6311

pBoo1   equ    5454
pBoo2   equ    4751

istep   equ    2667

zero    equ qbomb
qtab3   equ qbomb
pGo     equ qtab2

qbomb   dat     >qoff,          >qc2
        dat     0,              0
        dat     1,              <qb1
qtab2   spl     1,              <qb2
        spl     1,              <qb3

        mov     <pSt,           {pSt
pSt     spl     pEnd+pBoo1+2,   cs+1
        mov     <iSt,           {iSt
iSt     jmp     imp+pBoo2+2,    csa+1

dat 0, 0

c0      spl     @0,             pStep1
        mov     }-1,            >-1
        mov     <1,             {1
cs      jmz.a   pStep1-pBoo1,   -pBoo1

c0a     spl     @0,             pStep2
        mov     }-1,            >-1
        mov     <1,             {1
csa     jmz.a   pStep2-pBoo2,   -pBoo2

dat 0, 0
dat 0, 0
dat 0, 0

dat zero - 1, qa1
qtab1 dat zero - 1, qa2

for 14
 dat 0, 0
 rof

iStart  spl    #0,              <663
        add.x  imp,             1
        djn.f  imp-(istep*4),   <4530
imp     mov.i  #337,     istep

for 13
 dat 0, 0
 rof

stn     spl     #0,             <sStep3
        mov     {sStep1,        {sStep2
        add.f   {0,             }0
pEnd    djn.f   @0,             {-2

for 7
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


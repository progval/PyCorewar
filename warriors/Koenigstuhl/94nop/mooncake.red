;redcode-94nop
;name Mooncake
;author Christian Schmidt
;strategy qscan, stone, paper/imps
;assert CORESIZE==8000
;optimax pws

sOff    equ     959
pStep1  equ     4683
bStep   equ     1941
pAwa    equ     5600
impsize equ     2667

step    equ     2777
time    equ     1425
hop     equ     31
bOff    equ     5
         
zero    equ     qbomb
qtab3   equ     qbomb

qbomb   dat     >qoff,          >qc2

dat 0,0

pGo   spl   2,    <qb1
qtab2 spl   1,    <qb2
      spl   1,    <qb3

        mov.i   {pap1   , {pBo
pBo     spl     imp+pAwa

pap1    spl     @imp+1  , >pStep1
        mov     }-1     , >-1
        spl     @0      , <impsize+1
        mov     }-1     , >-1
        mov.i   #1      , {1
imp     mov.i   #bStep  , impsize

sSpl    spl     #0      , #0
ptr     mov     bomb    , }-(step*time)+1
        mov     bomb    , @ptr
a       add     #step   , @-1
sLoo    djn.f   ptr     , {-1500


for 3
dat 0,0
rof

        dat     zero - 1,       qa1
qtab1   dat     zero - 1,       qa2
bomb    dat     >hop    , >1

for 15
 dat 0, 0
 rof

bBoot   mov     sSpl    , sOff-6-CURLINE
        mov     bomb    , sOff+5-CURLINE
        spl     2       
qTab1   spl     2       
sDst    spl     1       , sOff-CURLINE
        mov     <sSrc   , <sDst
        djn     @bBoot  , #5
sSrc    jmp     pGo     , sLoo+1

for 18
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
 jmz.f bBoot, qptr + (qz+1)*(qb2-1) + (qb2-1)
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
 jmp bBoot
end qgo
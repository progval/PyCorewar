;redcode-94nop
;name 2b||!2b
;author Sascha Zapf
;strategy Q4.5 -> Paper/Stone
;assert CORESIZE==8000

;optimax 1234
;optimax work 2binkr
;optimax suite fsh94nop0.2
;optimax rounds 1 200 200 200

;optimax phase2 fsh94nop0.2/sbi/sovain.red
;optimax phase2 140
;optimax phase2 0%

;optimax phase3 152
;optimax phase3 0%
;optimax phase3 top15
;optimax phase3 sbi:cds

;optimax phase4 100%
;optimax phase4 top15

adec EQU 10
bdec EQU 8
cdec EQU 5

sOff    equ     zero + 2220;2203;761;353;4705
pOff    equ     zero + 3360;1050;438;1869;7431

zero    equ     qbomb
qtab3   equ     qbomb

qbomb   dat     >qoff,          >qc2
sBoot   mov     pAmmo,          sOff

        spl     2,              <qb1
qtab2   spl     2,              <qb2
        spl     1,              <qb3

        mov     {sBoot,         <sBoot
sGo     spl     1,              <5596;2483
        spl     @sBoot,         cBomb+1
        mov     <-1,            {1
        djn.f   pOff,           <7177;1850;7730;3664

                for adec
        dat 0,0
        rof

cDst1 equ    4488;2359
cDst2 equ    439;3201
cDst3 equ    5593;2899
cHit1 equ    508;1529
cHit2 equ    6349;7273
cHit3 equ    7477;4211

      spl    @0         , >cDst1
      mov    }-1        , >-1
cSlk2 spl    @0         , >cDst2
      mov    }-1        , >-1
      mov    cBomb      , >cHit1
      mov    cBomb      , >cHit2
      mov    cBomb      , >cHit3
      mov    {cSlk2     , <1
      djn    @0         , <cDst3
cBomb dat    <2667      , <5334

                for bdec
        dat 0,0
        rof

        dat     zero - 1,       qa1
qtab1   dat     zero - 1,       qa2

incra EQU 2862
incrb EQU 4655

                for cdec
        dat 0,0
        rof

pStone  spl #2 * incra, {2 * incra
        mov pAmmo, *2
        add.f pStone, 1
        mov incrb, incrb + incra
pSrcS   djn.f -3,<-3477;jmp -3, pStone
pAmmo   dat }1, >1


for 37-adec-bdec-cdec
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
 jmz.f sBoot, qptr + (qz+1)*(qb2-1) + (qb2-1)
qoff equ -87
qstep equ -6;7
qtime equ 19;14
q0 mul.b *2, qptr
q2 sne {qtab1, @qptr
q1 add.b qtab2, qptr
 mov qtab3, @qptr
qptr mov qbomb, }qz
 sub #qstep, qptr
 djn -3, #qtime
 jmp sBoot,<3099
end qgo


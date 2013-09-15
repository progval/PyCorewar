;redcode-94nop
;name Tyger of Pan Tang
;author Christian Schmidt
;strategy airbag stone with spl-wiper
;strategy optimaxed against paper and paper/imps
;assert CORESIZE==8000
;url http://www.corewar.info
;optimax stn

bStep  equ   5727
bDrop  equ   4853

bDist  equ   1856
bcOff  equ   7382
bgOff  equ   17

bRun   equ   (bHit-bInc*bDrop)
bGate  equ   (bClr-bgOff)
bSpl   equ   (bHit-2*bInc)+1
bJmp   equ   (bHit-2*bInc)-1
bInc   equ   3*bStep

zero    equ qbomb
qtab3   equ qbomb

qbomb   dat     >qoff,          >qc2
        dat     0,              0

        dat     0,              <qb1
qtab2   dat     0,              <qb2
        dat     0,              <qb3

cGate   dat    4009,     18
cJmp    jmp    4009,     18
        dat    #bInc,    <bInc+1
        dat    0,        0
        jmp    -400,     <2667
cGo     spl    #4600,    18
        mov    @cSwtch,  >cGate
        mov    cJmp,   }cGate
cSwtch  djn    -2,  {cGo


       jmp   bStep          , {1
       mov   @0             , }-1
       spl   #2             , -bStep


        for     4
        dat     0,              0
        rof

dat zero - 1, qa1
qtab1 dat zero - 1, qa2

bStart mov.i {0             , #0
bLoop  mov   bSpl           , <bPtr
       mov   bJmp           , *bPtr
bPtr   mov   bRun-bStep     , @bRun+bStep+1
bHit   add   bEvac-bcOff-3  , bPtr
       mov   >bJmp          , @bPtr
       jmz.a bLoop          , <bJmp
bEvac  jmp   -bcOff         , <1-bcOff-bgOff

for 6
dat 0, 0
rof 

bGo    mov   cGate          , bDist+4+bEvac-bcOff-9
       spl   1              , cSwtch+5
bcDst  spl   1              , bDist+4+bEvac-bcOff
       mov   <bGo+1         , <bbDst
       mov   <bGo+1         , <bcDst
       mov   <bGo+1         , <bcDst
       mov   <bBoot         , {bBoot
       mov   <bBoot         , {bBoot
bbDst  mov.i bGo+1          , #bDist+2+bSpl
bBoot  jmp   >bDist+bEvac+1 , bEvac+1


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
 jmz.f bGo, qptr + (qz+1)*(qb2-1) + (qb2-1)
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
 jmp bGo
end qgo


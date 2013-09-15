;redcode-94nop
;name Flour Sifter
;author Christian Schmidt
;strategy qscanner, silk-dwarf, imps
;assert 1

pStep  equ    558
sStep  equ    2579
iStep  equ    2667

iBmb   equ    238
iOff   equ    3051

pAwa   equ    1170
iAwa   equ    4129

zero equ qbomb
qtab3 equ qbomb

qbomb   dat     >qoff,          >qc2
        dat     0,              0

pGo     spl     2,              }qb1
qtab2   spl     1,              }qb2
        spl     1,              }qb3

pBo     spl     pGo+pAwa,       pStrt
        mov.i   >pBo,           }pBo

        mov.i   <iGo,           {iBo
iBo     djn.f   pGo+iAwa,       <4958

pStrt   spl     @0,             <pStep
        mov.i   }-1,            >-1
        spl     #sStep,         >-sStep
        mov     {sStep,         {-sStep+1
        add     -2,             -1
pEnd    djn.f   @0,             {-2

iGo     spl     1,              iImp+1
iVort   spl     #0,             0
        add.x   iImp,           1
        djn.f   iImp-iStep*12,  <iOff
        dat     0,              0
iImp    mov.i   #iBmb,          iStep

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
; qy * (qz-1) = 1

;q0 mutation
qgo sne qptr + qz*qc2, qptr + qz*qc2 + qb2
 seq <qtab3, qptr + qz*(qc2-1) + qb2
 jmp q0, }q0
 sne qptr + qz*qa2, qptr + qz*qa2 + qb2
 seq <qtab1, qptr + qz*(qa2-1) + qb2
 jmp q0, {q0
 sne qptr + qz*qa1, qptr + qz*qa1 + qb2
 seq <(qtab1-1), qptr + qz*(qa1-1) + qb2
 djn.a q0, {q0
;q1 mutation
 sne qptr + qz*qb3, qptr + qz*qb3 + qb3
 seq <(qtab2+1), qptr + qz*(qb3-1) + (qb3-1)
 jmp q0, }q1
 sne qptr + qz*qb1, qptr + qz*qb1 + qb1
 seq <(qtab2-1), qptr + qz*(qb1-1) + (qb1-1)
 jmp q0, {q1
;no mutation
 sne qptr + qz*qb2, qptr + qz*qb2 + qb2
 seq <qtab2, qptr + qz*(qb2-1) + (qb2-1)
 jmp q0
;qz mutation
 seq >qptr, qptr + qz + (qb2-1)
 jmp q2, <qptr
;q0 mutation
seq qptr+(qz+1)*(qc2-1),qptr+(qz+1)*(qc2-1)+(qb2-1)
 jmp q0, }q0
seq qptr+(qz+1)*(qa2-1),qptr+(qz+1)*(qa2-1)+(qb2-1)
 jmp q0, {q0
seq qptr+(qz+1)*(qa1-1),qptr+(qz+1)*(qa1-1)+(qb2-1)
 djn.a q0, {q0
;no mutation
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


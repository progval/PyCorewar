;redcode-94nop
;name Sharky
;author Christian Schmidt
;strategy blur-scanner with zooom-trick and separate ssd-clear
;assert 1

gate	equ    (clear-5)
sStep   equ    975
sSep    equ    6807
sBeg    equ    3705
sTrain  equ    6953
sHit    equ    10
sSpace  equ    42+5
sClear  equ    (clear+sSpace)-7

sAwa    equ    6426

zero    equ qbomb
qtab3   equ qbomb

qbomb   dat     >qoff,     >qc2
sBoo    mov.i   step+8,    step+sAwa

        jmp     cBoo,      <qb1
qtab2   dat     0,         <qb2
        dat     0,         <qb3

cBoo    mov.i   clear+8,    gate+sAwa+sSpace-2
        mov.i   {sBoo,     <sBoo
        mov.i   {sBoo,     <sBoo
        mov.i   {cBoo,     <cBoo
        mov.i   {cBoo,     <cBoo
        djn     -4,        #4
        jmp     sScan+sAwa-7-1

step    nop    #sStep,     sStep
head    mov    }sFlag,     >sBeg
sWip    mov    sClear,     >head
sAdd    add.f  step,       sScan
sScan   sne    }sSep+8,    sSep
sFlag   djn.f  sAdd,       <sTrain
        mov.b  sScan,      @sWip
        djn    {sFlag,     #sHit
        jmp    sClear

        dat     zero - 1,       qa1
qtab1   dat     zero - 1,       qa2

clear	spl	#6,             {gate
	mov	*clear,         >gate
	mov	*clear,         >gate
	djn.f	-2,             {gate
	dat	<2*2667,        <2667
	spl	#6,             13
	spl	#6,             13

for 35
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
 jmz.f sBoo, qptr + (qz+1)*(qb2-1) + (qb2-1)
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
 jmp sBoo 
end qgo


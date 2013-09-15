;redcode-94nop
;name Bvowkium Fizmoxid
;author bvowk/fizmo
;strategy - Q^4.5 scanner
;strategy - paper with embedded evolved anti-imp clear
;strategy - paper with imps
;assert 1
;optimax pwi

pAway1  EQU		5072		;optimizable
pAway2  EQU		3114		;optimizable
pStep1  EQU		2219		;optimizable
pStep2  EQU		261		;optimizable
bStep1  EQU		243		;optimizable
sStep1  EQU		3121		;optimizable
sStep2  EQU		4028		;optimizable

iStep   EQU		2667        ;imp-step


zero    equ     qbomb
qtab3   equ     qbomb

qbomb   dat     >qoff,          >qc2
        dat     0,              0

pGo     spl     1,              <qb1
qtab2   spl     1,              <qb2
        mov.i   -1,             #qb3

        mov.i   <1,             {1
        spl     qbomb+pAway1,   pBack+1
        mov.i   <imp+1,         {1
        djn.f   qbomb+pAway2,   <3072

        dat     0,              0

pap     spl     @0,             <pStep1
        mov     }-1,            >-1
        spl     pStep2,         0
        mov     >-1,            }-1
        spl     #0,             0
        mov.i   #1,             <1
pBack   djn.b   -1,             #bStep1

        for     4
        dat     0,              0
        rof

        dat     zero - 1,       qa1
qtab1   dat     zero - 1,       qa2


        for    17
        dat     0,              0
        rof

pap1    spl     @0,             >sStep1
        mov     }-1,            >-1
        spl     sStep2,         0
        mov     >-1,            }-1
        spl     @0,             <iStep+1
        mov     }-1,            >-1
imp     mov.i   #iStep,         *0


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
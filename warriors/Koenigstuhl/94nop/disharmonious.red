;redcode-94nop
;author inversed
;name Disharmonious
;strategy Q^4 -> sd-clear/imps 
;strategy Improved by Fizmo
;assert (CORESIZE==8000) && (MAXPROCESSES==8000)

iinc1   equ     7182
iinc2   equ     220
bd1     equ     5799
bd2     equ     2398

zclear  equ     32
djofs   equ     10

istep   equ     2667

zero    equ     qbomb
qtab3   equ     qbomb

qbomb   dat     >qoff,          >qc2
bp1     dat     cptr,           cptr+bd1
        dat     0,              <qb1
pGo
qtab2   spl     1,              <qb2
        spl     1,              <qb3

        mov     <bp2,           {bp2
        mov     }bp1,           >bp1
        mov     }bp1,           >bp1
bp2     spl     qbomb+bd2,      is+4
        djn.f   s+bd1,          <6694

is      spl     #istep,         <iinc1
        add.f   is,             iptr
iptr    djn.f   imp-istep-1,    <iinc2
imp     mov.i   #0,             istep

        for    7
        dat     0,              0
        rof

        dat     zero - 1,       qa1
qtab1   dat     zero - 1,       qa2

cptr    dat     s,              zclear
        dat     0,              0
s       spl     #kill-cptr,     0
        spl     #0,             <cptr-djofs
        mov     *cptr,          >cptr
        mov     *cptr,          >cptr
        djn.f   -2,             <cptr-djofs
kill    dat     kill-cptr,      8

        for     42-8
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


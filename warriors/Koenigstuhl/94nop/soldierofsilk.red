;redcode-94nop
;name Soldier of Silkland
;author Christian Schmidt
;strategy ---------------------------
;strategy -      extended Q^4       -
;strategy -      bootstrapping      -
;strategy -    8-line silk dwarf    -
;strategy -     anti-imp paper      -
;strategy ---------------------------
;strategy - v1.0 initial release    -
;strategy - v1.1 new quickscanner   -
;strategy ---------------------------
;strategy - submitted 1-10-2003     -
;strategy ---------------------------
;strategy -    www.corewar.info     -
;strategy ---------------------------

;assert 1

zero    equ    qbomb
qtab3   equ    qbomb

pSt1    equ    4094
uStp    equ    703
uTim    equ    1183

pHit0   equ    7599
pDst0   equ    535
pDst1   equ    3875
pDst2   equ    5160

pAw1    equ    1354   ;5707;1445
pAw2    equ    5647   ;3879;7193

qbomb   dat    >qoff,     >qc2
        dat    0,         0

paper   spl    1,         <qb1
qtab2   spl    1,         <qb2
        spl    1,         <qb3

        mov.i  <pBo2,     {pBo2
pBo2    spl    uBmb+pAw1, uBmb+1
        mov.i  <p2Bo,     {p2Bo
p2Bo    jmp    uBmb+pAw2, pBmb+1

pap2    spl    @0,        <pSt1
        mov    }-1,       >-1
        spl    #0,        #0
uLp     mov    uBmb,      @uPtr
uHit    sub.x  #uStp*2,   @uLp
uPtr    mov    {3582,     }uHit+2*uStp*uTim
        djn.f  @uHit,     }uPtr
uBmb    dat    <uStp,     >1+6

     for 4
        dat    0,         0
     rof

        dat    zero-1,    qa1
qtab1   dat    zero-1,    qa2

pSilk0  spl    @0,        >pDst0
        mov    }pSilk0,   >pSilk0
pSilk1  spl    pDst1,     0
        mov    >pSilk1,   }pSilk1
        mov    pBmb,      >pHit0
        mov    <pSilk1,   <pSilk2
pSilk2  djn.f  @0,        >pDst2
pBmb    dat    >5334,     >2667

     for 34
        dat    0,         0
     rof

qc2 equ ((1 + (qtab3-qptr)*qy) % CORESIZE)
qb1 equ ((1 + (qtab2-1-qptr)*qy) % CORESIZE)
qb2 equ ((1 + (qtab2-qptr)*qy) % CORESIZE)
qb3 equ ((1 + (qtab2+1-qptr)*qy) % CORESIZE)
qa1 equ ((1 + (qtab1-1-qptr)*qy) % CORESIZE)
qa2 equ ((1 + (qtab1-qptr)*qy) % CORESIZE)
qz  equ 2108
qy  equ 243

qgo sne qptr+qz*qc2, qptr+qz*qc2+qb2
    seq <qtab3, qptr+qz*(qc2-1)+qb2
    jmp q0, }q0

    sne qptr+qz*qa2, qptr+qz*qa2+qb2
    seq <qtab1, qptr+qz*(qa2-1)+qb2
    jmp q0, {q0

    sne qptr+qz*qa1, qptr+qz*qa1+qb2
    seq <(qtab1-1), qptr+qz*(qa1-1)+qb2
    djn.a q0, {q0

    sne qptr+qz*qb3, qptr+qz*qb3+qb3
    seq <(qtab2+1), qptr+qz*(qb3-1)+(qb3-1)
    jmp q0, }q1

    sne qptr+qz*qb1, qptr+qz*qb1+qb1
    seq <(qtab2-1), qptr+qz*(qb1-1)+(qb1-1)
    jmp q0, {q1

    sne qptr+qz*qb2, qptr+qz*qb2+qb2
    seq <qtab2, qptr+qz*(qb2-1)+(qb2-1)
    jmp q0

    seq >qptr, qptr+qz+(qb2-1)
    jmp q2, <qptr

seq qptr+(qz+1)*(qc2-1),qptr+(qz+1)*(qc2-1)+(qb2-1)
    jmp q0, }q0

seq qptr+(qz+1)*(qa2-1),qptr+(qz+1)*(qa2-1)+(qb2-1)
    jmp q0, {q0

seq qptr+(qz+1)*(qa1-1),qptr+(qz+1)*(qa1-1)+(qb2-1)
    djn.a q0, {q0
    jmz.f paper, qptr+(qz+1)*(qb2-1)+(qb2-1)

qoff  equ -87
qstep equ -7
qtime equ 14

q0    mul.b  *2,     qptr
q2    sne    {qtab1, @qptr
q1    add.b  qtab2,  qptr
      mov    qtab3,  @qptr
qptr  mov    qbomb,  }qz
      sub    #qstep, qptr
      djn    -3,     #qtime
      jmp    paper

end qgo


;redcode-94nop
;author inversed
;name Blotter2
;strategy Paper/dclear
;assert (CORESIZE==8000) && (MAXPROCESSES==8000)

ofs0    equ     7679
ofs1    equ     2981
ofs2    equ     2432

zofs    equ     670
dist    equ     3058

gap0    equ     9
gap1    equ     6
gap2    equ     3

f       equ     4697
y       equ     5033

dq      equ     (y+1)%CORESIZE
qa1     equ     (1+f*(qt1-1-found))%CORESIZE
qa2     equ     (1+f*(qt1  -found))%CORESIZE
qb1     equ     (1+f*(qt2-1-found))%CORESIZE
qb2     equ     (1+f*(qt2  -found))%CORESIZE
qb3     equ     (1+f*(qt2+1-found))%CORESIZE
qc2     equ     (1+f*(qt3  -found))%CORESIZE

qt3     equ     qbomb

org     qgo

silk0   spl     @0,     <ofs0
        mov     }silk0, >silk0
        mov     }silk0, >silk0
silk1   spl     @0,     <ofs1
        mov     }silk1, >silk1
        mov     {silk1, <silk2  
silk2   jmp     @0,     >ofs2

        for     gap0
        dat     0,      0
        rof

        dat     0,      qb1
qt2     dat     0,      qb2
        dat     0,      qb3

wgo     mov     cptr,           cptr+dist-gap1
        mov     bomb,           bomb+dist+gap2
        spl     1,              qa1
qt1     spl     1,              qa2
        mov     <bptr,          {bptr
        spl     *1,             0
bptr    spl     dj+1+dist,      dj+1
        jmp     silk0,          0
        
cptr    dat     0,              zofs
        dat     0,              0
stone   spl     #0,             >cptr-gap1
        spl     #0,             >cptr-gap1      
        mov     bomb+gap2,      >cptr-gap1
dj      djn.f   -1,             >cptr-gap1
        dat     0,              0
bomb    dat     0,              (bomb-cptr+gap1+gap2+1)

        for     29
        dat     0,      0
        rof

        ;q0 mutations 
qgo     sne     found+dq*qc2,   found+dq*qc2+qb2
        seq     <qt3,           found+dq*(qc2-1)+qb2
        jmp     q0,             }q0

        sne     found+dq*qa1,   found+dq*qa1+qb2
        seq     <qt1-1,         found+dq*(qa1-1)+qb2
        djn.a   q0,             {q0

        sne     found+dq*qa2,   found+dq*qa2+qb2
        seq     <qt1,           found+dq*(qa2-1)+qb2
        jmp     q0,             {q0

        ;q1 mutations 
        sne     found+dq*qb1,   found+dq*qb1+qb1
        seq     <qt2-1,         found+dq*(qb1-1)+(qb1-1)
        jmp     q0,             {q1

        sne     found+dq*qb3,   found+dq*qb3+qb3
        seq     <qt2+1,         found+dq*(qb3-1)+(qb3-1)
        jmp     q0,             }q1

        ;no mutation 
        sne     found+dq*qb2,   found+dq*qb2+qb2
        seq     <qt2,           found+dq*(qb2-1)+(qb2-1)
        jmp     q0,             0


        ;dq mutation 
        seq     >found,         found+dq+(qb2-1)
        jmp     qsel,           <found

        ;q0 mutation
        seq     found+(dq+1)*(qc2-1),   found+(dq+1)*(qc2-1)+(qb2-1)
        jmp     q0,                     }q0

        seq     found+(dq+1)*(qa2-1),   found+(dq+1)*(qa2-1)+(qb2-1)
        jmp     q0,                     {q0

        seq     found+(dq+1)*(qa1-1),   found+(dq+1)*(qa1-1)+(qb2-1)
        djn.a   q0,                     {q0 

        ;free scan
        jmz.f   wgo,                    found+(dq+1)*(qb2-1)+(qb2-1)
        
q0      mul.b   *q1,     found
qsel    sne     <qt1,   @found
q1      add.b   qt2,     found

qoff    equ     -86
qtime   equ     20
qstep   equ     7

qloop   mov     qbomb,  @found
found   mov     qbomb,  }dq
        add     #qstep, found
        djn     qloop,  #qtime
        jmp     wgo,            0
qbomb   dat     {qoff,  {qc2


;redcode-94nop 
;assert CORESIZE==8000 
;name O--* 
;author Bremer/Schmidt 
;strategy team warrior 
;strategy based on Fuse 
;strategy but reworked from the ground 
;optimax stn

sBoot   equ    3139 
sLen    equ    9 
sOff1   equ    5764 
sOff2   equ    1679 

gate    equ    (clear-5) 
zero    equ    qbomb 
qtab3   equ    qbomb 

qbomb   dat    >qoff,          >qc2 
jumper  jmp    4009,           18 

sBoo2   dat    qbomb+sBoot,    <qb1 
qtab2   dat    switch+1,       <qb2 
        dat    0,              <qb3 

        jmp    -400,           <2667 
clear   spl    #4600,          18 
        mov    @switch,        >gate 
        mov    gate+1,         }gate 
switch  djn    clear,          {clear 

        sub.x  step,           scan 
scan    mov.i  }sOff1,         sOff2 
        jmz.f  -2,             {scan 
        mov.f  scan,           gate-sLen 
step    jmp    }switch-sLen,   switch-sLen+1 

pGo2    mov.i  <sBoo1,         {sBoo1 
for 4 
        mov.i  <sBoo1,         {sBoo1 
rof 
  
sBoo1   jmp    qbomb+sBoot+sLen+5,  step+1 

        dat    zero - 1,       qa1 
qtab1   dat    zero - 1,       qa2 

pGo     spl    pGo2 
        mov.i  jumper,         qbomb+sBoot-8 

for 5 
        mov.i  {qtab2,         {sBoo2 
rof 



        for 35 
        dat     0,           0 
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

q0    mul.b  *2,        qptr 
q2    sne    {qtab1,    @qptr 
q1    add.b  qtab2,     qptr 
      mov    qtab3,     @qptr 
qptr  mov    qbomb,     }qz 
      sub    #qstep,    qptr 
      djn    -3,        #qtime 
      jmp    pGo 

end qgo 

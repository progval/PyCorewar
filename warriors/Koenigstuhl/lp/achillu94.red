;redcode-lp
;name Achillu 94
;author LAchi + Fizmo
;strategy Say it "I KILL U".
;strategy This is just I KILL U rewritten by Fizmo in Redcode-94.
;strategy New constants, some corecoloring and an additional quickscanner.
;strategy Thanks for retuning and rewriting.
;assert CORESIZE==8000 

count   dat     0, 0
      dat     0, 0
ind     dat     0, 0 

start   spl     loop,           <7692
      mov     #4242,          count
again   mov     #bomb-ind+1,    ind
copy    mov     @ind,           <count
      djn     copy,           ind
      spl     @count,         <2876
      add     #6902,          count
      jmp     again,          <3078 

      dat     0,              0 

loop    add.ab  #69,            bomb
      mov     bomb,           @bomb
      djn.f   loop,           <640
      dat     0,              0
bomb    dat     <1,             {293 

      for     56
      dat     0,              0
      rof 

zero    equ qbomb
qtab3   equ qbomb 

qbomb   dat     >qoff,          >qc2
      dat     0,              0 

      dat     0,              <qb1
qtab2   dat     0,              <qb2
      dat     0,              <qb3 

      for     16
      dat     0,              0
      rof 

dat zero - 1, qa1
qtab1 dat zero - 1, qa2 

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
jmz.f start, qptr + (qz+1)*(qb2-1) + (qb2-1)
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
jmp start
end qgo 

;redcode-94x 
;name Rasp
;author Leonardo H. Liporati
;assert CORESIZE==800 

qdist equ 74 
qstep1 equ 423 ; H 
qstep2 equ 264 ; I 
qinit equ found 
qmagic equ 311 ; N 
qb equ ((qstep1+1)*qmagic) 
qc equ (qstep1*qmagic) 
qd equ ((qstep1-1)*qmagic) 
qa equ (qstep2*qmagic) 
qe equ ((qstep2-1)*qmagic) 

; Tiny-Q^4 scan ; All modulo CORESIZE 
start sne qb+qinit, qb+qdist+qinit ; (H+1)*N 
seq qc+qinit, <table ; H*N+qdist <=> (H-1)+(table-found) 
jmp fast, >table 

sne qa+qinit, qa+qdist+qinit ; I*N 
seq qe+qinit, <tablem1 ; (I-1)*N+qdist <=> (I-1)+(tablem1-found) 
jmp fast, {fast 

sne qd+qinit, qd+qdist+qinit ; (H-1)*N 
jmz tablem1, qd+qdist+qinit+3 ; Free Scan 

; decode address 
fast mul.ba table, found 
found sne qmagic, >310 
add.a #qdist, found 

again mov.i bomb, }found ; 0.5c forward dat bomber 
jmn.f again, }found 

; Tiny-Silk 
p1 equ 137 
p2 equ 42 
tablem1 spl 1, }qstep2 
table spl 1, }qstep1 
spl @0, >p1 
mov }-1, >-1 
mov {-2, <1 
spl @0, >p2 
mov.i #p1*2, }-p1 
bomb end start 

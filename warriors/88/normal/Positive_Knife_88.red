;redcode 
;name Positive Knife '88
;author Ken Espiritu 
;strategy q^2 -> stone/imp 
;assert 1 

step equ 1339 
time equ 3058 
doff equ -983 
boff equ 1336 
sloc equ 880 
iloc equ 3387 
ioff equ 3360 

qf equ (qgo+1*qs) 
qd equ 100 
qs equ (2*qd) 
qi equ 7 
qr equ 7 

spl 0, <sloc-iloc+doff 
spl sloc-iloc-1,ioff+2667*2+1 
add #2667, -1 
djn @-2, <sloc-iloc+doff-3 
iend mov 0, 2667 

s spl 0 , <doff 
sl mov boff+3, hit-step*time 
hit add #step, -1 
djn sl, <doff+s 
bomb dat <2667, <0 

qbomb dat <qi/2-qi*qr,<qi*qr-qi/2 
dat #12*qs ;a 
qp1 dat #5*qs ;b 
qp2 dat #2*qs ;c 
qp3 ; dat #1*qs ;d 

qgo cmp qd+qf, qf ;d 
jmp qskip, <qf+4 

cmp qd+qf+qs*5, qf+qs*5 
jmp qfast, <qf+qs*5+4 
cmp qd+qf+qs*12,qf+qs*12 
q1 djn qfast, #qp1 

cmp qd+qf+qs*7, qf+qs*7 
jmp qslow, <qf+qs*7+4 
cmp qd+qf+qs*14,qf+qs*14 
jmp qslow, <q1 
cmp qd+qf+qs*10,qf+qs*10 
q2 djn qslow, #qp2 
cmp qd+qf+qs*2, qf+qs*2 
jmp qslow, <qfast 

cmp qd+qf+qs*8, qf+qs*8 
jmp qslower, <qf+qs*8+4 
cmp qd+qf+qs*15,qf+qs*15 
jmp qslower, <q1 
cmp qd+qf+qs*11,qf+qs*11 
jmp qslower, <q2 
cmp qd+qf+qs*9, qf+qs*9 
q3 djn qslower, #qp3 
cmp qd+qf+qs*3, qf+qs*3 
jmp <qfast, <qf+qs*3+4 
cmp qd+qf+qs*6, qf+qs*6 
jmp <qfast, <q2 
cmp qd+qf+qs*4, qf+qs*4 
jmp <qfast, <q3 
cmp qd+qf+qs*16,qf+qs*16 
slt <q3, <q1 

jmz boot, qd+qf+qs*8+10 

qslower add @q3, @q2 
qslow add @q2, qkil 
qfast add @q1, @qslow 

qskip jmn qloop, @qkil 

add #qd, qkil 
qloop mov qbomb, @qkil 
qkil mov qbomb, <qf 
sub #qi, @qloop 
djn qloop, #qr+2 

boot mov <ssptr, s+sloc+boff 
mov <siptr, s+iloc+ioff 
ssptr spl 1, bomb+1 
siptr spl 1, iend+1 
mov <ssptr, <dsptr 
mov <siptr, <diptr 
dsptr spl @0, s+sloc 
diptr jmp @0, s+iloc 
end qgo 

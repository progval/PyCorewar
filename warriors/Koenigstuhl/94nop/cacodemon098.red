;redcode-94nop
;name Cacodemon v0.98
;strategy q^4->paper/stone
;strategy diff stone
;author Andrew Hunter / Fizmo
;assert CORESIZE==8000

sOff    equ     6033

zero    equ     qbomb
qtab3   equ     qbomb

qbomb   dat     >qoff,          >qc2
sBoot   mov     tail,           6+sOff-CURLINE

        spl     2,              <qb1
qtab2   spl     1,              <qb2
        spl     1,              <qb3

        mov     {sBoot,         <sBoot
        spl     @sBoot

sGo     spl     1
silk    spl     1967,           0
        mov     >-1,            }-1
        spl     737,            0
        mov     >-1,            }-1
fsilk   spl     2400,           0
        mov     >-1,            }-1
        mov     bomb,           >1801
        mov     bomb,           }7341
        mov     bomb,           >3826
        add.a   #817,           fsilk
        jmp     fsilk,          <fsilk
bomb    dat     >2667,          >5334

        for     1
        dat     0,              0
        rof

        dat     zero - 1,       qa1
qtab1   dat     zero - 1,       qa2

step    equ     1529
hop     equ     18

        spl     #0
        spl     #0  
        mov     bmb,            }step+1
        mov     bmb,            @-1
        add.ab  #step,          @-1
        djn.f   -3,             <-2000 
tail    
bmb     dat     <hop,           >1

for 42-7
 	dat 0, 0
rof

qc2 	equ ((1 + (qtab3-qptr)*qy) % CORESIZE)
qb1 	equ ((1 + (qtab2-1-qptr)*qy) % CORESIZE)
qb2 	equ ((1 + (qtab2-qptr)*qy) % CORESIZE)
qb3 	equ ((1 + (qtab2+1-qptr)*qy) % CORESIZE)
qa1 	equ ((1 + (qtab1-1-qptr)*qy) % CORESIZE)
qa2 	equ ((1 + (qtab1-qptr)*qy) % CORESIZE)
qz 	equ 2108
qy 	equ 243
qgo 	sne qptr + qz*qc2, qptr + qz*qc2 + qb2
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
 	jmz.f sBoot, qptr + (qz+1)*(qb2-1) + (qb2-1)

qoff 	equ -87
qstep 	equ -7
qtime 	equ 14
q0 	mul.b *2, qptr
q2 	sne {qtab1, @qptr
q1 	add.b qtab2, qptr
 	mov qtab3, @qptr
qptr 	mov qbomb, }qz
 	sub #qstep, qptr
 	djn -3, #qtime
 	jmp sBoot

	end qgo


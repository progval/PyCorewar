;redcode-94
;name Slaver v1.2
;author Christoph C. Birk
;strategy v1.0  stun bomber & core clear
;strategy v1.1  optimized constants & imp-gate
;strategy v1.2  new bomb-type
;assert 1

DECR    equ 15
LOOP    equ (CORESIZE-200)/(DECR+2)
GATE	equ 30  

target  dat #-10 
splt    spl #0,move+1
move    mov splt,>splt

for 90
        dat 0,0
rof

start   mov move,<target
        mov splt,<target
        sub #DECR,target
        djn start,#LOOP
        spl #0,<target-GATE             ; imp-gate
clear   mov 2,<-2
        jmp clear,<target-GATE          ; imp-gate

        end start


;redcode
;name Slaver v1.1
;author Christoph C. Birk
;strategy v1.0  SPL0/JMP-1 bomber & core clear
;strategy v1.1  optimized constants & imp-gate
;assert 1

DECR    equ 15
LOOP    equ ((CORESIZE-200)/(DECR+2))
GATE	equ 30  

target  dat #-99
start   mov jump,<target
        mov splt,<target
        sub #DECR,target
        djn start,#LOOP
splt    spl 0,<target-GATE              ; imp-gate
clear   mov target,<-2
jump    jmp clear,<target-GATE          ; imp-gate

        end start


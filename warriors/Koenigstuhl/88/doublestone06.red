;redcode
;name DoubleStone v0.6
;author Christoph C. Birk
;strategy spl 0 - bomber -> core clear
;assert 1
;v0.7 scored 150 on ICWS

STEP    equ 8 
LOOP    equ (CORESIZE/(STEP+1))

start   mov split,<-300
        mov split,<start
        sub #STEP,start
        djn start,#LOOP
split   spl 0,0
        mov 2,<-1
        jmp -1,<2667

        end start



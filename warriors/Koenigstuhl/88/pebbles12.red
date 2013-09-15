;redcode
;name Pebbles v1.2
;author Christoph C. Birk
;assert 1 
;strategy just some small stones

NUM     equ 6
STEP    equ (CORESIZE/(NUM+1))

target  dat #STEP
start   mov bomber+1,@target  
        mov bomber+0,<target
        spl @target 
        add #STEP,target
        djn start,#NUM

for 92
        dat #0
rof

bomber  mov 2,<-1
        jmp -1,<-2

        end start


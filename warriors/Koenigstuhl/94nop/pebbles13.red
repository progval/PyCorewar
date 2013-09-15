;redcode-94
;name Pebbles v1.3
;author Christoph C. Birk
;assert 1 
;strategy just some small stones

NUM     equ 6
STEP    equ (CORESIZE/(NUM+1))
GATE    equ 30

target  dat #STEP
start   mov bomber+2,@target  
        mov bomber+1,<target
        mov bomber+0,<target
        spl @target 
        add #STEP,target
        djn start,#NUM

for 90
        dat 0,0
rof

bomber  spl #0,<bomber-GATE
loop    mov 2,<-2
        djn loop,>1

        end start


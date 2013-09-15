;redcode
;name Pebbles v1.0
;author Christoph C. Birk
;assert 1 

target  dat #3603
start   mov bomber+1,<target  
        mov bomber,<target
        spl @target 
        add #3601,target
        jmp start
for 90
        dat #0,#0
rof

bomber  mov -1,<-1
        jmp -1

        end start

;redcode
;name Fortress 1.1
;author Malcolm Ryan
;strategy Sometimes the best form of attack is defense.
;assert 1
gate    dat #0
gate2   dat #0
        dat #0
start   add #51,target
target  mov bomb,gate+2
        djn start,gate
loop    djn loop,gate
bomb    mov 0,1
        end start    

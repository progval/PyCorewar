;redcode verbose
;author Adam Caldwell
;name Crazy Imp
;assert 1
here    spl     bomb1
start   mov     bomb, bomb1+1
        mov     bomb1, @start
        spl     @start
        add     #3077, start
        jmp     start
bomb    spl     0,0
bomb1   mov     0,1
        end     here

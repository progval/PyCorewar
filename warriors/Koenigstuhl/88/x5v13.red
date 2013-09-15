;redcode-x verbose
;name X5 V1.3
;author Adam Caldwell
;strategy unleash 3000 spl 0, #1 statements into the core
;strategy at 411 byte intervals.  Next, repair the damage
;strategy that this caused to my program and then sweep
;strategy through memory with the deadly dat #0, #0
;assert 1
start   mov     bomb, -1
        sub     #411, -1
        djn     start, #3000
        spl     0, #0
        mov     0, <0
        jmp     1, #0
        mov     0, <0

kill    mov     bomb1, <kill
        djn     kill, #-4
        jmp     1, #0
        mov     0, 1
        mov     0, 1
bomb    spl     0, #1
bomb1   dat     #0, #0
        end     start

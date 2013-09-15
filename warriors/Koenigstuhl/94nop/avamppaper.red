;redcode-94
;name Anti Vamp Paper
;assert CORESIZE==8000

        spl     1
        spl     1
        spl     1
start   mov     #8, 0
copy    mov     <-1, <ptr       ; make copy
ptr     spl     @0, 6301        ;start new copy
        sub     @avamp,<avamp   ; subtract pointers going backwards
avamp   mov     bomb,>100       ; now bomb forward to kill jump
        mov     bomb,>avamp
        jmz     start, start
bomb    dat     <2667, <2*2667  ; might take out an imp if I'm lucky

;redcode
;name Imprimis
;author P.Kline
;assert 1

d        equ 2667
datzero  equ inc-5
inc      dat #0-2365,#2365
emerald  spl 0
stone    mov <cnt-2365-2,<cnt+2365-1
         add inc,stone
cnt      djn stone,<5061

datz1   dat #0
        dat #0
        dat #0
        dat #0
        dat #0
        dat #0
        dat #0
        dat #0
        dat #0
        dat #0
        dat #0
        dat #0
        dat #0
        dat #0
        dat #0
        dat #0
        dat #0
        dat #0
        dat #0
        dat #0
        dat #0
        dat #0
        dat #0
        dat #0
        dat #0
        dat #0
        dat #0
        dat #0
        dat #0
rf34    dat #5635,#2365
        spl 0
        mov <5635,<2366
        add 7997,7999
        djn 7998,<5061
datz2   dat #0
        dat #0
        dat #0
        dat #0
        dat #0
        dat #0
        dat #0
        dat #0
        dat #0
        dat #0
rf49    dat #5635,#2365
        spl 0
        mov <5635,<2366
        add 7997,7999
        djn 7998,<5061
datz3   dat #0
        dat #0
        dat #0
        dat #0
        dat #0
        dat #0

start   mov 100,datz1
        mov 100,datz2
        mov 100,datz3
        mov imp,imp+1333
        spl 1
        spl 16
        spl 8
        spl 4
        spl 2
        jmp imp+(d*0)
        jmp imp+(d*1)
        spl 2
        jmp imp+(d*2)
        jmp imp+(d*3)
        spl 4
        spl 2
        jmp imp+(d*4)
        jmp imp+(d*5)
        spl 2
        jmp imp+(d*0)+1333
        jmp imp+(d*1)+1333

        spl 8
        spl 4
        spl 2
        jmp imp+(d*2)+1333
        jmp imp+(d*3)+1333
        spl 2
        jmp imp+(d*4)+1333
        jmp imp+(d*5)+1333
        spl emerald
        spl emerald
        spl emerald
        jmp emerald
        dat #0
        
imp     mov 0,2667
        end start


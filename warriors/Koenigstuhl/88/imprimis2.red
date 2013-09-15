;redcode
;name Imprimis 2
;author P.Kline
;strategy two three-point imp spirals with a stone
;strategy now capable of beating other imps (10%)
;assert CORESIZE==8000
d        equ 2667
datzero  equ (inc-5)
inc      dat #2667,#3039

emerald  spl 0
stone    mov <cnt-2365-2+1267,cnt+2365-1+10
         add inc,stone
cnt      djn stone,<5061-1056

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
rf34    dat #2667,#3039
        spl 0
        mov <6902,<2376
        add 7997,7999
        djn 7998,<4005
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
rf49    dat #2667,#3039
        spl 0
        mov <6902,<2376
        add 7997,7999
        djn 7998,<4005
datz3   dat #0
        dat #0
        dat #0
        dat #0
        dat #0
        dat #0

start   mov <1000,datz1
        mov <1500,datz2
        mov <2000,datz3
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
        
imp     mov 0,2667
        end start

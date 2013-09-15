;redcode
;name Sargent
;author Kevin
;assert 1
stomp   dat #0,#0
start   add offset,bomb
        jmz start,@bomb
        slt us,bomb
        jmp recruit,0
        mov offset,pit
        jmp start ,0
recruit mov #46,recruit
        sub offset,bomb
loop    add step,bomb
        mov bomb,@bomb
        djn loop,recruit
        jmp start,0
labor   mov help,stomp
pit     spl -1,0
        jmp -1,0
help    spl 14,0
bomb    jmp -3,0
us      dat #0,#-20
offset  dat #-23,#23
step    dat #-3,#3

        end start

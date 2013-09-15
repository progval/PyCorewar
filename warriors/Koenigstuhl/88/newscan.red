;redcode quiet
;name Newscan
;author P.Kline
;strategy cmp-scanning pit-trapper
;assert CORESIZE==8000
step    equ 3364
snare2  equ (trap+30-6)

trap    spl 0
clear   mov bomb,100
        add #2667,clear
loop    jmp trap,scan-snare2-6
bomb    dat #0

next    sub inc,@scanptr
scan    cmp loop,loop
        slt #20,@scanptr
        jmp next

attack  mov snare,@scan
scanptr add scan,@scan
        mov loop,@snarptr
        sub scan,@snarptr
        slt #-70,snare2
snarptr mov snare2,@snare2
        jmp next
inc     dat #0-step,#step
snare   jmp 3
        end next

;redcode verbose
;name Mort Aux Vaches
;author Joshua Houk
;strategy       Multi-level bomber with core clear.  
;assert 1

bomb    dat     #0
start   add     #10,bomb
        mov     bomb,@bomb
        add     #20,bomb
        mov     bomb,@bomb
        jmn     start,bomb
        spl     run2
        jmp     start

        dat     #0
bomb2   dat     #0
        dat     #0
        dat     #0
        dat     #0
        dat     #0
        dat     #0
        dat     #0
        dat     #0
        dat     #0
        dat     #0
        dat     #0
        dat     #0
        dat     #0
        dat     #0
        dat     #0
        dat     #0
        dat     #0
        dat     #0
        dat     #0
        dat     #0
        dat     #0
        dat     #0
        dat     #0
        dat     #0
        dat     #0
        dat     #0
        dat     #0
        dat     #0
        dat     #0
        dat     #0
        dat     #0
        dat     #0
        dat     #0
        dat     #0
        dat     #0
        dat     #0
        dat     #0
        dat     #0
        dat     #0
        dat     #0
        dat     #0
        dat     #0

run2    add     #8,bomb2
        mov     bomb2,@bomb2
        jmn     run2,bomb2
        spl     clear
        jmp     run2

        dat     #0
        dat     #0
bomb3   dat     #0
        dat     #0
        dat     #0
        dat     #0
        dat     #0
        dat     #0
        dat     #0
        dat     #0
        dat     #0
        dat     #0
        dat     #0
        dat     #0
        dat     #0
        dat     #0
        dat     #0
        dat     #0
        dat     #0
        dat     #0
        dat     #0
        dat     #0
        dat     #0
        dat     #0
        dat     #0
        dat     #0
        dat     #0

clear   spl     imp

run3    add     #3039,bomb3
        mov     bomb3,@bomb3
        jmp     run3

imp     mov     0,1

        end     start

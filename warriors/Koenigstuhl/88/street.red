;redcode verbose
;name Street Sweeper
;author Adam Caldwell
;assert 1

ptr     dat     #-100
ptr2    dat     #30

start   spl     suber
        spl     junk

adder   add     #8, ptr2
        mov     bomb, @ptr2
        djn     adder, #900
        mov     #900,   -1
        mov     #34,    ptr2
        djn     adder,  #2
delay   djn     delay,  #-1
        jmp     loop

bomb1   dat     #0,     #ptr
bomb    spl     0
suber   mov     bomb1,  <bomb1
        djn     suber,  #-30
        mov     #-30, -1
        mov     #-20, bomb1
        jmp     suber

junk    mov     junk, 2000      ; Throw junk out in memory
        add     #99, junk       ; to confuse programs searching
        djn     junk, #40       ; for changed memory
        mov     #40, -1
        mov     #3000, junk
        djn     junk, #2
locate  dat     #10
loop    mov     imp, <locate
        spl     @locate
        sub     #2, locate

imp     mov     0, 1
        end     start

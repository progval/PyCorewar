;redcode
;name Coke 1.0
;author Maz Spork
;assert 1

start   mov     #3, mutate
copy    mov     @mutate, <dest
        djn     copy, mutate
        spl     @dest
        sub     #1000, dest
        jmp     start
dest    dat     #-64
mutate  dat     #0
kill    mov     -1, <kill
        djn     kill, <kill
        dat     #kill
        end

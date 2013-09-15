;redcode
;name bump.v2
;author harleyQ2
;strategy stone
;assert 1


step    equ 3044
g       equ start-20
off     equ 2511


boot    mov start, off
        mov stone, off
        mov loop, off
split   spl 0, <g
        jmp 1, <g
        jmp 1, <g
        jmp 1, <g
        jmp 1, <g
        jmp 1, <g
        jmp 1, <g
        jmp 1, <g
        jmp 1, <g
        mov bomb, split
        jmp boot+off, <g
        
start   add #step, 1
stone   mov bomb, bomb
loop    djn start, <g
bomb    dat #0, #0

end     boot

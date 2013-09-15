;redcode
;name bump
;author harleyQ2
;strategy I hate '88,
;strategy so I just hacked up a simple stone/imp.
;assert CORESIZE == 8000

step    equ -12
g       equ loop+step*5
off     equ 2511
num     equ 6
size    equ 1143

boot    mov sp, sp+off
        mov stone, stone+off
        mov stone+1, stone+off+1
        mov loop, loop+off
        mov cc, cc+off
        mov cc+1, cc+off+1
        mov last, last+off
        spl @boot, <boot-105
        jmp shrimp
        
sp      spl 0, <g
stone   mov sp, g+step
        add #step, -1
loop    djn stone, <g
cc      mov last, sp-1
        djn -1, <cc
last    dat <2667, <5334

shrimp  spl 1
        spl 1
        spl 8
        spl 4
        spl 2
        jmp imp+size*0
        jmp imp+size*1
        spl 2
        jmp imp+size*2
        jmp imp+size*3
        spl 4
        spl 2
        jmp imp+size*4
        jmp imp+size*5
        spl 2
        jmp imp+size*6
        jmp imp+size*7
imp     mov imp, imp+size

end     boot

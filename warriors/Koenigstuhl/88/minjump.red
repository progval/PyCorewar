;redcode
;name MinJump
;author Pierre Dak Baillargeon
;assert 1
size    equ     3
dist    equ     -217

start   spl split,  0           ; make 3 tasks
        jmp init,   0
split   spl 1,      0
init    mov #size,  init        ; reset size
        mov <init,  <dest       ; copy ourself
dest    jmp @dest,  #dist       ; jump to new code

        end start

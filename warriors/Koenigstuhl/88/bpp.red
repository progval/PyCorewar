;redcode
;name B++
;author Dan Nabutovsky
;contact fedimit@wisipc.weizmann.ac.il
;strategy bscan, coreclear, impgate
;assert 1

loop    add #3036, dest
        jmz -1, @dest
        mov jump, @dest
dest    mov split, <-2
        jmn loop, loop
split   spl 0
        mov -10, <-10
        jmz -1, 320
        jmp 0, <-15
jump    jmp -1

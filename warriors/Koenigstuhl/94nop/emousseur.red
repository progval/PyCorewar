;redcode-94
;name Emousseur
;author Planar
;strategy Crush myZizzor.
;strategy A simple core-clear that is invisible to myZizzor's scanner.
;assert MAXLENGTH >= 7

start   mov.i   bomb, <ptr
        mov.i   bomb, <ptr
        mov.i   bomb, <ptr
        mov.i   bomb, <ptr
        jmp     start

bomb    dat     0, start-1-ptr
ptr     dat     0, start-1

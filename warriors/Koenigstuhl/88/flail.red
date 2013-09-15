;redcode
;name Flail
;strategy Hope that Anders Ivner scraps his
;strategy Leprechaun--because I can't seem to
;strategy beat it.
;author Pi Qan
;assert 1

start   mov     <from,  <to
        mov     <from,  <to
        mov     <from,  <to
to      spl     @to,    -1900
        sub     #1900,  to
        add     #3,     from
from    jmp     start,  4
        spl     1
        mov     -2,     <-1
        jmp     -2

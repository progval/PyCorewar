;redcode-94
;assert 1
;name Goin' Mobile
;strategy dodge stones, forward clears, and some scanners
;strategy (e.g. He Scans Alone, Blur 2)

pointer equ (top + (top-first))

top     dat  -100,   0
move    sub.ab top, #-100
        mov    top,  pointer
        mov   @top, }pointer  ; copy self over footprint
        jmn.f   -1, >top
        jmp   *top,  0     ; jump to the new copy
first   mov.ba move, top
wipe    mov    top, <move  ; clear fast, scan slow
        mov    top, <move
        jmz.b wipe, {top   ; check for fresh "footprints"
        jmp   move,  0

end wipe


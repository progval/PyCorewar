;redcode
;name reverse dwarf
;strategy variation on the the classic DWARF;
;strategy it just goes backwards
;assert 1

bomb    dat     #4
start   sub     #5,     bomb
        mov     #0,     @bomb
        jmp     start
        end     start

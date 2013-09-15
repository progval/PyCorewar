;redcode
;name     Goblin
;author   Michael Itz
; <mike@itaris.net>
;strategy A dwarf that explodes into an imp-ring after one pass.
;assert 1

go     add #5, stone
       mov stone, @stone
       cmp.f go, stone
       jmp go
       jmp clear
stone  dat #0, #0
c      jmp imp-2666
clear  spl c
       spl imp+2667
imp    mov 0, 2667

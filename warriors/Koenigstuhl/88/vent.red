;  Since I tend to think it's the smallest possible, I'm posting Vent du mont
;Sharr.  It's a 3 instructions spl bomber, core mutagenizing, core clearer. It
;is currently mod 4, but I'm working on an odd step version.

;redcode verbose
;name Vent du mont Sharr
;author Pierre Dak Baillargeon
;strategy   v1.0:   YASB.
;strategy   v2.0:   Mutagenize memory.
;assert 1

dist    equ -6883          ; mod 4

coma    spl coma,  <1      ; the poison, the pointer and the core mutagenizer
start   add #dist, coma+1  ; change location
kill    mov @kill, <coma   ; put ennemy in coma (indirection is the key)

        end coma

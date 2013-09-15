;redcode verbose
;name B2
;author S.C. Carlson
;strategy Low-profile bomber
;assert 1
b2      add #45,ptr
        jmp 3
        dat #0
        dat #0
        mov sbomb,@ptr
        jmp 3
sbomb   dat #0
        dat #0
        mov dbomb,<ptr
        jmp b2
dbomb   dat #0
        dat #0
ptr     dat #2

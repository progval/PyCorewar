;redcode
;name  paratrooper
;author Vincent Li
;address vli@atom.mpr.ca
;strategy duplicates imps into core as fast as possible
;assert 1
        jmp     start
count   DAT     #40           ; # of imps
ptr     DAT     #4025         ; offset ~1/2 core size
start   mov     imp, @ptr
        spl     @ptr          ; reproduce the imp
        add     #2125, ptr    ; next imp location ~1/n of core size
        djn     start, count
imp     mov     imp, imp+1
        end

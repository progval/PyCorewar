;redcode
;name  paratrooper v2.1
;author Vincent Li
;(vli@atom.mpr.ca)
;strategy duplicates imps into core as fast as possible
;strategy v2.0 added a bomber to the split
;strategy v2.1 use "optimal" increment
;assert 1
start   mov     imp, @ptr
ptr     spl     @ptr,#3044
        mov     return,<ptr
        mov     bomber,<ptr
count   spl     @ptr,#20
        add     #3044, ptr
bomb    djn     start, count
bomber  mov     bomb, <bomb
return  jmp     bomber,0
imp     mov     imp, imp+1
        end     start

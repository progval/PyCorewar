;redcode-94x
;name fizUncle
;author Christian Schmidt
;strategy agressive coreclear paper
;assert 1

pStart  spl     2,      <736
        spl     2,      <638
        spl     1,      <522

s1      spl     @0,     <66
        mov     }-1,    >-1
        mov     }-2,    >-2
s2      spl     @0,     <539
        mov     }-1,    >-1
        mov.i   }322,   <436
        jmp     -2,     <495

        end     pStart

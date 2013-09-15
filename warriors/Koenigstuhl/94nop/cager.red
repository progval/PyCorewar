;redcode-94
;name cager
;author Skaldrom Y. Sarg
; <corewar@blutrausch.ch>
;strategy Cages Warriors
;assert 1

BOMBINTRVL equ 336
org boot

boot:   spl loop
        spl imp
clr:    mov bbomb, <bbomb
        jmp clr
bbomb:  dat #-3

loop:   add     #BOMBINTRVL, bombl
        sub.a   #BOMBINTRVL, bomb
        mov     bomb, @bombl
        jmp loop

cage: spl cage
      jmp cage
bomb:   jmp cage, <2
bombl:  dat #-1
imp:  mov 0,1

end

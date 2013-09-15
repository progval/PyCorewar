;redcode-nano
;name Bombus Mocsaryi
;author S.Fernandes
;strategy mov mov spl mov mov
;assert CORESIZE==80

        org     loop
ptra    equ     loop-2
ptrb    equ     loop+18
ptrc    equ     loop+43

loop    mov     }ptrb       ,   <ptra
        mov     }ptrb       ,   <ptra
        spl     loop        ,   }1
        mov     {ptrc       ,   }ptrb
        mov.i   #1          ,   1
        end


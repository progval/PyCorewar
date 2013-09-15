;redcode-94
;name Modron
;author Robert Macrae
;assert 1

Modron  spl     #1469,  >-155         ; Mod 5 } attack
        add.x   -1,     1             ; and Mod 1 bomb.
        mov.i   }2,     -3109-2       ; Offet to miss myself.
        jmp     -2,     {-3           ; Gates if bombed.

        end


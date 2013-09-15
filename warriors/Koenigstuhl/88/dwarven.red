;redcode
;name Dwarven warrior
;author Net Mantis
;assert 1

         dat    # 0   ;bomb1
         dat    # 0   ;bomb2
dwarf    mov     -2,   5  ;lunch bomb ahead
         mov     -2,  -5  ;lunch bomb behind
         add    # 5,  -2  ;incriment ahead coordinates
         sub    # 5,  -2  ;decriment behind coordinates
         jmp    dwarf
         end    dwarf


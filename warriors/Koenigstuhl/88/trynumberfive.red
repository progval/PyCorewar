;redcode
;name Try Number Five
;Author James Burke
;Stragety Yet another try for a backwards running imp.
;assert 1
point      dat #8
num        dat #17
plc        dat #-15
start      add #1, point
           add #1, plc
           mov @point, @plc
           cmp num, point
           jmp start
           jmp -14
           dat #8
           dat #17
           dat #-15
           add #1, -3
           add #1, -2
           mov @-5, @-3
           cmp -5, -6
           jmp -4
           jmp -14
        end start

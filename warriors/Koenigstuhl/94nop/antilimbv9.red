;redcode-94lp
;name Anti-Limb v9
;author Ryan Coleman
;strategy hopefully beat limb rending incisors at it's own game
;assert 1

org start
;------antilimb--------
bomb   jmp.a #20,<2465
start  add.i bomb, -60
        mov.i boom, *-61
        add.ab #-1, $-1
        jmp.a start,<start
boom   dat.x <2465, }6   ;specialized bomb for current constants
;----------end antilimb--------

end

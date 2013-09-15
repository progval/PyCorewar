;redcode-nano
;name Bombus Ruderarius
;author S.Fernandes
;strategy scanner
;assert CORESIZE==80

        org     attack
step    equ     6
bomb    equ     loop-5

loop    add     #step       ,    eye
attack  jmz.f   loop        ,    <eye
eye     mov.i   *bomb       ,    10
        mov.i   *bomb       ,    <eye
        djn.f   attack      ,    {bomb
        end

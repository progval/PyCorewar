;redcode-nano
;name Bombus Sylvestris
;author S.Fernandes
;strategy oneshot
;assert CORESIZE==80

        org     loop+1
step    equ     5

bomb    mov.i   #1          ,    -1
loop    sub.ab  #-step      ,    #10
        jmz.f   loop        ,    @loop
attack  mov.i   {bomb       ,    >loop
        djn.f   attack      ,    {bomb
        end


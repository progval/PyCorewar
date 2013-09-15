;redcode-nano
;name Bombus Mesomelas
;author Neogryzor/FatalC
;strategy scanner
;assert CORESIZE==80

        org     attack
step    equ     6

loop    add.ab  #step       ,    #11
attack  jmz.f   loop        ,    <loop
        mov.i   <loop-2     ,    @loop
        jmz.f   attack      ,    loop-1

        mov.i   #1          ,    1
        end

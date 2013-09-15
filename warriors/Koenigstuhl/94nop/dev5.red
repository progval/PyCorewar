;redcode-94
;name Dev5
;author Roy van Rijn
; <roy_van_rijn@hotmail.com>
;strategy Silk replicator
;assert 1

start   spl     1,      <3000
        spl     1,      <1500
        mov     -1,     0

silk    spl.a   @0,     1210    ;Split (simple Silk)
        mov.i   }silk,  >silk   ;Copy it
        add.a   #112,   silk    ;Add some distance
        spl     attack, 0
        jmp.a   silk,   {silk   ;repeat the thing resetting pointer

attack  mov     2,      <-1      ;Do the attack! :)
        jmp     -1,     0


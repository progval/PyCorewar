;redcode-94nop
;name Dragonfly
;author S.Fernandes
;strategy oneshot
;assert 1

        org    loop
step    equ    230
gap     equ    6

ptr     dat    loop+step+gap ,  loop+step

        dat    0     ,  0

x       dat    1     ,  10
clr     spl    #2000 ,  15
        mov    *x    ,  >ptr
        mov    *x    ,  >ptr
        djn.f  clr+1 ,  }clr

        for    4
        dat    0     ,  0
        rof

loop    sne    *ptr  ,  @ptr
        add    inc   ,  ptr
        sne    *ptr  ,  @ptr
        add    inc   ,  {ptr+1
        jmn.b  loop  ,  }ptr+1
        djn.f  clr   ,  ptr
inc     dat    step  ,  step
        end

;redcode verbose
;name Trigger Cut v1.0
;author Joshua Houk
;strategy  Bombs galore, with two seperate addressing systems.
;assert 1
start mov b , @a
      add a , b
      mov @a , a
      mov d , @c
      add c , d
      mov @c , c
      jmp start
a     dat #7
b     dat #15
c     dat #5
d     dat #11
      end start

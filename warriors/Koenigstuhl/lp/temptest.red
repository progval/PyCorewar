;redcode-lp
;name Tempest
;author David Moore
;assert MAXPROCESSES==8
;strategy 4 process stone
;strategy 4 paper

boots equ -801
incr  equ 2946
time  equ 3980

p1    mov #6, #0
      mov <-1, <3
      jmn -1, @-2
      spl @-3, <2151
      jmz.b @0, 3039
      dat {1, <1

for 38
      dat 0,0
rof

stone add.f  2, 1
      mov  > 0+(2*time), 0-(incr*time)
      jmp   -2, <incr

start mov stone+2, {ptrs
      mov stone+1, {ptrs
      mov stone+0, {ptrs
      spl p1, {0
      spl p2, {0
ptrs  spl ptrs+boots+3, 0
      spl       * ptrs, 0
      spl       * ptrs, 0
      jmp       * ptrs, {ptrs

for 38
      dat 0,0
rof

p2    mov #6, #0
      mov <-1, <3
      jmn -1, @-2
      spl @-3, <2151
      jmz.b @0, 3359
      dat {1, <1

end start


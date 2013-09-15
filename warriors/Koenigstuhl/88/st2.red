;redcode
;name st2
;author Lukasz Grabun
;assert 1

step  equ     6728
hop   equ     -12
away  equ     -1000

stone spl     0         , 1
ptr   mov     bomb      , <hit+step
hit   mov     bomb      , @ptr 
      add     #step     , @hit
      djn     ptr       , <2500 
bomb  dat     <5334     , <hop+1

start mov     stone+5   , @boot
      mov     stone+4   , <boot
      mov     stone+3   , <boot
      mov     stone+2   , <boot
      mov     stone+1   , <boot
      mov     stone+0   , <boot
boot  jmp     @0        , <away

a     for (MAXLENGTH-CURLINE)/3
      spl     15-a      , 1
      spl     -a        , 1
      spl     -a*2      , 1
      rof
end   start

;redcode
;name Cereal Killer
;author Michal Janeczek
;strategy oneshot
;assert 1

      org   loop+1

s     equ   13
f     equ   ptr+MINDISTANCE+s+6

ptr   dat   f+s    , f

      for   4
      dat   0      , 0
      rof

wipe  dat   1      , 14
clear spl   #f     , 14
      mov   *wipe  , >ptr
      mov   *wipe  , >ptr
      djn.f -2     , }clear

      for   2*s-CURLINE-2
      dat   0      , 0
      rof

loop  sub.x a      , ptr
      sne.f *ptr   , @ptr
a     sub.f #-s    , -2*s
      jmz.f loop   , @ptr
      jmp   clear  , <ptr


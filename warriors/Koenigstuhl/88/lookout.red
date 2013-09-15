;redcode
;name Lookout
;author Wayne Sheppard
;assert 1 
  jmz 0,<3
  mov b,<2
  mov a,<1
  spl @0,-100
  add #4002,-1
  djn -4,#2
  dat #0
a mov -4,<-4
b jmp -1

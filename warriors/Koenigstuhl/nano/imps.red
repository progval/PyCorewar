;redcode-nano
;name IMPs
;strategy imps
;author Christian Schmidt
;assert 1

iAwa equ    40
train equ    -20

pGo  mov.i  imp,  *2
     spl    imp,   {55
     spl    iAwa,   {-20
     djn.a  #0,  <train
imp  mov.i  #-1,  1

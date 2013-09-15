;redcode
;name da mutant
;author Paul-V Khuong
;strategy: stone/scanner -> core-clear
;assert CORESIZE==8000
 
     step equ 3510
     dat.f 0,        1
loop:add.f inc,      bmb
bmb: mov.i {3+step,  <1-step
     jmz.f loop,     <bmb
     mov.a bmb,      sb1
inc: spl   #step,    1-step
clr: mov.i @bptr,    >bmb
     mov.i @bptr,    >bmb
bptr:djn.b clr,      {sb1
     dat.f -7,       10
     spl   #-8,      10
sb1: spl   #0,       9
     end bmb


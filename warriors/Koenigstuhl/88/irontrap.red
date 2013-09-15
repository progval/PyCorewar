;redcode
;name Iron Trap
;author Wayne Sheppard
;strategy CMPscanner with active imp destroyer
;assert 1 

dist    equ 98
scan    equ dist*2     
 
a add d,@x
c cmp a+dist,a
  slt #20,@x
  djn a,<7000
  mov j,@c
x mov s,<c
  sub n,@x
  cmp @c,imp       ;Check for imps
e jmn c,a
  mov s,<c         ;spiral-stun the imps
  add #2668,@-1    ;against 2667 imps
  djn -2,#100      ;for awhile
s spl 0,<1-dist    ;then standard coreclear/gate
  mov 2,<-3
j jmp -1
n dat <0-dist,<0-dist-1
d dat <scan,<scan
imp mov 0,2667

    end

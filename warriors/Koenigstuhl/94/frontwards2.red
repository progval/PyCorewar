;redcode-94 verbose
;name  Frontwards v2
;author  Steven Morrell
;strategy  One-shot/two-pass
;assert VERSION >= 80

step equ 12
offset equ 608  ;608
stream equ cc-1406   ;-806
first equ (cc-offset+202) ;203
gate equ -50

org boot

      stp #1,{1
for 17
      stp #1,}1
      stp.b #1,{1
      stp #1,{1
rof
      stp #1,}1

p     dat #first,{first+step
      dat #30,{-1
      dat #30,{-2
      stp.b #30,{-3
cc    spl 30,stream-660

;      stp #1,{1
;      stp #1,}1

boot  mov top+5,top+offset+5

for 5
      mov {boot,<boot
rof
boot2 mov cc,cc+offset
for 4
      mov {boot2,<boot2
rof

      jmp x+offset
      
      stp #1,{1
      mov {-1,<-1
      
;      stp.b #1,{1
      stp #1,{1
      stp #1,}1

      stp.b #1,{1
      stp #1,{1
      
top   sub x,@x
x     sne *p,@p
      djn.f top,<stream
      spl #0,<p
      mov @1,}p
      djn -1,<cc

for 6
      stp #1,}1
      stp.b #1,{1
      stp #1,{1
rof
      
end

;redcode
;name stargate variant
;assert 1
;author Beppe Bezzi, Paul-V Khuong

 org sb 

dp dat.f 0, 100
db dat.f -4,6 

sb spl #-5,   6 
   mov.i *bp, >dp
   djn.f -1,  <-11
   dat.f 0,0
bp dat.f sb, 0
   end

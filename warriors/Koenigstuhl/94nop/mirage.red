;redcode-94
;name Mirage 1.5
;author Anton Marsden
;strategy 2/3 C scanner/bomber with a twist
;assert CORESIZE==8000
 
ORG s
 
step EQU 3039
gate EQU (data+1)
 
data: spl.a  #0,$step
      dat.f  $0,$btm-gate+2
      dat.f  $0,$0
pos:  add.ab #step,#2*step
kill: mov.i  $bomb,>data
s:    jmz.f  @0,@pos
c:    slt.b  $pos,#btm-data+2
      mov.b  $pos,$data
      jmn.b  @0,$pos
 
bomb: spl.a  #0,$0
      mov.i  $clr,>gate
      djn.b  $-1,{gate
clr:  dat.f  <2*2667,<2667
btm:  dat.f  $0,$0

END



;redcode-94
;name There may still be ...
;There may still be some bugs in this.
;author Anton Marsden
;It's also kinda complicated. Key lines are chg and dec
;assert 1
ORG s
step EQU 3039
gate:
data: spl.a  #0,$step+pos
pos:  add.ab #step,#2*step
kill: mov.i  $bomb,>data
s:    jmz.f  @0,@pos
ck:  slt.b  $pos,#btm-gate+1
chg:  mov.i  @s,@kill
j:    jmn.b  $pos,$pos
      mov.f  $inc,>j
dec:  djn.f  <chg,{chg
inc:  dat.f  $381,$btm-gate+1
bomb: spl.a  #0,$0
btm:  dat.f  $0,$0
END

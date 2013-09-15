;redcode-b
;name ga_24
;author jason
;strategy evolved by ga_war.c 1000 cycles 100 population
;assert CORESIZE == 8000
;65 Wilkies (CCB)
seq.x  {  4,{  4
spl.ba # -2,* -3
mov.i  { -1,< -4
djn.i  *  1,>  3
jmn.f  #  0,{ -3
dat.x  <  2,$  4
nop.ba $  2,@  3
dat.f  > -3,< -3
jmn.a  > -2,<  0
jmp.x  $  4,{  2
end

;redcode-94x verbose
;name  Kill Imps!!!
;author  Steven Morrell
;strategy  Kill Imps!!!
;assert CORESIZE==8000
step equ -13
flag equ loop-1
d3 equ flag-1001

loop      add.i  d2,p                             ;search for enemy
p         cmp.i  loop+step+step,loop+step
          slt.ab #30,p                            ;miss self
          djn.i  loop,>100
          jmz.b  stun,@p                          ;don't trap zero B-values
          mov.b  p,p2                             ;pointer copy p to p2
          add.ab #p-p2,p2
          slt.ab #-13,@p                          ;don't trap djn streams
p2        cmp.i  @p2,@0                           ;check for imps
cp        jmp.i  stun,0
          mov.ab #100,count                       ;trap imps
          mov.i  @p,d3
trap      mov.i  split,@p2
          add.b  d3,p2
count     djn.ab trap,#100
stun      mov.i  jump,@p                          ;stun everything else
          mov.i  split,<p
          add.i  d1,p
          jmz.b  p,flag                           ;keep searching
split     spl.i  #split,>step+1                   ;or clear core, imp-gate.
          mov.i  d1,<cp
jump      jmp.i  -1,>step-1
d2        dat.i  >step+step,>step+step
d1        dat.i  >step,>step+1

end p

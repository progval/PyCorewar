;redcode
;name v
;author Jason R. Smith
; <jasmit18@vt.edu>
;assert 1

mul.f  #   -1 , >   -2
spl.ba #    4 , *   -2
djn.ba #   -5 , #    0
nop.f  }   -4 , *    1
jmp.i  @    3 , #    0
seq.ba @    4 , $   -6
mov.b  >   -2 , #    1
mod.b  <    8 , }    0
jmp.f  <   -3 , @   -3
jmn.ba *    4 , @   -4
nop.ba >   -4 , {    2
sne.ab *    2 , >    8
djn.b  $    4 , {   -1
div.b  <   -5 , {    1
dat.ab >   -1 , {    2
mod.a  @    0 , >   -2



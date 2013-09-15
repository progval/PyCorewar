;redcode-94
;assert 1
;author R.Daneel
; <r.daneel@mailbox.hu>
;name Evolver 44850514x500
;strategy created with YACE - yet another corewar evolver
;strategy http://www.fhs-hagenberg.ac.at/students/se/se00001/
mov.a  @    791, <    798
spl.a  #    265, #     15
mov.i  <    266, >    799
djn.i  $    799, >    798
mod.f  *    794, {     13
jmz.f  *    794, {     13
sub.f  <    787, <      8
div.a  >    786, }    787
sne.f  }    383, *    781
sub.ab {      7, #    388
sne.b  {      1, >     12
jmz.x  *    786, >      5
dat.a  {      2, *     17
djn.i  >    199, {    286
djn.i  #      6, #    182
slt.i  #    413, <    400
nop.i  {     20, >     16
slt.i  {    189, >    253
end 0

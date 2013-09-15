;redcode-94
;assert 1
;author Martin Ankerl
;<martinankerl@web.de>
;name Evolver 520x200
;strategy created with YACE - yet another corewar evolver
;strategy http://martinus.awhs.at
;assert CORESIZE==800
slt.b  >     17, <    385
slt.b  >     17, {    208
spl.x  }    790, {    264
djn.f  <      4, >    409
nop.ba }    781, }     14
mov.i  $    792, $    798
mov.i  *    795, >    798
jmz.i  #    200, >    798
djn.f  $    798, @    783
djn.x  $    798, <    392
djn.a  $    798, <    392
djn.f  $    798, }    392
djn.f  {    798, <    279
end 0

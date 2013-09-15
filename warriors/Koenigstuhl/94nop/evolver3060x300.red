;redcode-94
;assert 1
;author Martin Ankerl <martinankerl@web.de>
;name Evolver 3060x300
spl.b  #    3, @  246
mov.i  > 4010, >   -1
djn.b  $   -1, >   -2
cmp.ba $ 1995, # 2001
spl.a  *  142, @    6
mod.f  $ 2675, $    1
div.b  * 1992, <    3
nop.a  {   -2, >    9
dat.x  $ 2010, < 3994
sub.x  @ 3998, @ 1992
slt.f  <    9, { 2671
cmp.f  *  674, >    6
add.f  *    5, $ 4005
div.x  <   10, $    8
add.a  > 2010, {    1
sub.f  $ 2566, <    3
spl.b  *    8, $ 2673
mov.a  < 5887, <    8
spl.ba @ 4008, $ 3998
div.a  < 2688, * 3197
jmp.ba <    6, # 2001
mod.ab @ 3215, { 5631
add.a  # 5932, $ 1995
mul.f  $ 2000, # 2660
jmp.x  * 4002, $    5
spl.a  $   -2, {   -1
div.ba @ 3110, * 1448
jmp.b  # 6130, @ 1998
jmz.ba {   10, >   -8
mov.i  < 5748, < 3992
sne.i  @    9, $ 5060
sne.a  #   -6, > 7518
end
;0

;redcode-94
;name Core Sweep
;author Franz
;strategy Sweep the Core
;assert 1

gate equ ccs-3

       org sweep

bait   dat 99,99

for 20
       dat 0,0
rof

ccs    dat 0,0

for 4
       dat 0,0
rof

p1     dat s1-ccs,200
p2     dat s1-ccs,(CORESIZE/2)-100

for 20
       dat 0,0
rof

d1     dat >d1-ccs,>s2+10-ccs
s1     spl #s2-ccs,s2+50-ccs
sweep  sne.x >p1,>p2
       seq.x >p1,>p2
       jmp kill
       sne.x >p1,>p2
       seq.x >p1,>p2
kill   mov.i p1,ccs
       jmz.f sweep,ccs
       jmz.f 2,<p2
       mov.i p2,ccs
s2     spl #d1-ccs,s2+30-ccs
       mov.i *ccs,>ccs
       mov.i *ccs,>ccs
       jmp -1,>gate

       end


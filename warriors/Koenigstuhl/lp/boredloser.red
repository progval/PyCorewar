;redcode
;name bored loser
;author bjoern guenzel
;strategy kill, kill, kill
;strategy written for Beppe's tournament '96, round 5
;assert 1

spec88  equ (MAXCYCLES==80001)
spec94  equ (MAXCYCLES!=80001)


step    equ (4*23)
bdist   equ (-3000)


for spec88
ptr     mov bomb,@hit+2*step
        add #2*step+1,ptr
hit     mov bomb,<ptr
        jmz @-1,#0
        jmp clear
bomb    dat <1,#step

rof

for spec94

ptr     mov.i bomb,*hit+2*step
        add.ab #2*step+1,ptr
hit     mov.i *ptr,<ptr
        jmz.b *-1,#0
        jmp clear
bomb    dat #step,>1

rof

for spec88
gate    equ (clear-3)
clbomb  dat <gate-clear-1,#0
clear   spl 0,<gate             
        mov clbomb,<clbomb
last    djn -1,<gate-2667
rof


for spec94
gate    equ (clear-2)
clbomb  dat >2667,6
clear   spl #0,>gate+2667
        mov.i clbomb,>gate

for MAXPROCESSES!=8
last    djn.f -1,>gate
rof

for MAXPROCESSES==8
last    jmp -1,>gate+2667
rof     
rof

boot z  for 4
        mov <csource,<cboot
        rof
        for 6
        mov <stsource,<stboot
        rof
stboot  spl @0,bdist
        mov 0,-1
        mov #0,1
cboot   dat #0,#bdist+step-4
csource dat #0,#last+1
stsource dat #0,#bomb+1

        end boot

;redcode-94
;name myVamp5.4
;author Paulsson
;strategy 5.0, Chasing SteppingStone
;strategy 5.1, Spl/Spl/Dat CoreClear
;strategy 5.2 small changes, + some points...
;strategy 5.3&4 Decoy, small changes
;strategy July, 1996
;for Planar, vamp,scan,coreclear,decoy(?)
;assert 1

st              equ             912
org decoy
trap            jmp     pit,#0
                dat.f   0,0
                dat.f   0,0
                dat.f   0,0
                dat.f   0,0
                dat.f   0,0
                dat.f   0,0
                dat.f   0,0
fang            jmp     *trap+st,-st    ;hit
check           dat.f   0,0
                dat.f   0,0
ptr             dat.f   0,100
                dat.f   -20,0
                dat.f   0,0
                jmp     cclear
next            add.f   step,fang
start           mov.i   @0,>fang                ;scan
                jmz.a   next,*fang
                mov.i   <check,*fang
stop            jmn.b   next,>check
step            spl     #st,-st-1
cclear          mov.i   bmb,>ptr
                djn.f   cclear,>ptr
                dat.f   0,0
                dat.f   0,0                             ;hit
                dat.f   0,0
                dat.f   0,0
                dat.f   0,0
                dat.f   0,0
                dat.f   0,18
bmb             dat.f   0,18

for 32
                dat.f   0,0
rof

ptr2            dat.f   0,20
                dat.f   0,20            ;hit
                dat.f   -10,20
                dat.f   -10,20
cclear2         spl     #4000,20
                mov.i   @2,>ptr2
                mov.i   @1,>ptr2
                djn.b   -2,{cclear2
                dat.f   0,0
                dat.f   0,0
stop2           jmp     cclear2-stop,stop

offsA           equ    (start-4000)
offsB           equ    (start-2005)
stepD           equ    127

decoy           mov    <offsA+decoy*stepD,{offsB+decoy*stepD
                mov    <offsA+decoy*stepD,{offsB+decoy*stepD
                mov    <offsA+decoy*stepD,{offsB+decoy*stepD
                mov    <offsA+decoy*stepD,{offsB+decoy*stepD
                mov    <offsA+decoy*stepD,{offsB+decoy*stepD
                mov    <offsA+decoy*stepD,{offsB+decoy*stepD
                mov    <offsA+decoy*stepD,{offsB+decoy*stepD
                mov    <offsA+decoy*stepD,{offsB+decoy*stepD
                jmp     start

pit             mov.i   stop2,@stop2
                spl     #0,0
for 10
                spl     #0,0
rof

                end

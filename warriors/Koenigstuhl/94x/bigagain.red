;redcode-94x
;name Big again
;author Jay Han
;assert CORESIZE==55440
;macro

; Apparently, James' Ivy is not ready yet.
; However, his new BigImps is quite strong!

                org     start

p1              equ     27739
s1              equ     34
p2              equ     27705
s2              equ     -34

gate            equ     inc+s2

loop            add.f   inc,            cast
stone           spl.b   loop,           <gate
cast            mov.i   <p1,            p2
buckle          djn.f   stone,          <gate
patch           djn.b   inc-stone,      <gate-stone
stop            dat.f   <gate-buckle,   #1
inc             spl.b   #s1,            <s2
clear           mov.i   plug,           <patch+1
plug            dat.f   <gate,          <gate+1

for 15
                dat.f   0,              0
rof

fool            equ     55440/153
m for 76
                dat.f   fool*m,         -fool*m
rof

for 15
                dat.f   0,              0
rof
split           spl.b   #0,             <-19
wimp            djn.f   #0,             <-20
start           spl.b   stone,          <bound+trash
newimp          mov.i   wimp,           cast+27722
                mov.i   split,          <newimp
                spl.b   @newimp,        <bound+2*trash

; makeimp v2: Automatic imp-spiral generator by Jay Han, 5/6/1994.
; 38-process 19-point spiral (size 55440, '94) (trashing)
step            equ     29179
launch
                spl     lbl3,           <bound+3*trash
                spl     lbl5,           <bound+4*trash
                spl     lbl9,           <bound+5*trash
                spl     lbl17,          <bound+6*trash
                spl     lbl33,          <bound+7*trash
                spl     lbl65,          <bound+8*trash
                jmp     imp+0*step+0,   <bound+9*trash
lbl65           jmp     imp+1*step+0,   <bound+10*trash
lbl33           spl     lbl67,          <bound+11*trash
                jmp     imp+2*step+0,   <bound+12*trash
lbl67           jmp     imp+3*step+0,   <bound+13*trash
lbl17           spl     lbl35,          <bound+14*trash
                spl     lbl69,          <bound+15*trash
                jmp     imp+4*step+0,   <bound+16*trash
lbl69           jmp     imp+5*step+0,   <bound+17*trash
lbl35           spl     lbl71,          <bound+18*trash
                jmp     imp+6*step+0,   <bound+19*trash
lbl71           jmp     imp+7*step+0,   <bound+20*trash
lbl9            spl     lbl19,          <bound+21*trash
                spl     lbl37,          <bound+22*trash
                spl     lbl73,          <bound+23*trash
                jmp     imp+8*step+0,   <bound+24*trash
lbl73           jmp     imp+9*step+0,   <bound+25*trash
lbl37           spl     lbl75,          <bound+26*trash
                jmp     imp+10*step+0,  <bound+27*trash
lbl75           jmp     imp+11*step+0,  <bound+28*trash
lbl19           spl     lbl39,          <bound+29*trash
                spl     lbl77,          <bound+30*trash
                jmp     imp+12*step+0,  <bound+31*trash
lbl77           jmp     imp+13*step+0,  <bound+32*trash
lbl39           spl     lbl79,          <bound+33*trash
                jmp     imp+14*step+0,  <bound+34*trash
lbl79           jmp     imp+15*step+0,  <bound+35*trash
lbl5            spl     lbl11,          <bound+36*trash
                spl     lbl21,          <bound+37*trash
                spl     lbl41,          <bound+38*trash
                spl     lbl81,          <bound+39*trash
                jmp     imp+16*step+0,  <bound+40*trash
lbl81           jmp     imp+17*step+0,  <bound+41*trash
lbl41           spl     lbl83,          <bound+42*trash
                jmp     imp+18*step+0,  <bound+43*trash
lbl83           jmp     imp+0*step+1,   <bound+44*trash
lbl21           spl     lbl43,          <bound+45*trash
                spl     lbl85,          <bound+46*trash
                jmp     imp+1*step+1,   <bound+47*trash
lbl85           jmp     imp+2*step+1,   <bound+48*trash
lbl43           spl     lbl87,          <bound+49*trash
                jmp     imp+3*step+1,   <bound+50*trash
lbl87           jmp     imp+4*step+1,   <bound+51*trash
lbl11           spl     lbl23,          <bound+52*trash
                spl     lbl45,          <bound+53*trash
                spl     lbl89,          <bound+54*trash
                jmp     imp+5*step+1,   <bound+55*trash
lbl89           jmp     imp+6*step+1,   <bound+56*trash
lbl45           spl     lbl91,          <bound+57*trash
                jmp     imp+7*step+1,   <bound+58*trash
lbl91           jmp     imp+8*step+1,   <bound+59*trash
lbl23           spl     lbl47,          <bound+60*trash
                spl     lbl93,          <bound+61*trash
                jmp     imp+9*step+1,   <bound+62*trash
lbl93           jmp     imp+10*step+1,  <bound+63*trash
lbl47           spl     lbl95,          <bound+64*trash
                jmp     imp+11*step+1,  <bound+65*trash
lbl95           jmp     imp+12*step+1,  <bound+66*trash
lbl3            mov     <bound+trash*67, <bound+68*trash ; Idle
                mov     <bound+trash*69, <bound+70*trash ; Idle
                spl     lbl25,          <bound+71*trash
                spl     lbl49,          <bound+72*trash
                spl     lbl97,          <bound+73*trash
                jmp     imp+13*step+1,  <bound+74*trash
lbl97           jmp     imp+14*step+1,  <bound+75*trash
lbl49           spl     lbl99,          <bound+76*trash
                jmp     imp+15*step+1,  <bound+77*trash
lbl99           jmp     imp+16*step+1,  <bound+78*trash
lbl25           mov     <bound+trash*79, <bound+80*trash ; Idle
                spl     lbl101,         <bound+81*trash
                jmp     imp+17*step+1,  <bound+82*trash
lbl101          jmp     imp+18*step+1,  <bound+83*trash
imp             mov.i   #0,             step
trash           equ     652
bound           equ     imp+200

                end

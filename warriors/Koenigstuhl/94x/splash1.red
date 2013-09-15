;redcode-94x
;name Splash 1
;author Jay Han
;strategy Stone/Spiral with 2-pass core-clear
;assert CORESIZE==55440
;macro
                org     entry

p1              equ     27739
s1              equ     34
p2              equ     27705
s2              equ     -34

gate            equ     inc+s2-4
gate2           equ     inc+s2
offset          equ     top-19

top             dat.f   0,              patch+1
loop            add.f   inc,            cast
stone           spl.b   loop,           <gate
cast            mov.i   <p1,            p2
buckle          djn.f   stone,          <gate
stunner         spl.b   #0,             #bomb-ammo
stop            dat.f   <gate-buckle,   #1
inc             spl.b   #s1,            <s2
kill            mov.i   @ammo,          <patch+1
bomb            dat.f   <gate2,         #stop-ammo
patch           djn.f   inc-stone,      <gate-stone
ammo            dat.f   0,              stunner

for 15
                dat.f   0,              0
rof

fool            equ     55440/177
m for 88
                dat.f   fool*m,         -fool*m
rof

split           spl.b   #0,             <-19
wimp            djn.f   #0,             <-20
entry           spl.b   stone,          <trash
newimp          mov.i   wimp,           offset
                mov.i   split,          <newimp
                spl.b   @newimp,        <trash*2

; 38-process 19-point spiral (coresize 55440, '94 standard) (trashing)
step            equ     29179
launch
                spl     lbl3,           <3*trash
                spl     lbl5,           <4*trash
                spl     lbl9,           <5*trash
                spl     lbl17,          <6*trash
                spl     lbl33,          <7*trash
                spl     lbl65,          <8*trash
                jmp     imp+0*step+0,   <9*trash
lbl65           jmp     imp+1*step+0,   <10*trash
lbl33           spl     lbl67,          <11*trash
                jmp     imp+2*step+0,   <12*trash
lbl67           jmp     imp+3*step+0,   <13*trash
lbl17           spl     lbl35,          <14*trash
                spl     lbl69,          <15*trash
                jmp     imp+4*step+0,   <16*trash
lbl69           jmp     imp+5*step+0,   <17*trash
lbl35           spl     lbl71,          <18*trash
                jmp     imp+6*step+0,   <19*trash
lbl71           jmp     imp+7*step+0,   <20*trash
lbl9            spl     lbl19,          <21*trash
                spl     lbl37,          <22*trash
                spl     lbl73,          <23*trash
                jmp     imp+8*step+0,   <24*trash
lbl73           jmp     imp+9*step+0,   <25*trash
lbl37           spl     lbl75,          <26*trash
                jmp     imp+10*step+0,  <27*trash
lbl75           jmp     imp+11*step+0,  <28*trash
lbl19           spl     lbl39,          <29*trash
                spl     lbl77,          <30*trash
                jmp     imp+12*step+0,  <31*trash
lbl77           jmp     imp+13*step+0,  <32*trash
lbl39           spl     lbl79,          <33*trash
                jmp     imp+14*step+0,  <34*trash
lbl79           jmp     imp+15*step+0,  <35*trash
lbl5            spl     lbl11,          <36*trash
                spl     lbl21,          <37*trash
                spl     lbl41,          <38*trash
                spl     lbl81,          <39*trash
                jmp     imp+16*step+0,  <40*trash
lbl81           jmp     imp+17*step+0,  <41*trash
lbl41           spl     lbl83,          <42*trash
                jmp     imp+18*step+0,  <43*trash
lbl83           jmp     imp+0*step+1,   <44*trash
lbl21           spl     lbl43,          <45*trash
                spl     lbl85,          <46*trash
                jmp     imp+1*step+1,   <47*trash
lbl85           jmp     imp+2*step+1,   <48*trash
lbl43           spl     lbl87,          <49*trash
                jmp     imp+3*step+1,   <50*trash
lbl87           jmp     imp+4*step+1,   <51*trash
lbl11           spl     lbl23,          <52*trash
                spl     lbl45,          <53*trash
                spl     lbl89,          <54*trash
                jmp     imp+5*step+1,   <55*trash
lbl89           jmp     imp+6*step+1,   <56*trash
lbl45           spl     lbl91,          <57*trash
                jmp     imp+7*step+1,   <58*trash
lbl91           jmp     imp+8*step+1,   <59*trash
lbl23           spl     lbl47,          <60*trash
                spl     lbl93,          <61*trash
                jmp     imp+9*step+1,   <62*trash
lbl93           jmp     imp+10*step+1,  <63*trash
lbl47           spl     lbl95,          <64*trash
                jmp     imp+11*step+1,  <65*trash
lbl95           jmp     imp+12*step+1,  <66*trash
lbl3            mov.i   bomb,           67*trash        ; Idle
                mov.i   bomb,           68*trash        ; Idle
                spl     lbl25,          <69*trash
                spl     lbl49,          <70*trash
                spl     lbl97,          <71*trash
                jmp     imp+13*step+1,  <72*trash
lbl97           jmp     imp+14*step+1,  <73*trash
lbl49           spl     lbl99,          <74*trash
                jmp     imp+15*step+1,  <75*trash
lbl99           jmp     imp+16*step+1,  <76*trash
lbl25           mov.i   bomb,           77*trash        ; Idle
                spl     lbl101,         <78*trash
                jmp     imp+17*step+1,  <79*trash
lbl101          jmp     imp+18*step+1,  <80*trash
imp             mov.i   #0,             step
trash           equ     684

                end


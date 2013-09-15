;redcode-94x
;name Sissy
;author Jay Han
;strategy SiSSy: Scan-Stone-Spiral, and a wimp
;strategy Fast Scanner/Vampire like Scanalyzer-W
;strategy Stone/Spiral/Wimp like Twimpede
;assert CORESIZE==55440
;macro
                org     scan

start           equ     scan-200
step            equ     -50

loop            add.f   pit,            scan
scan            sne.i   start+step,     start
count           djn.b   loop,           #548
                jmz.b   phase,          count
                mov.i   fang,           @scan
                sub.ba  scan,           @scan
                add.f   half,           scan
                jmp.b   scan,           <count
fang            jmp.b   pit-scan,       <-1
half            dat.f   step,           step

for 15
                dat.f   0,              0
rof

p1              equ     27739
s1              equ     34
p2              equ     27705
s2              equ     -34

gate            equ     inc+s2

adder           add.f   inc,            cast
stone           spl.b   adder,          <gate
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

pit             spl.b   #step*2,        <step*2
                jmp.b   -1,             <scan-3

fool            equ     55440/149
m for 74
                dat.f   fool*m,         -fool*m
rof

for 15
                dat.f   0,              0
rof

split           spl.b   #0,             <-19
wimp            djn.f   #0,             <-20
phase           spl.b   stone,          <trash
newimp          mov.i   wimp,           cast+27722
                mov.i   split,          <newimp
                spl.b   @newimp,        <trash*2

; 26-process 13-point spiral (coresize 55440, '94 standard) (trashing)
t               equ     34117
launch
                spl     lbl3,           <3*trash
                spl     lbl5,           <4*trash
                spl     lbl9,           <5*trash
                spl     lbl17,          <6*trash
                spl     lbl33,          <7*trash
                jmp     imp+0*t+0,      <8*trash
lbl33           jmp     imp+1*t+0,      <9*trash
lbl17           spl     lbl35,          <10*trash
                jmp     imp+2*t+0,      <11*trash
lbl35           jmp     imp+3*t+0,      <12*trash
lbl9            spl     lbl19,          <13*trash
                spl     lbl37,          <14*trash
                jmp     imp+4*t+0,      <15*trash
lbl37           jmp     imp+5*t+0,      <16*trash
lbl19           spl     lbl39,          <17*trash
                jmp     imp+6*t+0,      <18*trash
lbl39           jmp     imp+7*t+0,      <19*trash
lbl5            spl     lbl11,          <20*trash
                spl     lbl21,          <21*trash
                spl     lbl41,          <22*trash
                jmp     imp+8*t+0,      <23*trash
lbl41           jmp     imp+9*t+0,      <24*trash
lbl21           spl     lbl43,          <25*trash
                jmp     imp+10*t+0,     <26*trash
lbl43           jmp     imp+11*t+0,     <27*trash
lbl11           spl     lbl23,          <28*trash
                spl     lbl45,          <29*trash
                jmp     imp+12*t+0,     <30*trash
lbl45           jmp     imp+0*t+1,      <31*trash
lbl23           spl     lbl47,          <32*trash
                jmp     imp+1*t+1,      <33*trash
lbl47           jmp     imp+2*t+1,      <34*trash
lbl3            spl     lbl7,           <35*trash
                spl     lbl13,          <36*trash
                spl     lbl25,          <37*trash
                spl     lbl49,          <38*trash
                jmp     imp+3*t+1,      <39*trash
lbl49           jmp     imp+4*t+1,      <40*trash
lbl25           spl     lbl51,          <41*trash
                jmp     imp+5*t+1,      <42*trash
lbl51           jmp     imp+6*t+1,      <43*trash
lbl13           spl     lbl27,          <44*trash
                spl     lbl53,          <45*trash
                jmp     imp+7*t+1,      <46*trash
lbl53           jmp     imp+8*t+1,      <47*trash
lbl27           spl     lbl55,          <48*trash
                jmp     imp+9*t+1,      <49*trash
lbl55           jmp     imp+10*t+1,     <50*trash
lbl7            mov.i   bomb,           51*trash        ; Idle
                mov.i   bomb,           52*trash        ; Idle
                spl     lbl57,          <53*trash
                jmp     imp+11*t+1,     <54*trash
lbl57           jmp     imp+12*t+1,     <55*trash
imp             mov.i   #0,             t
trash           equ     990
bomb            equ     half

                end


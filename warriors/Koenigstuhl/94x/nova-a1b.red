;redcode-94x
;name Nova-A.1b
;author Jay "Thierry" Han
;strategy Fast Vampire + Imp-spiral
;assert CORESIZE==55440
;macro

                org     start

init            equ     40+3*step
step            equ     52

gate            equ     source-step

source          spl.b   #0,             <gate
p               djn.b   split,          #234
                mov.a   #clear-cplug,   cplug
                mov.a   #clear-aplug,   aplug
inc
clear           spl.b   #step,          <-step
                mov.i   bomb,           <p
bomb            dat.f   <gate,          <gate+1
                dat.f   0,              0
adder           add.x   inc,            fang
aplug           djn.b   adder,          <gate
                dat.f   0,              0
                dat.f   0,              0
split           spl.b   adder,          <gate
caster          mov.i   fang,           @fang
cplug           djn.b   caster,         <gate

fang            jmp.b   pit-init,       init

pit             spl.b   #0,             <gate-1
                jmp.b   -1,             <gate-1

for 15
                dat.f   0,              0
rof

fool            equ     55440/145
m for 72
                dat.f   fool*m,         -fool*m
rof

for 15
                dat.f   0,              0
rof

start           spl.b   source,         <trash

;Imp
; 38-process 19-point spiral (coresize 55440, '94 standard)
t       equ     29179
launch
        spl     lbl3,   <2*trash
        spl     lbl5,   <3*trash
        spl     lbl9,   <4*trash
        spl     lbl17,  <5*trash
        spl     lbl33,  <6*trash
        spl     lbl65,  <7*trash
        jmp     imp+0*t+0,      <8*trash
lbl65   jmp     imp+1*t+0,      <9*trash
lbl33   spl     lbl67,  <10*trash
        jmp     imp+2*t+0,      <11*trash
lbl67   jmp     imp+3*t+0,      <12*trash
lbl17   spl     lbl35,  <13*trash
        spl     lbl69,  <14*trash
        jmp     imp+4*t+0,      <15*trash
lbl69   jmp     imp+5*t+0,      <16*trash
lbl35   spl     lbl71,  <17*trash
        jmp     imp+6*t+0,      <18*trash
lbl71   jmp     imp+7*t+0,      <19*trash
lbl9    spl     lbl19,  <20*trash
        spl     lbl37,  <21*trash
        spl     lbl73,  <22*trash
        jmp     imp+8*t+0,      <23*trash
lbl73   jmp     imp+9*t+0,      <24*trash
lbl37   spl     lbl75,  <25*trash
        jmp     imp+10*t+0,     <26*trash
lbl75   jmp     imp+11*t+0,     <27*trash
lbl19   spl     lbl39,  <28*trash
        spl     lbl77,  <29*trash
        jmp     imp+12*t+0,     <30*trash
lbl77   jmp     imp+13*t+0,     <31*trash
lbl39   spl     lbl79,  <32*trash
        jmp     imp+14*t+0,     <33*trash
lbl79   jmp     imp+15*t+0,     <34*trash
lbl5    spl     lbl11,  <35*trash
        spl     lbl21,  <36*trash
        spl     lbl41,  <37*trash
        spl     lbl81,  <38*trash
        jmp     imp+16*t+0,     <39*trash
lbl81   jmp     imp+17*t+0,     <40*trash
lbl41   spl     lbl83,  <41*trash
        jmp     imp+18*t+0,     <42*trash
lbl83   jmp     imp+0*t+1,      <43*trash
lbl21   spl     lbl43,  <44*trash
        spl     lbl85,  <45*trash
        jmp     imp+1*t+1,      <46*trash
lbl85   jmp     imp+2*t+1,      <47*trash
lbl43   spl     lbl87,  <48*trash
        jmp     imp+3*t+1,      <49*trash
lbl87   jmp     imp+4*t+1,      <50*trash
lbl11   spl     lbl23,  <51*trash
        spl     lbl45,  <52*trash
        spl     lbl89,  <53*trash
        jmp     imp+5*t+1,      <54*trash
lbl89   jmp     imp+6*t+1,      <55*trash
lbl45   spl     lbl91,  <56*trash
        jmp     imp+7*t+1,      <57*trash
lbl91   jmp     imp+8*t+1,      <58*trash
lbl23   spl     lbl47,  <59*trash
        spl     lbl93,  <60*trash
        jmp     imp+9*t+1,      <61*trash
lbl93   jmp     imp+10*t+1,     <62*trash
lbl47   spl     lbl95,  <63*trash
        jmp     imp+11*t+1,     <64*trash
lbl95   jmp     imp+12*t+1,     <65*trash
lbl3            mov.i   bomb,   66*trash        ; Idle
        mov.i   bomb,   67*trash        ; Idle
        spl     lbl25,  <68*trash
        spl     lbl49,  <69*trash
        spl     lbl97,  <70*trash
        jmp     imp+13*t+1,     <71*trash
lbl97   jmp     imp+14*t+1,     <72*trash
lbl49   spl     lbl99,  <73*trash
        jmp     imp+15*t+1,     <74*trash
lbl99   jmp     imp+16*t+1,     <75*trash
lbl25   mov.i   bomb,   76*trash        ; Idle
        spl     lbl101, <77*trash
        jmp     imp+17*t+1,     <78*trash
lbl101  jmp     imp+18*t+1,     <79*trash
imp     mov.i   #0,     t
trash   equ     693

                end


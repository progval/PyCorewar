;redcode-94
;name Small
;author Jay Han
;contact jayhan@cs.washington.edu
;macro
;assert 1

p1              equ     -2391
s1              equ     74
p2              equ     2395
s2              equ     -74

fool            equ     CORESIZE/55
m for 27
                dat.f   m*fool,         -m*fool
rof

for 15
                dat.f   0,              0
rof

gate            equ     inc+s2-2
gate2           equ     inc+s2

loop            add.f   inc,            cast
stone           spl.b   loop,           <gate
cast            mov.i   <p1,            p2
buckle          djn.f   stone,          <gate
inc             spl.b   #s1,            <s2
clear           mov.i   plug,           <buckle+1
plug            dat.f   <gate2,         <gate2+1
patch           jmp.b   inc-stone,      #1

for 15
                dat.f   0,              0
rof

split           spl.b   #0,             <-19
wimp            djn.f   #0,             <-20
start           spl.b   stone,          <trash
newimp          mov.i   wimp,           cast+4002
                mov.i   split,          <newimp
                spl.b   @newimp,        <trash*2

step            equ     1143
launch
                spl     lbl3,           <3*trash
                spl     lbl5,           <4*trash
                spl     lbl9,           <5*trash
                spl     lbl17,          <6*trash
                jmp     imp+0*step+0,   <7*trash
lbl17           jmp     imp+1*step+0,   <8*trash
lbl9            spl     lbl19,          <9*trash
                jmp     imp+2*step+0,   <10*trash
lbl19           jmp     imp+3*step+0,   <11*trash
lbl5            spl     lbl11,          <12*trash
                spl     lbl21,          <13*trash
                jmp     imp+4*step+0,   <14*trash
lbl21           jmp     imp+5*step+0,   <15*trash
lbl11           spl     lbl23,          <16*trash
                jmp     imp+6*step+0,   <17*trash
lbl23           jmp     imp+0*step+1,   <18*trash
lbl3            spl     lbl7,           <19*trash
                spl     lbl13,          <20*trash
                spl     lbl25,          <21*trash
                jmp     imp+1*step+1,   <22*trash
lbl25           jmp     imp+2*step+1,   <23*trash
lbl13           spl     lbl27,          <24*trash
                jmp     imp+3*step+1,   <25*trash
lbl27           jmp     imp+4*step+1,   <26*trash
lbl7            mov.i   bomb,           27*trash
                spl     lbl29,          <28*trash
                jmp     imp+5*step+1,   <29*trash
lbl29           jmp     imp+6*step+1,   <30*trash
imp             mov.i   #0,             step
trash           equ     258
bomb            equ     plug

                end     start

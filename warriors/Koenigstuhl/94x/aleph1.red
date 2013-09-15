;redcode-94x
;name Aleph 1
;author Jay Han
;assert CORESIZE==55440
;macro

; James currently has two programs on the Hill, ivscan6 and BigImps.
; Although my "greek letters" series clobber BigImps big time,
; they're hopeless against ivscan6.  The quickscan doesn't detect
; ivscan often enough, so the stone is activated, and I'm toast.

; This is basically another stone/spiral/wimp, like Variation, but:
; - the stone ends with a 2-pass core-clear then gate
; - the spiral's head is booted off the launch code
; - there's empty space between the stone and spiral

; The 2-pass core-clear seems fatal to ivscan6, because it's a paper.

; This beats ivscan6 50/10/40 and BigImps 30/10/60.
; It also beats all the warriors on the Hill, except Pyramid.
; I give away too many ties to be #1, though (i.e. I win with scores
; like 20/10/70 or 30/20/50).  But that's OK for a one-on-one fight.

                org     entry

for 15
                dat.f   0,              0
rof

p1              equ     8751
s1              equ     17498
p2              equ     46693
s2              equ     -17498

gate            equ     inc-28
offset          equ     inc-18

inc             dat.f   s1,             s2
top             dat.f   0,              patch+1
loop            add.f   inc,            cast
stone           spl.b   loop,           <gate
cast            mov.i   <p1,            p2
buckle          djn.f   stone,          <gate
stunner         spl.b   #0,             #bomb-ammo
stop            dat.f   <gate-buckle,   #1
clear           spl.b   #0,             <gate
kill            mov.i   @ammo,          <patch+1
bomb            dat.f   <gate,          #stop-ammo
patch           djn.f   clear-stone,    <gate-stone
ammo            dat.f   0,              stunner

for 156
                dat.f   0,              0
rof

split           spl.b   #0,             <-199
wimp            djn.f   #0,             <-200
entry           spl.b   stone
newimp          mov.i   wimp,           offset
                mov.i   split,          <newimp
                spl.b   @newimp

step            equ     29179
imp             mov.i   0,              step
                spl     1
                mov.i   -1,             #0
                mov.i   -1,             #0
                spl     1
                mov.i   -1,             #0
                spl     1
                spl     2
                jmp     imp+step
                add.a   #step,          -1

                end


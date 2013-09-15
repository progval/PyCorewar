;redcode-94
;name rimmer
;author jkw
;strategy Well, this really should beat any paper or imp.
;strategy I don't think I'll see an imp, though.
;strategy As for scissors... I think I should beat any of
;strategy those, too.  I should be able to do ok against a
;strategy stone, and I should do well against any sort of
;strategy multi-gate or multi-scissor program.  I should
;strategy also beat slower scanners, with smaller step sizes.
;strategy My biggest "fear" would be a one-shot scanner, I guess.
;assert 1
org     loc

dist    equ     2365
scan    equ     dist*2
clzone  equ     (stun-first+1)
dst     equ     13*4

gate    dat     0,      0
        dat     0,      0
        dat     0,      0
        dat     0,      0
first   sub     off,    @x
loc     sne.f   center-5+scan, center-5+dist
        sub     off,    @x
        sne.f   *loc,   @loc
        jmn.f   first,  first
x       mov     jstun,  @loc
        mov     sstun,  <loc
        sub.f   s,      loc
        jmn.b   @x,     center-5
center  spl     #0,     0
        mov     clr,    >gate
        jmp     -1,     {gate
off     dat     -scan,  -scan
sstun
s       spl     #-dist, -dist-1
        dat     0,      0
clr     jmp     -20,    49+3
        dat     0,      0
        dat     0,      0
for 28
        spl     0,      0
rof
        mov     clr-1,  <gate-70
jstun   jmp     -1


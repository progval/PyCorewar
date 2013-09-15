;redcode-94
;name Memories
;author Beppe Bezzi
;strategy cmp scanner like Iron Gate
;strategy with spl spl jmp bombs and 94 improvements
;strategy v06 changed to sne/seq scan engine
;strategy v a01 spiral clear; v b* c* super clear
;strategy v d08 details
;assert 1

org     dmake

dist    equ     239             ;not true
scan    equ     dist*2     
safe    equ     (last-first+1)
clzone  equ     (stun-first+1)
decoy   equ     -2345           ;not true
dst     equ     13*4
ISTEP   equ     381

first   sub     off,    @x
loc     sne.f   dist-1+scan, -1+scan
        sub     off,    @x
        seq.f   *loc,   @loc
        slt     #safe,  @x
        jmn.f   first,  first
        mov     j,      @loc
x       mov     stun,   <loc
        mov     stun,   <loc
        mov     stun,   <loc
        sub     s,      @x
        jmn.b   @x,     first
        add.a   #ISTEP+1,cpt
        mov     @-1,    {cpt
j       jmp     -2,     #0
off     dat     -scan,  -scan
cpt     spl     #2,     #3
kill
s       spl     #-dist, -dist-3

for 7
        dat     0,0
rof
stun    spl     #0,     0

for MAXLENGTH-CURLINE-12
        spl     #0,     #0
rof

dmake
a for 11
        mov     {decoy+a*dst,   {decoy+dist+a*dst
rof
last
        jmp     loc
end

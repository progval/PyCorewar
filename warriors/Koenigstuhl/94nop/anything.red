;redcode-94
;name anything box
;author schitzo
;strategy bomb/Fscan -> diehard-ish paper
;strategy bomb with JMPs to suicidal pit
;strategy if enemy jumps into pit, spl/spl/dat* coreclear
;strategy improved paper (more lethal, less die hard)
;strategy spread out more to thwart (q)scanners
;strategy made code harder to understand (that usually helps)
;assert CORESIZE==8000

; a hopefully improved version of "Drowning"
; bomb/scan, bomb with jumps to a pit
; pit will make lotsa processes, start a spl coreclear
; as soon as first enemy process enters pit, start a cool coreclear
; if N fangs placed, jump to paper

; make pit suicidal, move to end & cclear backward
; if scanner hits my cclear and jumps into pit, I should win

N       EQU     15
OFF     EQU     -2376
STEP    EQU     2*OFF
FIRST   EQU     j
PC1     EQU     1800
PC2     EQU     3740
PC3     EQU     (PC1-PC2+2*10-POFF)
DIST    EQU     278
DIST2   EQU     1357
POFF    EQU     (-50)
D       EQU     1143

org     a

a       add.f   inc,    @3
        mov.i   j,      *ptr
look    jmz.f   a,      @ptr
        mov.i   j2,     @ptr
        sub.x   @-1,    @ptr
        djn.b   a,      #N
        jmp     paper

for     17
        dat.f   0,      0
rof

paper   spl     p2              ;guard against hit to next 3 lines
p1      spl     1
        mov.i   -1,     #0
        mov.i   -1,     #0
        spl     1
p01     spl     @0,     >PC1
        mov.i   }-1,    >-1
        nop     >0,     #0      ;scanned
p02     spl     @0,     >PC2
        mov.i   }-1,    >-1
        mov.i   b,      }p01-DIST
        mov.i   b,      >p01+DIST
        mov.i   {p02,   {1
        jmp     PC3,    >1865
b       dat.f   >2667,  >5334
j       jmp     OFF,    OFF     ;bombed
p2      spl     1               ;2 consecutive copies of paper
        mov.i   -1,     #0
        mov.i   -1,     #0
        spl     1               ;10 process paper
        spl     imps
p11     spl     @0,     >PC1
        mov.i   }-1,    >-1
        nop     >0,     #0      ;scanned
p12     spl     @0,     >PC2
        mov.i   }-1,    >-1
        mov.i   b2,     }p11+DIST
        add.a   #37,    p11+PC1+DIST
        mov.i   {p12,   {1
        jmp     PC3,    >1856
b2      dat.f   >2667,  >5334
        dat.f   0,      0       ;bombed
r       mov.i   j3,     look    ;enemy into pit causes start of coreclear
pit     spl     #STEP,  #STEP
        spl     -1,     #100
        mov.i   b2,     >-1
        djn.f   pit,    {-25
        dat.f   0,      0
        dat.f   0,      0
imps    spl     #0,     #0      ;scanned
        spl     2
        jmp     imp
        add.a   #D,     -1
        dat.f   0,      0
imp     mov.i   #130,   D

for     14
        dat.f   0,      0
rof

ptr     dat.f   FIRST,  FIRST+OFF
j2      jmp     r-ptr,  >2667
j3      jmp     clear-look
inc     dat.f   STEP,   STEP
        dat.f   0,      0       ;bombed
cptr    dat.f   -15,    15
        dat.f   -15,    <2667
        dat.f   -15,    15
clear   spl     #-15,   15
        mov.i   @2,     >cptr
        mov.i   @1,     >cptr
        djn.b   -2,     {clear

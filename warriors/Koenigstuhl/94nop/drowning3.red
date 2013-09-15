;redcode-94
;name Drowning III
;author Mike Nonemacher
;strategy Drowning With Land In Sight
;strategy F-scan -> silk paper
;strategy coreclear if F-scan found anything
;strategy testing...
;assert CORESIZE==8000

;F-scan, mod 1, till we find something.  When we find something, bomb it
;with an indirect jump to the pit, and decrement DELAY.  The next stage
;of Drowning III is brought on in one of three ways:
;     1. When DELAY=0, that is, when we have found and bombed DELAY
;        things, start silk paper and a wimp.  The wimp ensures a win if
;        any processes are caught in the pit, and the silk paper has been
;        bombed.
;     2. When we get done NSCANS scans, trap is moved onto tr, BUT NOT
;        SUBTRACTED FROM, which makes the indirection point to m (which
;        always points to done.  We then jump to done, and start silk
;        paper and a wimp.
;     3. When an opponent jumps into the pit, sig is decremented.
;        Looking at the line before r (r holds #DELAY) makes the djn.b
;        fall thru, and starts a perpetual coreclear.  It clears forward,
;        while decrementing backward, and should hit the pit last.  Any
;        processes in the pit will be spl-bombed last, and will die last.
;        After writing the spl to all core locations, the coreclear writes
;        a dat statement to all core locations, over and over again.  This
;        strategy works very well against opponents using silk paper.
;
;The scanner/pit part should take care of scanners.  I have tried to set
;the program components up so that, if a scanner is trapped in the pit,
;and the pit is intact, it doesn't matter where my code has been hit, I
;will get the win.  Against stones (including imp-stones), case 1 will
;trigger the silk paper, which should get a win.  Against paper opponents,
;case 3 is the desired outcome, and should result in a win, but case 1
;often occurs, guaranteeing a tie.

;scans self at:
;     34 47 60 73 86 99 12 25 38 51 64 77 90 3
;     3 12 25 34 38 47 51 60 64 73 77 86 90 99

STEP    EQU     239
INIT    EQU     tr-(STEP*NSCANS)
NSCANS  EQU     1137
DELAY   EQU     25
PC1     EQU     299
PC2     EQU     1021

org     scan

a       add.ab  #STEP,  @tr     ;line 0
scan    jmz.f   -1,     INIT
        mov.i   trap,   @scan
tr      sub.ba  @0,     @scan
sig     djn.b   a,      r
        jmz.b   done,   r
        jmp     clear           ;line 6

for     7
        dat.f   0,      0
rof

paper   spl     1,      #1      ;line 14
        spl     1,      #1
        mov.i   -1,     #1
r       spl     p2,     #DELAY
p1      spl     @0,     PC1
        mov.i   }-1,    >-1
        mov.i   b1,     >-2
        mov.i   b1,     }2241
        mov.i   b1,     >4000
        jmp     @0,     {p1
b1      dat.f   >2667,  >5334   ;line 24
        dat.f   0,      0
p2      spl     @0,     PC2     ;line 26
        mov.i   }-1,    >-1
        mov.i   b2,     >-2
        mov.i   b2,     }2241
        mov.i   b2,     >4000
        jmp     @0,     {p2
b2      dat.f   >2667,  >5334   ;line 32

for     19
        dat.f   0,      0
rof

pit     spl     #0,     #2      ;line 52
        mov.i   clr,    >clr
m       mov.i   j,      #done           ;make sure next line only runs once
        jmp     -3,     <sig            ;tell scan to go into coreclear
clr     dat.f   >2667,  #50

for     17
        dat.f   0,      0
rof

done    spl     paper           ;line 74
wimp    jmp     #0,     <-100
j       jmp     -2,     #done-m ;line 76
        dat.f   0,      0
trap    jmp     @pit-scan,      #40     ;line 78

for     15
        dat.f   0,      0
rof

cptr    dat.f   #clear, #clear+5        ;line 94
        dat.f   #1,     @6
clear   spl     #1,     @6
        mov.i   *cptr,  >cptr           ;forward perpetual coreclear
        djn.f   -1,     <-56    ;line 99
END

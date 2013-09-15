;redcode-94x
;name Der Zweite Blitzkrieg - 94x
;author Mike Nonemacher
;contact mn2f+@andrew.cmu.edu
;strategy stone-spiral -> 2-pass coreclear -> gate
;strategy Only very minor mods from '88 version
;assert CORESIZE==55440
;macro

;Please send the results in uuencoded tar.Z format.  Thanx.

BOOT    EQU     31405                   ;Just picked this one at random
C       EQU     536                     ;bombing increment - small, mod-8
GVAL    EQU     -19                     ;decrement for gate
INCR    EQU     20                      ;offset of inc from stone
PTR     EQU     -11                     ;offset of ptr from stone+4
I       EQU     31532                   ;offset of start of spiral from imp
D       EQU     34117                   ;13-point spiral

decoy   for     125
        dat.f   <1,     <1
        rof
start   spl.b   isp                     ;launch spiral
        mov.i   gate,   top+BOOT-1+PTR+GVAL     ;set up 2-pass clear
        mov.i   split,  top+BOOT-4-19
        mov.ab  #-PTR-1,        top+BOOT-1+PTR
src     spl     1,      #gate
        mov.i   -1,     0
        spl     1                       ;6 processes for bootstrap
        mov.i   <src,   <top
top     jmp     @0,     #BOOT+1
imp     mov.i   #238,   D
split   spl.f   0,      >GVAL
stone   sub.f   stone+INCR,     1
        mov.i   <-19,   1
        jmp.f   -2,     >split+GVAL
        mov.i   @PTR,   <stone+INCR
jump    jmp.f   -2,     >GVAL-2
gate    dat.f   >GVAL-1,        #0
isp     mov.i   imp,    imp+I
        mov.i   inc,    top+BOOT-4+INCR
        spl     32
        spl     16
        spl     8
        spl     4
        spl     2
        jmp     imp+I
        jmp     imp+I+D
        spl     2
        jmp     imp+I+D*2
        jmp     imp+I+D*3
        spl     4
        spl     2
        jmp     imp+I+D*4
        jmp     imp+I+D*5
        spl     2
        jmp     imp+I+D*6
        jmp     imp+I+D*7
        spl     8
        spl     4
        spl     2
        jmp     imp+I+D*8
        jmp     imp+I+D*9
        spl     2
        jmp     imp+I+D*10
        jmp     imp+I+D*11
        spl     4
        spl     2
        jmp     imp+I+D*12
        jmp     imp+I+1
        spl     2
        jmp     imp+I+D+1
        jmp     imp+I+D*2+1
        spl     16
        spl     8
        spl     4
        spl     2
        jmp     imp+I+D*3+1
        jmp     imp+I+D*4+1
        spl     2
        jmp     imp+I+D*5+1
        jmp     imp+I+D*6+1
        spl     4
        spl     2
        jmp     imp+I+D*7+1
        jmp     imp+I+D*8+1
        spl     2
        jmp     imp+I+D*9+1
        jmp     imp+I+D*10+1
        jmp     1
        spl     4
        spl     2
        jmp     imp+I+D*11+1
        jmp     imp+I+D*12+1
        jmp     1
        jmp     imp+I+D+2
inc     dat.f   #C,     #-C
END     start


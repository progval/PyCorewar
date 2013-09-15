;redcode-94
;name Der Zweite Blitzkrieg - 94
;author Mike Nonemacher
;strategy quick-scan -> stone-spiral -> 2-pass coreclear -> gate
;strategy Only very minor mods from '88 version
;assert 1

;Real strategy:
;Quick-scan, spl/jmps what it found.  Nimbus-style 7-point spiral launch.
;Slightly adapted Blitzkrieg stone (had to make it self-splitting), bombs
;itself to turn itself into a spl/dat coreclear -> gate.  Has at minimum
;around 130 processes in gate, with 15 in the spiral, so I have at least a
;90% gate, but the gate also adds processes constantly, so it's usually
;more than that.  Since I don't bomb myself with the stone's split, I can
;sustain a hit to either the stone's spl 0 or jmp -2.  
;The stone should give me a winning record against scanners, and the spiral
;makes sure I at least tie other stones (without gates) and spirals.  The
;spl/dat coreclear should kill paper (as well as the quick-scan, since no
;one ever has only one copy of their paper anymore), and the 7-point spiral
;will thwart most anti-imp strategies (Iron Trap, 3-point coreclear (Iron
;Sword), 3-point decrement (Imprimis 7), and most anti-imp paper).

BOOT    EQU    3405            ;Just picked this one at random
C    EQU    328            ;bombing increment - small, mod-8
GVAL    EQU    -19            ;decrement for gate
INCR    EQU    20            ;offset of inc from stone
PTR    EQU    -11            ;offset of ptr from stone+4
I    EQU    1232            ;offset of start of spiral from imp
D    EQU    1143            ;7-point spiral
CMP1    EQU    (start-2)*SC/2+CMPST    ;EQUs for quick-scan
CMP2    EQU    CMP1+4000
MOV1    EQU    (start-1)*SC/2+CMPST-BPTR+67
BPTR    EQU    bptr1            ;point 67 past what we found
SC    EQU    112            ;only 34 scans would fit :(
CMPST    EQU    start+33        ;make sure stone doesn't kill spl/jmps

start    
xx for    34
    cmp.i    CMP1,    CMP2        ;Quick-scan
    mov.ab    #MOV1,    BPTR
rof
bptr1    jmz.b    ok,    #0        ;skip if we didn't find anything
    mov.i    jump,    <BPTR
    mov.i    split,    <BPTR
    sub.ab    #4002,    @-1
    djn.b    -3,    #35
ok    spl    isp            ;launch spiral
    mov.i    gate,    top+BOOT-1+PTR+GVAL    ;set up 2-pass clear
    mov.i    split,    top+BOOT-4-19
    mov.ab    #-PTR-1,    top+BOOT-1+PTR
    spl    1
    mov.i    -1,    0
    spl    1            ;6 processes for bootstrap
    mov.i    <src,    <top
top    jmp    @0,    #BOOT+1
imp    mov.i    #238,    D
split    spl.f    0,    >GVAL
stone    sub.f    stone+INCR,    1
    mov.i    <-19,    1
    jmp.f    -2,    >split+GVAL
    mov.i    @PTR,    <stone+INCR
jump    jmp.f    -1,    >GVAL-2
gate    dat.f    >GVAL-1,    #0
isp    mov.i    imp,    imp+I
    mov.i    inc,    top+BOOT-4+INCR
    spl    1
    spl    1
    spl    1
    mov.i    -1,    0        ;generate 15 consecutive processes
src    spl    2,    #jump+1
    jmp    @0,    imp+I
    add.ab    #D,    -1
inc    dat.f    #C,    #-C
END    start

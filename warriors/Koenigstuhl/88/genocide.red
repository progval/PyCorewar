;redcode
;name Genocide
;author Mike Nonemacher
;strategy Simpler is better.
;assert 1
 
STEP    EQU    -3510                   ;Initial bomber is mod-10
SBOOT   EQU    1562                    ;Distance to boot bomber
FOUND   EQU    (start+SBOOT-1+STEP)    ;Points to what my Bscan found
SJINC   EQU    3044                    ;increment for anti-SPL/JMPer
TIMER   EQU    790                     ;When Bscan finds this, launch paper
CORE    EQU    (ksj2-1)
 
ksj2    mov    @-2,    1
ksj3    djn    -2,    #1999
ksj5    mov    @20,    <-2
start   mov    s4,    SBOOT
        mov    s3,    <start
        mov    s2,    <start
        mov    s1,    <start
        jmp    @start,    <FOUND-TIMER    ;hit - OK
g       dat    <-18-2668,    <-18
enter   sub    @FOUND,    @FOUND
        cmp    @FOUND,    CORE        ;compare to core
        jmp    notcore
        sub    #3,    FOUND
        jmn    clear,    @FOUND
        jmp    paper
notcore cmp    @FOUND,    imp
        jmp    sjk
impf    spl    paper,    #3        ;hit - last
        mov    s1-1,    @FOUND
        add    #2667,    FOUND
        jmp    -2
paper   spl    1
        spl    1
        spl    1            ;8-process paper
        spl    p5
        spl    p4
        spl    p003-1
        dat    #0            ;hit - OK
p1      spl    p2,    #ksj4
p001    mov    #8,    8
        mov    <-1,    <2
        jmn    5,    p001
        spl    @0,    -2395
        mov    3,    <-1
        mov    2,    <-2
        jmz    @0,    p001
        dat    <2667,    <5334
        dat    #0            ;hit - OK
clear   spl    0,    <-17
        mov    @-11,    <19
        jmp    -1,    <-19
avamp   jmz    0,    <-1000        ;search for a fang
        sub    @avamp-1000,    ptr
        add    avamp-1000,    ptr
av      mov    CORE,    <ptr
        djn    -1,    #23
ptr     dat    #avamp-1000+12
        dat    #0            ;hit - OK
p002    mov    #8,    8
p2      mov    <-1,    <1
        spl    @0,    -2595
        mov    4,    <-1
        mov    3,    <-2
        mov    2,    <-3
        jmz    @0,    p002
        dat    <2667,    <5334
ksj1    add    #SJINC,    1
s4      jmp    -SBOOT+enter-start    ;hit - OK
        spl    p1,    #clear-30
p003    mov    #8,    8
p3      mov    <-1,    <1
        spl    @0,    -2795
        mov    3,    <-1
        mov    3,    <-2
        jmz    @0,    p003
        dat    <2667,    <5334
        mov    0,    <1
s3      jmz    -2,    <STEP        ;hit - OK
p004    mov    #8,    8
p4      mov    <-1,    <2
        jmn    5,    p004
        spl    @0,    -2995
        mov    3,    <-1
        mov    2,    <-2
        jmz    @0,    p004
        dat    <2667,    <5334
ksj4    spl    0,    <-20
s2      sub    1,    -1        ;hit - OK
        dat    #clear-50
p005    mov    #8,    8
p5      mov    <-1,    <1
        spl    @0,    -3195
        mov    4,    <-1
        mov    3,    <-2
        mov    2,    <-3
        jmz    @0,    p005
        dat    <2667,    <5334
s1      mov    <40,    -STEP+5        ;hit - OK
sjk     spl    avamp
        add    #2,    FOUND
        mov    ksj5,    @FOUND
        mov    ksj4,    <FOUND
        mov    ksj3,    <FOUND
        mov    ksj2,    <FOUND
        mov    ksj1,    <FOUND
        jmp    @FOUND
imp     mov    0,    0

END     start


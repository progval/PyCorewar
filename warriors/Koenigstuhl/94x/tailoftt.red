;redcode-94x
;name Tail of the Twister
;author Mike Nonemacher
;contact mn2f+@andrew.cmu.edu
;strategy (yet another) imp/stone
;kill Tail
;assert CORESIZE==55440
;macro

;ExtraExtra stone -> coreclear + 32-process, 17-point spiral

a1    equ    t+CORESIZE/2
b1    equ    t+CORESIZE/2
C    equ    226
D    equ    35873    ;17-point
I    EQU    -10
BOOT    EQU    11684

imp    mov.i    #18645,    D
start    mov.i    s+7,    BOOT
    mov.i    s+6,    <start
    mov.i    s+5,    <start
    mov.i    s+4,    <start
    mov.i    s+3,    <start
    mov.i    s+2,    <start
    mov.i    s+1,    <start
    mov.i    s,    <start
    spl    @start
    mov.i    imp,    imp+I
    spl    b        ;Cool imp-launch stolen from Steven Morrell
a    spl    ab
aa    spl    aab
aaa    spl    aaab
aaaa    spl    i2
i1    jmp    >0,    imp+I
aaab    spl    i4
i3    jmp    >0,    imp+I+D*2
aab    spl    aabb
aaba    spl    i6
i5    jmp    >0,    imp+I+D*4
aabb    spl    i8
i7    jmp    >0,    imp+I+D*6
ab    spl    abb
aba    spl    abab
abaa    spl    i10
i9    jmp    >0,    imp+I+D*8
abab    spl    i12
i11    jmp    >0,    imp+I+D*10
abb    spl    abbb
abba    spl    i14
i13    jmp    >0,    imp+I+D*12
abbb    spl    i16
i15    jmp    >0,    imp+I+D*14
b    spl    bb
ba    spl    bab
baa    spl    baab
baaa    spl    i1
i17    jmp    >0,    imp+I+D*16
baab    spl    i3
i2    jmp    >0,    imp+I+D
bab    spl    babb
baba    spl    i5
i4    jmp    >0,    imp+I+D*3
babb    spl    i7
i6    jmp    >0,    imp+I+D*5
bb    spl    bbb
bba    spl    bbab
bbaa    spl    i9
i8    jmp    >0,    imp+I+D*7
bbab    spl    i11
i10    jmp    >0,    imp+I+D*9
bbb    spl    bbbb
bbba    spl    i13
i12    jmp    >0,    imp+I+D*11
bbbb    spl    i15
i14    jmp    >0,    imp+I+D*13
i16    jmp    >0,    imp+I+D*15
s    mov    <a1,    b1
    spl    -1,    #5    ;ptr1
    sub    inc,    -2
t    jmn    -3,    #1    ;center, trigger
inc    spl    #C,    <-C
    mov.i    2,    <-22    ;loc1
    djn.f    -2,    <-C-2
bomb    dat.f    <-C-1,    <-C
for    133
    dat.f    1,    1
rof
END    start

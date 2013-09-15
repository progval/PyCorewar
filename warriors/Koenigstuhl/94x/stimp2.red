;redcode-94x
;name Stimp 2
;author Jay Han
;kill Stimp
;strategy More Stone+Imp -> More Imps
;assert CORESIZE==55440

        org     start

t       equ     42547
st      equ     34117                           ; second imp-spiral
x       equ     -2                              ; Stone ends, imp is here
boot    equ     0

p2      equ     37332
q2      equ     37327
p1      equ     42816
q1      equ     7251

comp    cmp.i   -x              ,-x-t
stimp   mov.i   0               ,st
kill    mov.i   <p1             ,p2
        add.f   inc             ,kill
mutate  jmp.b   kill            ,<comp-2        ; p2 hits here [2]
hop     jmp.b   @0              ,is
inc     dat.f   q1              ,q2

; 13-point spiral
is      spl.b   1               ,<hop
is2     spl.b   1               ,comp+1         ; p1 hits here [6]
        mov.i   -1              ,0
        mov.i   -1              ,0
        spl.b   2               ,1              ; hit
jump    jmp.b   stimp
stend   add.a   #st             ,jump
; must be a DAT here...

        for 80
        dat.f   0               ,0
        rof

imp     mov.i   0,      t
start
a       for 18
        spl.b   kill
        rof

; 43-point spiral (coresize 55440, '94 standard)
s
s1      spl     s3
s2      spl     s5
s4      spl     s9
s8      spl     s17
s16     spl     s33
s32     spl     s65
s64     jmp     imp+1*t
s65     jmp     imp+2*t
s33     spl     s67
s66     jmp     imp+3*t
s67     jmp     imp+4*t
s17     spl     s35
s34     spl     s69
s68     jmp     imp+5*t
s69     jmp     imp+6*t
s35     spl     s71
s70     jmp     imp+7*t
s71     jmp     imp+8*t
s9      spl     s19
s18     spl     s37
s36     spl     s73
s72     jmp     imp+9*t
s73     jmp     imp+10*t
s37     spl     s75
s74     jmp     imp+11*t
s75     jmp     imp+12*t
s19     spl     s39
s38     spl     s77
s76     jmp     imp+13*t
s77     jmp     imp+14*t
s39     spl     s79
s78     jmp     imp+15*t
s79     jmp     imp+16*t
s5      spl     s11
s10     spl     s21
s20     spl     s41
s40     spl     s81
s80     jmp     imp+17*t
s81     jmp     imp+18*t
s41     spl     s83
s82     jmp     imp+19*t
s83     jmp     imp+20*t
s21     spl     s43
s42     spl     s85
s84     jmp     imp+21*t
s85     jmp     imp+22*t
s43     spl     s87
s86     jmp     imp+23*t
s87     jmp     imp+24*t
s11     spl     s23
s22     spl     s45
s44     spl     s89
s88     jmp     imp+25*t
s89     jmp     imp+26*t
s45     spl     s91
s90     jmp     imp+27*t
s91     jmp     imp+28*t
s23     spl     s47
s46     spl     s93
s92     jmp     imp+29*t
s93     jmp     imp+30*t
s47     spl     s95
s94     jmp     imp+31*t
s95     jmp     imp+32*t
s3      jmp     1
s6      spl     s13
s12     spl     s25
s24     spl     s49
s48     spl     s97
s96     jmp     imp+33*t
s97     jmp     imp+34*t
s49     spl     s99
s98     jmp     imp+35*t
s99     jmp     imp+36*t
s25     spl     s51
s50     spl     s101
s100    jmp     imp+37*t
s101    jmp     imp+38*t
s51     spl     s103
s102    jmp     imp+39*t
s103    jmp     imp+40*t
s13     jmp     1
s26     spl     s53
s52     spl     s105
s104    jmp     imp+41*t
s105    jmp     imp+42*t
s53     jmp     imp

        end


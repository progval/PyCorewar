;redcode-b
;name Wild-Fire
;author P_.V_.K./John Metcalf
;assert CORESIZE==8000
        org     s

; -----------------------
; Ulti-Bomber Stone/Clear
; -----------------------

sStep   equ     2376
ptr     dat     0,      200

        for     7
        dat     0,      0
        rof

stone   mov     >sStep, 1-sStep
        add     st,     stone
        jmz.a   stone,  >ptr
st      spl     #sStep, <-sStep
clr     mov     wipe,   >ptr
        djn.f   clr,    >ptr
wipe    dat     >5335,  1-ptr

        for     5+12*2
        dat     0,      0
        rof

; -------------------
; Fire-Master Oneshot
; -------------------

oStep   equ     12
sc      dat.f   sb,     3+12*5
db      dat.f   sb-sc,  >11
loop    add.ab  #oStep, sc
fire    jmz.f   loop ,  @sc
sb      spl     #db-sc, >11
clear   mov.i   *sc,    >sc
        djn.b   clear,  <-20

        for     4+12*3
        dat     0,      0
        rof

; --------------
; Switch on Loss
; --------------

str     equ     311
s       ldp     #0,     r
        ldp     #str,   s
r       sne     #0,     #0
        add     #1,     s
        mod     #2,     s
        stp     s,      #str
        jmn     stone,  s
        jmp     fire
        end


;redcode-94
;name Funky Monks
;author David Moore
;assert 1
;(CORESIZE==8000) && (MAXLENGTH==50)
;strategy qscan -> pspacer -> scanner or paper

QB equ 300
QS equ 150
QI equ 50

d1 equ 4496
d2 equ 1283

gate equ 3


scan    mov <top, {ptrs
        mov <top, {ptrs
        mov <top, {ptrs
        djn   -3, #3
ptrs    jmp 5609, {0

top     mov.b 2, #9
        mov sb, >-1
        add #2891, #0-(2891*2209)
        jmz.f -2, @-1
        jmn top, *top
sb      spl 0, 0
        mov 2, >top-gate
        djn.f -1, >top-gate
        dat 0, 2+gate-top

paper   spl   1, >-250
        mov.i 1, #0
        spl   1, {-264

        spl @0, <d1
        mov }-1, >-1
        mov   3, >-2
        mov {-3, {1
        jmz.a d2, *0
        dat 1,1

plogic  ldp.ba    4,  5
        ldp.ab   #0, -1
        add.ba  @-2,  3     ; switch on loss
        mod.a    #2, *0     ; protection from brainwash
        stp.ab   {1, #paper
        jmp      @0,  scan  ; default warrior

qscan   seq qscan+QB+(QS*0), qscan+QB+(QS*0)+QI
        add.f -1, qptr
        seq qscan+QB+(QS*1), qscan+QB+(QS*1)+QI
        add.f -1, qptr
        seq qscan+QB+(QS*2), qscan+QB+(QS*2)+QI
        add.f -1, qptr
        seq qscan+QB+(QS*3), qscan+QB+(QS*3)+QI
        add.f -1, qptr
        seq qscan+QB+(QS*4), qscan+QB+(QS*4)+QI
        add.f -1, qptr
        seq qscan+QB+(QS*5), qscan+QB+(QS*5)+QI
        add.f -1, qptr
        seq qscan+QB+(QS*6), qscan+QB+(QS*6)+QI
        add.f -1, qptr
qptr    jmz  plogic, #0
        mov      db, {qptr
        mov      db, @qptr
        add      db, qptr
        djn      -3, #9
        jmp    scan, 0
db      dat     #12, #-11

end qscan


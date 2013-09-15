;redcode-94nop
;name Defensive
;author Christian Schmidt
;strategy Q^3 -> Paper / 3pt and 7pt imps
;assert CORESIZE==8000

     org qGo

d2    equ 1143
TSTEP equ 3044
bstep equ 1819

impy equ 2667
aaa  equ 1880
bbb  equ 2050
ccc  equ  240

pGo: spl   1,      >424
     spl   1,      {761
    spl   1,      {933

     mov   {paper,  {p1Boo
p1Boo:spl   xEnd+2000,}-1234

     mov   {evol,  {pBoo
pBoo:jmp   pEnd+6000,}-2345

evol:   spl   @pEnd,    }TSTEP
        mov.i }evol,    >evol
evoli:  spl   #d2,      bstep-1
        mov   b,        >2
        add.f evoli,    j
j:      jmp.f imp2-d2*8,{-6+bstep
b       dat   <1,       1
imp2    mov.i #10, d2
pEnd:      dat   0,0

     a for 33
     dat   0,0
     rof

qf  equ     qKil
qs  equ     200
qd  equ     4000
qi  equ     7
qr  equ     8

qBmb    dat     {qi*qr-10   , {1
qGo     seq     qd+qf+qs    , qf+qs      ; 1
        jmp     qSki        , {qd+qf+qs+qi+2
        sne     qd+qf+5*qs  , qf+5*qs    ; B+1
        seq     qf+4*qs     , {qTab      ; B
    jmp     qFas        , }qTab
        sne     qd+qf+8*qs  , qf+8*qs    ; A
        seq     qf+7*qs     , {qTab-1    ; A-1
        jmp     qFas        , {qFas
    sne     qd+qf+10*qs , qf+10*qs   ; C
        seq     qf+9*qs     , {qTab+1    ; C-1
    jmp     qFas        , }qFas
    seq     qd+qf+2*qs  , qf+2*qs    ; B-2
    jmp     qFas        , {qTab
    seq     qd+qf+6*qs  , qf+6*qs    ; A-2
    djn.a   qFas        , {qFas
    seq     qd+qf+3*qs  , qf+3*qs    ; B-1
        jmp     qFas        , {qd+qf+3*qs+qi+2
    sne     qd+qf+14*qs , qf+14*qs   ; E+1
    seq     qf+13*qs    , <qTab      ; E
    jmp     qSlo        , >qTab
    sne     qd+qf+17*qs , qf+17*qs   ; D
    seq     qf+16*qs    , <qTab-1    ; D-1
    jmp     qSlo        , {qSlo
    seq     qd+qf+11*qs , qf+11*qs   ; E-2
    jmp     qSlo        , <qTab
    seq     qd+qf+15*qs , qf+15*qs   ; D-2
    djn.b   qSlo        , {qSlo
    sne     qd+qf+12*qs , qf+12*qs   ; E-1
    jmz     pGo     , qd+qf+12*qs-qi    
qSlo    mov.ba  qTab        , qTab
qFas    mul.ab  qTab        , qKil
qSki    sne     qBmb-1      , @qKil
        add     #qd     , qKil
qLoo    mov.i   qBmb        , @qKil
qKil    mov.i   qBmb        , *qs
        sub.ab  #qi     , qKil
        djn     qLoo        , #qr
        jmp     pGo     , <-d2
        dat     5408        , 7217       
qTab    dat     4804        , 6613      
dSrc    dat     5810        , pGo+5  

paper   spl  @xEnd, >aaa
        mov }-1, >-1
        spl  @0, >bbb
        mov }-1, >-1
        spl  @0, <2668
        mov }-1, >-1
        mov.i #2*aaa, }-aaa
        mov.i #bbb, impy
xEnd dat 0, 0

    end

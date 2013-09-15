;redcode
;name The Duelist
;author Michal Janeczek
;strategy Play weak paper. If it loses, assume that opponent used core-clear
;strategy and switch to brainwashing CLP. If brainwash wasn't succesful,
;strategy the next time different value will be used.
;strategy
;strategy Against papers try spl-wiping linear scanner, and an imp/paper
;strategy in multiwarrior battles.
;assert CORESIZE == 8000

       org    start
       pin    115

; -=> Scanner <=-

ptr    dat    0             , 107

       for    5
       dat    0             , 0
       rof

stun   spl    #0            , }0
wipe   mov    *stun         , <ptr
       mov    >ptr          , >ptr
       jmn.f  wipe          , >ptr
scan   sne.f  >ptr          , >ptr
       jmz.f  scan          , >ptr
       slt    ptr           , #6-ptr
       jmp    wipe          , <ptr
       djn    scan          , #25
       jmp    scan          , {stun

       dat    0             , 0
       dat    0             , 0
       dat    0             , 0

; -=> Switcher <=-

bwash  equ    215
pstate equ    315

start  stp    #21           , #415
       ldp.a  }0            , result
       ldp.a  #pstate       , tab
       mod.ba *result       , tab
       stp    *tab          , #pstate  ;  S  L  W  T  3
tab    jmp    }0            , 3290     ;  0  1  0  1  2
       spl    #clp          , 2720     ;  1  3  0  3  2
       spl    #imp          , 2        ;  2  2  2  2  2
       spl    #imp          , 323      ;  3 11  3  4  2
       spl    #paper        , 3833     ;  4 11  3  5  2
       spl    #paper        , 2624     ;  5 11  4  6  2
       spl    #paper        , 1415     ;  6 11  5  7  2
       spl    #paper        , 2936     ;  7 11  6 10  2
       spl    #scan         , 2648     ;  8  9  8  8  2
       spl    #scan         , 218      ;  9 10  8  9  2
       spl    #scan         , 3959     ; 10  7  9 10  2
       spl    #adjust       , 3290     ; 11  1  0  1  2
       jmp    #imp          , 4223     ;  x 11  3 10  2

adjust ldp.a  #bwash        , pit+1
       spl    clp+4         , }pit+1
       stp.ab pit+1         , #bwash

; -=> Paper (Fire and Ice) <=-

result dat    0             , 13
paper  spl    *1            , 10
       spl    1             , 11
       spl    1             , 3

       spl    @0            , <4195
       mov    }-1           , >-1
       mov    3             , >-2
       mov    {-3           , {1
       jmz.a  6234          , *0
       dat    1             , 1

; -=> Paper/imp (Blowrag) <=-

pStep1 equ    2850
pStep2 equ    464
pBomb  equ    7406
bDist  equ    (top+1441+7)
iStep  equ    2667

top    mov    <g3           , {g3
g3     jmp    bDist+iStep+7 , imp

s1     spl    @0            , <pStep1
       mov    }s1           , >s1
s2     spl    @0            , <pStep2
       mov    }s2           , >s2
       mov.i  #1            , <1
       spl    -2            , <pBomb
       mov.i  #iStep        , *0

imp    spl    1             , 1
       spl    1             , }0
       spl    1             , 1

       spl    top           , 1
       mov    <g1           , {g1
g1     spl    bDist+7       , imp
g2     spl    bDist+2*iStep , 1
       mov    }s1           , }g2

       for    18
       dat    0             , 0
       rof

; -=> CLP <=-

fence  equ    60
dist   equ    300

clp    ldp.a  #bwash        , pit+1

src    mov    #pit+4        , #pit+4
       mov.f  pit           , fang
       mov.i  #1            , *check
       mov    *check        , @check
       mov    fang          , <fang
check  sne    -fence        , fence
       jmp    -2            , }fang
       mov    <src          , <fang
       jmn    -1            , src
       jmp    >fang         , 1
fang   jmp    1+fence+dist  , 1-fence-dist
pit    mod.a  #1+fence+dist , #1-fence-dist
       stp    #0            , #-1
       djn    -1            , -1

       end


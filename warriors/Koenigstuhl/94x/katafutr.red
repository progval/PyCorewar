;redcode-94x
;name Katafutr
;author Michal Janeczek
;strategy Switch between paper with imps, incendiary bomber and
;strategy Paul Kline's FireHouse
;assert CORESIZE==55440

        org    think

; -- scanner

vSpace  equ    18480
vStep   equ    13

vPtr    dat    vScan            , tBoot+3
        dat    0                , 0
        dat    0                , 0

vAttack mov.ba vPtr             , vPtr
        mov    #vPtr-vSpiral    , vSpiral
        add.b  vPtr             , vSpiral
vSpiral mov.x  @0               , @0      ; extract spiral increment
        mov.b  @vSpiral         , vSpiral

vWipe   mov    vSpl             , <vPtr   ; positive wipe
        mov    >vPtr            , >vPtr
        jmn.f  vWipe            , >vPtr

        add.ba vSpiral          , vPtr    ; try spiral search
        jmz.f  vMod             , *vPtr
        mov.ab vPtr             , vPtr
        slt    vPtr             , #vClr+3-vPtr
        jmn.f  vWipe            , @vPtr
vMod    mod    #vSpace-10       , vPtr

vNext   add    #vStep           , vPtr    ; f-scan
vScan   jmz.f  vNext            , @vPtr
        mod    #vSpace-10       , vPtr    ; confine search space
vSelf   slt    vPtr             , #vClr+8-vPtr
vGate   jmz.f  vAttack          , vPtr+1
        djn    vNext            , #9      ; count self-scans

        spl    #0               , #0
vSpl    spl    #0               , #0
        mov    vClr             , <-2     ; reverse-wipe to overcome self-stuns
        mov    vClr             , >vGate  ; forward-wipe to win
        mov    vClr             , >vGate
        djn.f  -2               , >vGate
vClr    dat    0                , 2-vGate

        for    10
        dat    0                , 0
        rof

; -- paper/imp copy

eBackup stp    #-1              , #PSTATE-5
        spl    1                , {3785
        mov.i  {0               , #0
        mov.i  {0               , #0
        mov.i  {0               , #0
        spl    1                , {9623

        spl    @0               , {16211
        mov    }-1              , >-1
        spl    @0               , {21445
        mov    }-1              , >-1
        spl    #0               , 0
        add.f  #35873           , 1
        jmp    -35873           , {12087
        mov.i  #35873           , *0

        for    86
        dat    0                , 0
        rof

; -- bomber

tStep   equ    16134
tTime   equ    9241
tGate   equ    (tWipe-3)
tCheck  equ    (tHit+23)
tDist   equ    9362

tWipe   dat    1                , tClear+5-tGate
tSpl    spl    #tStep+1         , tClear+5-tGate
        mov.i  }tCheck          , #0
tPtr    mov    tHit-tTime*tStep , *tHit-(tTime-2)*tStep
        add    tInc             , tPtr
        mov    tSpl             , *tPtr
        mov    }tCheck          , @tPtr
tHit    jmn.a  tPtr             , {tCheck
tInc    spl    #3*tStep         , <3*tStep
tClear  mov    *tWipe           , >tGate
        mov    *tWipe           , >tGate
        djn.f  tClear           , }tSpl
tMov    mov    -tStep           , }-tStep

; -- brain

PSTATE  equ    2031

think   ldp.a  #0               , in
        ldp.a  #PSTATE          , table
        mod.ba *in              , table
        stp.b  *table           , #PSTATE

                                          ; S L W T
table   jmp    }0               , 99      ; 0 3 0 1
        spl    #eStart          , 387     ; 1 3 0 2
        spl    #eStart          , 171     ; 2 3 0 3
        spl    #tStart          , 480     ; 3 0 3 4
        spl    #tStart          , 264     ; 4 0 3 5
        spl    #tStart          , 48      ; 5 0 3 6
        spl    #vStart          , 447     ; 6 7 6 6
        spl    #vStart          , 384     ; 7 0 6 6

in      spl    #eStart          , 8       ; must have non-zero b-field in
        spl    #0               , 9       ;  the previous cell
        dat    0                , 7

vStart  mov    <vBoot           , {vBoot  ; boot only 2 copies
        mov    @vBoot           , {vBoot2
        mov    <vBoot           , {vBoot
        mov    @vBoot           , {vBoot2
        mov    <vBoot           , {vBoot
        mov    @vBoot           , {vBoot2
        djn    vStart           , #10
vBoot   spl    *vSpace+vClr+1   , vClr+1
vBoot2  spl    *2*vSpace+vClr+1 , 0
        jmp    vScan            , 0

tStart  mov    tMov             , tDist+tCheck+1
        spl    2                , {17843
        spl    1                , {18326
        spl    1                , {13965
        mov    {tStart          , <tBoot
        mov    {tStart          , <tBoot
tBoot   jmp    >tDist+tSpl+1    , tDist+tMov

; -- paper/imp based on Black Box by JKW

eImp    equ    35873

eStart  spl    eBackup          , {5465
        stp    #-1              , #PSTATE+5
        spl    1                , {9753
        mov.i  {0               , #0
        mov.i  {0               , #0
        mov.i  {0               , #0
        spl    1                , {4366

        spl    @0               , {16211
        mov    }-1              , >-1
        spl    @0               , {21445
        mov    }-1              , >-1
        spl    #0               , 0
        add.f  #eImp            , 1
        jmp    -eImp            , {12087
        mov.i  #eImp            , *0

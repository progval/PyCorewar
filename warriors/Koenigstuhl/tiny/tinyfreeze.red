;redcode-94x
;name Tiny Freeze
;author Lukasz Grabun
;strategy scanner
;assert CORESIZE==800

tStep   equ     210
tGate   equ     (tTop-4)

        org     tScan

tTop

tPtr    jmp     tSpl+1          , >-354
tMov    mov     tSpl            , >tPtr
tScan   seq     }tStep          , }tStep+5
        mov.ab  tScan           , @tMov
        add     tSpl            , tScan
        jmn.a   tMov            , tScan
tSpl    spl     #tStep          , #tStep
tClr    mov     tBmb            , >tGate
        djn.f   tClr            , >tGate
tBmb    dat     >5              , 2-tGate

;redcode
;name Oneshot '88
;author John Metcalf
;strategy .66c scan -> .66c clear
;assert CORESIZE==8000

st equ  -11 ;  -13 ;  -12 ;  -10 ;  -14
fi equ -110 ; -106 ; -100 ; -108 ; -114

;  141.6  144.0  145.7  141.3  145.9 : David Moore's '88 Benchmark
;  143.7  141.1  137.7  139.2  135.4 : Warriors from KOTH (published)

kill    dat <2667,    <kill-sptr

clear   spl 0,        <kill-sptr-8
cloop   mov @sloop,   <sptr
        mov @sloop,   <sptr
bomb    djn cloop,    <kill-5

steps   dat <st*2,    <st*2

sloop   add steps,    @cloop
sptr    cmp fi+st,    fi
        jmp <sloop
        jmp sloop

        end sptr


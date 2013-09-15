;redcode-94x
;name clear skies
;author Simon Wainwright
;strategy boot clear bomb
;assert CORESIZE==800

        org start
start   mov bmb,*boot
        mov {start,{boot
        mov {start,{boot
        mov {start,{boot
boot    spl 196,}-279
        mov }-31,{-44
        mov }-58,{-71
        mov }-85,{-98
        mov }-112,{-125
        mov }-139,{-152
        mov }-166,{-179
        mov }-193,{-206
        mov }-220,{-233
        mov }-247,{-260
        mov }-274,{-287
        jmn }400,}boot+231
ptr     equ (dclr-4)
dclr    spl #0,0
        mov bmb,>ptr
        djn.f dclr+1,>ptr
bmb     dat <1,<bmb+6-ptr
        end


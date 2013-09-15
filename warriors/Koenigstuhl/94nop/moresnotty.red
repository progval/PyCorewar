;redcode-b
;name More Snotty CSnots
;author WFB
;strategy What Snots!
;assert CORESIZE==8000
start   spl 1,<-200
        mov -1,0
        spl 1,<-800
        mov -1,0
s1      spl @0,}1100 ;experimenting with values-original is 1100
        mov }-1,>-1
s2      spl @0,<2620 ;original is 2620
        mov }-1,>-1
s3      spl @0,{1870 ;original value is 1870
        mov }-1,>-1
        mov snot,<88 ;88
s4      mov {-3,<1
        spl @0,}-639 ;-639
        mov 2,<-4
        jmp -1,<-13
snot    dat <-2667,<2667
end start

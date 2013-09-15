;redcode-b
;name Double-Vision
;author WFB
;startegy Splits off to 2 bombers and a jmp 0.
;strategy this is loserman!!! v.3, A.K.A Double-Vision
;strategy Wilkies score of 40.333332 (ugh....)
;assert CORESIZE==8000
body:
        mov 6,4002
        mov 6,4002
        mov 6,4002
        mov 6,4002
        spl 3998,<-501
        mov hide,2002
        spl 2001,<-501
        add #2668,boom
        mov boom,@boom
        jmp -2,<-501
boom:   dat #0,#0
hide:  jmp hide,<-301
end body

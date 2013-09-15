;redcode-b
;name 1-Man
;author WFB
;strategy Need...coffee...ugh.
;assert CORESIZE==8000
start   mov bomb1,@ptr
        mov bomb2,<ptr
        add #3,ptr
        djn -3,>-56
        spl 2,<-1000
        djn <0,<-10
        mov 10,>10
        jmp -1,<-100
bomb1   spl #1,<-2667
bomb2   jmp -1,<2667
ptr     dat #100,#100
dec     for 89
        dat 1,1
        rof
end start


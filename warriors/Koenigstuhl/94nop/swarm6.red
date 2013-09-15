;redcode-b
;name Swarm6
;author WFB
;strategy Rough draft of the final version of Swarm
;strategy Apperantly, Swarm6 does better against stones than Swarm5, but worse
;strategy against paper and scissors.
;strategy wilkies rating of 58.92
;assert CORESIZE==8000
start   mov c1,>ptr
        mov c2,@ptr
        spl @ptr,<-2670
        add step,ptr
        djn start,lc
loop    cmp <ptr,c1
        jmp start,>lc
        add step,ptr
        mov i1,>sptr
        mov i2,@sptr
        add sptr,sptr
        jmp loop,<-305
c1      mov -1,<0
c2      jmp -1,<-305
i1      mov 1,>0
i2      spl -1,<-500
lc      dat #4,#4      
ptr     dat #2000,#2000
step    dat #1990,#1990
sptr    dat #35,#35
end start


;redcode-b
;name Swarm5
;author WFB
;strategy Rough draft of the final version of Swarm
;assert CORESIZE==8000
start   mov c1,>ptr
        mov c2,@ptr
        spl @ptr,<-2670
        add step,ptr
        djn start,lc
loop    cmp <ptr,c1
        jmp start,>lc
        add step,>ptr
        mov i1,>sptr
        mov i2,@sptr
        add sptr,sptr
        jmp loop,<-305
c1      mov -1,<-1
c2      jmp -1,<-305
i1      spl 0,<-6
i2      jmp -1,<3
lc      dat #4,#4      
ptr     dat #1860,#1860
step    dat #2000,#2000
sptr    dat #35,#35
end start


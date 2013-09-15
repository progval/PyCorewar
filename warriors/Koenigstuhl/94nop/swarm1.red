;redcode-b
;name Swarm 1
;author WFB
;strategy Throws 2-line core clears in the quadrants of the core.
;strategy Future versions will keep track of the cc's to regenarate them,
;strategy and will have bombs to use against papers.
;assert CORESIZE==8000
start   mov c1,<ptr
        mov c2,}ptr
        spl @ptr,<-2667
        add ptr,ptr
        djn start,lc
        jmp 0,<-301
c1      mov -1,<-0
c2      jmp -1,<-501
lc      dat #4,#4
ptr     dat #2000,#2000
end start

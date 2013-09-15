;redcode-b
;name Swarm 2
;author WFB
;strategy A simplified, but worse, version of Swarm.  It adds one feature.
;assert 1
start   mov c1,<ptr
        mov c2,}ptr
        spl @ptr,<2668
loop    cmp @ptr,c1    
        jmp start,<-2767
        jmp loop,<-501
c1      mov -1,<0
c2      jmp -1,<501
ptr     dat #99,#99

end

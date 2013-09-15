;redcode-b
;name IMPy
;author WFB
;strategy lanches simple imps, then kills them (huh?)
;strategy version 3
;assert 1          
shoot:       spl 8,<-4
             jmp bomb,<-5
drop:        dat #0,#0
catch:       jmp -3,<-7
bomb:        mov 2,@drop
             spl @drop,<-9
             add #2667,drop
             jmp catch,<-11
imp:         mov 0,1
end shoot


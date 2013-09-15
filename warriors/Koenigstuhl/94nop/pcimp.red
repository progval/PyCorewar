;redcode
;author WFB
;name PCImp
;strategy Imp used in PC and Serenade
;assert CORESIZE==8000
imp_sz  equ     2667
impboot spl     1      ,<-450
        spl     1      ,<-458
        spl     <0     ,#vector+1
        djn.a   @vector,#0

imp     mov.i   #imp_sz, *0

        jmp     imp+imp_sz*7,imp+imp_sz*6   
        jmp     imp+imp_sz*5,imp+imp_sz*4   
        jmp     imp+imp_sz*3,imp+imp_sz*2   
vector  jmp     imp+imp_sz  ,imp

end    impboot

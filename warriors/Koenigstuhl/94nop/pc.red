;redcode-b test
;name PC
;author WFB
;strategy Yet another lame imp-stone.  No boot.
;assert CORESIZE==8000

step    equ 3044
sdist   equ     4620
start   spl impboot
dstart  spl #0, #0
diamond spl #-step,<step
rough   mov >-step,step+1
        add diamond,rough
        djn.f  rough,<diamond-1051
loc     dat #0,#0
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

end    start 


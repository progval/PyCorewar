;redcode-94nop quiet
;name Puff
;kill Puff
;author P.Kline
;assert CORESIZE == 8000
;strategy sequential-bombing binary paper
; demonstrating how a replicator can bomb at .5c or faster
; and kill spirals even late in the battle

Puff    spl    2        ,>100       ; create 10 processes
        spl    2        ,>200
        spl    1        ,>300
        spl    1        ,>400


        mov    <1       ,<d1+2101   ; launch 2 copies
        spl    r1+2100  ,d1+1
        mov    <1       ,<d1+4001
        spl    r1+4000  ,d1+1
        jmp    r1                   ; skip splits and bombing first time

p1      spl    1        ,0          ; double from 5 to 10 processes
        mov    d1       ,>-2100     
        mov    d1       ,>-1301     ; sequential forward bombing
        mov    d1       ,>5334-50
r1      mov    >p1      ,>c1        ; make two copies
        mov    <c1      ,{c1
        djn    2        ,#6         ; 
c1      mov.x  #-4703   ,#2312      ; pass processes sequentially
        jmz    *c1      ,*c1        ;
d1      dat    <5334    ,<2667

	end


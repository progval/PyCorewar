;redcode-94nop
;name Mileage Plus +
;author WFB
;strategy Paper/Imp
;assert 1
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
start   spl impboot,<-278
        spl impboot,<-279
        spl impboot,<-280
csnots  spl 1,<-200
        spl 1,<-800
        spl 1,<-800
s1      spl @0,}1100 ;experimenting with values-original is 1100
        mov }-1,>-1
        mov }-2,>-2
s2      spl @0,<2620 ;original is 2620
        mov }-1,>-1
s3      spl @0,{1870 ;original value is 1870
        mov }-1,>-1
        mov snot,<88 ;88
        mov 2,<-4
        jmp -1,<-130
snot    dat <2667,<2667*2  ;2667
	end start


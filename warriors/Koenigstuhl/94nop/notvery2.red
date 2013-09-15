;redcode-94b
;name Not Very Pretty 2.0
;author Ross Morgan-Linial
;assert CORESIZE==8000
;strategy FAST bomber -> two-pass coreclear -> imp gate
;version 1.0

;first, a 50% of C bombing loop
start 
loop1   add.i   addto,        indic
        mov     bomb,           @indic
        mov     bomb,           *indic  
        djn     loop1,          #799
        jmp     cclear
addto   dat     #4730,          #4730
indic   dat     #start+3999,    #start+4
bomb    dat     0,              10

        FOR     80
        DAT     0,              0
        ROF

; now, a two-pass coreclear
ptr     dat.f   0,              0        
        dat.f   0,              10       
cclear  spl     #0,             10      
        mov.i   @bptr,          >ptr 
        mov.i   @bptr,          >ptr 
bptr    djn.b   -2,             {cclear 

end	start


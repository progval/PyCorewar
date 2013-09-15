;redcode quiet
;name Passport
;author Paul Kline
;contact pk6811s@acad.drake.edu
;strategy paper, antivamp
;assert 1
start   spl avamp
        jmp p1
        
avamp   jmz avamp,<av2
av1     sub @av2,<av2
av2     mov -20,<-200
        jmp av2

p1      mov #8,0
        mov <p1,<2
        jmn -1,p1
        spl @0,3039
        add #889+8,-1
        jmz @0,p1
        mov 1,<1
        dat #-5

        end start

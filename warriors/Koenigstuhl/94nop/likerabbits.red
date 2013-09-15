;redcode-94
;name Like Rabbits!
;author Simon Hovell
;macro
;assert 1

zero    equ st-1

st      add.AB #2930,1
        mov.I bomb,zero
        djn -2,#800
        jmp a
        for 11
        dat.F 0,0
        rof
dc:     mov.I <2,>4
        mov.I <-1,<1
        spl.B @0,>8004
        jmp.B -3,>-3

        dat.F 0,0

a:      spl ba          ;binary launch
bb:     spl cc
cd:     spl.A 1,<-1000
        spl.A 1,<-2000
        spl dg

        ;one rabbit
dh:     mov.I <2,>4     ;spacer, also kills older rabbits,also counter
        mov.I <-1,<1    ;make new copy
        spl.B @0,>1604  ;split to new copy,increments new rabbits counter
        jmp.B -3,>-3    ;loop, increment counter

        dat.F 0,0
        dat.F 0,0

ba:     spl ca

cb:     spl.A 1,<-3000
        spl.A 1,<-4000
        spl dc

dd:     mov.I <2,>4
        mov.I <-1,<1
        spl.B @0,>2404
        jmp.B -3,>-3

        dat.F 0,0
        dat.F 0,0
        dat.F 0,0

ca:     spl.A 1,<-5000
        spl.A 1,<-6000
        spl da

db:     mov.I <2,>4
        mov.I <-1,<1
        spl.B @0,>3204
        jmp.B -3,>-3

        dat.F 0,0
        dat.F 0,0
        dat.F 0,0
        dat.F 0,0
        dat.F 0,0
        dat.F 0,0

da:     mov.I <2,>4
        mov.I <-1,<1
        spl.B @0,>4004
        jmp.B -3,>-3

        dat.F 0,0
        dat.F 0,0
        dat.F 0,0
        dat.F 0,0
        dat.F 0,0
        dat.F 0,0

de:     mov.I <2,>4
        mov.I <-1,<1
        spl.B @0,>4804
        jmp.B -3,>-3

        dat.F 0,0
        dat.F 0,0
        dat.F 0,0
        dat.F 0,0
        dat.F 0,0
        dat.F 0,0

dg:     mov.I <2,>4
        mov.I <-1,<1
        spl.B @0,>5604
        jmp.B -3,>-3

        dat.F 0,0
        dat.F 0,0
        dat.F 0,0

cc:     spl.A 1,<-7000
        spl.A 1,<-4500
        spl de

df:     mov.I <2,>4
        mov.I <-1,<1
        spl.B @0,>6404
        jmp.B -3,>-3


        dat.F 0,0
        dat.F 0,0

bomb:   dat <1,<1
        FOR 8
        dat <1,<1
        rof

end st

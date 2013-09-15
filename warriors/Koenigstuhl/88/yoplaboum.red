;redcode quiet
;name Yop La Boum v2.1
;author P.E.M & E.C.
;strategy Cmp, paper, anti imp
;assert 1

cmpinit equ     (-3*68+pas-1)
cmpdist equ     32

pas             dat     #68,#68
addi            sub pas, scan
scan            cmp cmpinit, cmpinit+cmpdist
                slt #fin-addi+cmpdist+1, scan
                jmp     addi

tapis           add #10,scan
                mov pas, <scan
                djn -1, #68+20

paper           spl     paper2
                        
paper1          spl 1
                spl 1
                spl 1
                        
long            mov     #8, 0
copy            mov     <long, <split
split           spl     @0, 2144 + 24 -2
                mov     data+1, <split
                mov     data, <split
ref             jmz     long,long
data            dat     <-2667,<-1143
                jmp     <-1,<-1143

                dat     #data
                dat     #data
                dat     #data
                dat     #data
                dat     #data
                dat     #data
                dat     #data
                dat     #data
                dat     #data
                dat     #data
                dat     #data
                dat     #data
                dat     #data
                dat     #data
                dat     #data
                dat     #data

paper2          spl     1
                spl     1
                spl     1
long2           mov     #8, 0
copy2           mov     <long2, <split2
split2          spl     @0, 2144+24-2
                mov     data2+1, <split2
                mov     data2, <split2
                jmz     long2, long2
data2           dat     <-1143,<-2667
                jmp     <-1,<-2667

                dat     #data
                dat     #data
                dat     #data
                dat     #data
                dat     #data
                dat     #data
                dat     #data
                dat     #data
                dat     #data
                dat     #data
                dat     #data
                dat     #data
                dat     #data
                dat     #data
                dat     #data
                dat     #data
                dat     #data
                dat     #data
                dat     #data
                dat     #data
                dat     #data
                dat     #data
                dat     #data
                dat     #data
                dat     #data
                dat     #data
                dat     #data
                dat     #data
                dat     #data
                dat     #data
                dat     #data
                dat     #data
                dat     #data
                dat     #data
                dat     #data
                dat     #data
                dat     #data
                dat     #data
                dat     #data
                dat     #data
                dat     #data

fin             end     addi

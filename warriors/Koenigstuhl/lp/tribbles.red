;redcode-lp
;name Tribbles
;author Philip Kendall
;strategy Another low process paper
;strategy This time only 5 lines long! Loosely based on
;strategy Ian Sutton's Completely Indestructible
;strategy The smallest one-process paper?
;assert CORESIZE==8000
;planar paper

length  equ     5

dist01  equ     1024
dist02  equ     3158
dist03  equ     6733
dist04  equ     2632
dist05  equ     7525
dist06  equ     5013
dist07  equ     3816
dist08  equ     6111

        dat.a   1,*1
        dat.b   1,*1
        dat.ab  1,*1
        dat.ba  1,*1
        dat.f   1,*1

        for     (MAXLENGTH>=200)
        dat.x   1,*1
        dat.i   1,*1
        dat.a   *1,1
        dat.b   *1,1
        dat.ab  *1,1
        dat.ba  *1,1
        dat.f   *1,1
        dat.x   *1,1
        dat.i   *1,1
        dat.a   *1,*1
        dat.b   *1,*1
        dat.ab  *1,*1
        rof

launch  spl.a   8,>1000         ; binary launch the 8 papers
        spl.a   4,>2000
        spl.a   2,>4000
        jmp.a   copy01,}500
        jmp.a   copy02,}1500
        spl.a   2,>5000
        jmp.a   copy03,}2500
        jmp.a   copy04,}3500
        spl.a   4,>3000
        spl.a   2,>6000
        jmp.a   copy05,}4500
        jmp.a   copy06,}5500
        spl.a   2,>7000
        jmp.a   copy07,}6500
        jmp.a   copy08,}7500

i       for     8

paper&i mov.ab  #length,#length
copy&i  mov.i   <paper&i,<ptr&i
        jmn.b   copy&i,paper&i
ptr&i   spl.a   @paper&i,dist&i
        jmz.b   @ptr&i,paper&i

        dat.a   1,1
        dat.b   1,1
        dat.ab  1,1
        dat.ba  1,1
        dat.f   1,1

        for     (MAXLENGTH>=200)
        dat.x   1,1
        dat.i   1,1
        dat.a   #1,1
        dat.b   #1,1
        dat.ab  #1,1
        dat.ba  #1,1
        dat.f   #1,1
        dat.x   #1,1
        dat.i   #1,1
        dat.a   1,#1
        dat.b   1,#1
        rof

        rof

        end     launch


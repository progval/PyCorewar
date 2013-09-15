;redcode-94 verbose
;name  ^C
;author  Steven Morrell
;strategy  stone, imp, imp-killing 2-pass coreclear
;macro
;assert 1

step equ -1645
d equ 1000

for 2
          dat 1,1
          dat 1,#1
          dat 1,@1
          dat 1,<1
          dat 1,>1
          dat #1,1
          dat #1,#1
          dat #1,@1
          dat #1,<1
          dat #1,>1
          dat @1,1
          dat @1,#1
          dat @1,@1
          dat @1,<1
          dat @1,>1
          dat <1,1
          dat <1,#1
          dat <1,@1
          dat <1,<1
          dat <1,>1
          dat >1,1
          dat >1,#1
          dat >1,@1
          dat >1,<1
          dat >1,>1
rof

start     mov wimp,start+d+20
p         mov bomber+7,start+d
          mov bomber+6,<p
          mov bomber+5,<p
          mov bomber+4,<p
          mov bomber+3,<p
          mov bomber+2,<p
          mov bomber+1,<p
          mov bomber,<p
          mov bonk,start+d-5+4000
          mov incpt,start+d+40
          mov incpt,<-1
          spl b,<start+400
          spl ab,<start+800
          spl aab,<start+1200
          spl @p,<start+1600
          jmp @start,<start+2000
aab       spl imp1,<start+2400
imp0      jmp >0,imp
ab        spl abb,<start+3200
          spl imp3,<start+3600
imp2      jmp >0,imp+(1143*2)
abb       spl imp5,<start+4000
imp4      jmp >0,imp+(1143*4)
b         spl bb,<start+4400
          spl bab,<start+4800
          spl imp0,<start+5200
imp6      jmp >0,imp+(1143*6)
bab       spl imp2,<start+5600
imp1      jmp >0,imp+(1143*1)
bb        spl bbb,<start+6000
          spl imp4,<start+6400
imp3      jmp >0,imp+(1143*3)
bbb       spl imp6,<start+6800
imp5      jmp >0,imp+(1143*5)

bomber    spl #step,<step
          mov <step+2,step+4002
          add -2,-1
          djn.f -2,<-222
          jmz -1,@-200
split     spl #0,<-10
          mov kill,>kill+39
kill      dat <2667,<5334

bonk      mov 2,>44

incpt     dat <0,<3

wimp      jmp #0,>-12

imp       mov.i #7654,1143

end start

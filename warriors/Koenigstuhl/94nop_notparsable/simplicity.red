;redcode-lp
;name Simplicity
;author Anton Marsden
;assert CORESIZE==8000

step EQU 26

b2    mov    step,{b1+8*step
a     add.ab {0,}0
start jmz.f  a,@b2
b1    mov    grave,@b2
      jmn    @b1,*0
      spl    #0,0
      mov    5,}b2
grave jmp    {0,}0

FOR b2+step
      dat    0,0
ROF

bomb  spl    #1,#1

FOR MAXLENGTH-CURLINE
      dat    0,0
ROF

END start


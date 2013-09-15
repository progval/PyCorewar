;redcode-94
;name Eggbeater
;author Anton Marsden
;strategy Mirage 1.5 with spiral clear
;assert CORESIZE==8000

N FOR 7
    spl.i #0,#0
    spl.a #N+(1*8),#N+(1*8)
    spl.f #0,#0
    spl.x #N+(2*8),#N+(2*8)
    spl.b #0,#0
    spl.ab #N+(3*8),#N+(3*8)
    spl.ba #0,#0
    spl.b #N+(4*8),#N+(4*8)
    spl.ab #0,#0
    spl.f #N+(5*8),#N+(5*8)
ROF

FOR 3
    spl.x #0,#0
    spl.a #1,#1
ROF

;-----------------

destdiv2 EQU 2000 ; not really this
dest EQU (2*destdiv2+1) ; odd number :-)

boot: mov.i  bomb,dest
FOR 9
      mov.i  {boot,<boot
ROF
      spl @boot,}2001
      mov.i  {boot,<boot
      dat.f  $0,$0

;-----------------

step EQU 98 ; mod-2
btm EQU (bomb+1)

data: spl.a  #0,>-dest+bomb
pos:  add.ab #step,#0
kill: mov.i  bomb,>data
s:    jmz.f  @0,@pos
c:    slt.b  pos,#btm-data+2
chg:  mov.i  @s,@kill
      jmn.b  pos,*0
      mov.f  #381,<chg
      djn.f  <-2,{chg

next: dat.f  0,btm-data
bomb: spl.a  #0,#0

END boot

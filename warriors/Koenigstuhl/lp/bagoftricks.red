;redcode-lp
;name Bag of Tricks
;author Anton Marsden
;strategy 4 100% coreclears, 4 JMZ scanners
;assert CORESIZE==8000

FOR 0
  This round should be interesting since most players prefer to play in the
  standard environment. I wrote quite a few LP warriors before I realised
  that a general methodology could be applied in creating LP warriors: boot
  8 different single process warriors around the core and hope for the best -
  if one process is killed or stunned the others either 'speed up' or
  continue at the same speed - very durable.

  I have submitted a warrior which contains 4 100% coreclears (DAT/DJN)
  and 4 JMZ scanners. I previously submitted one with 8 coreclears but then
  discovered that oldtimer (a "smart" paper) could thrash it... and now my
  new submission gets thrashed by my old submission :-/

  Now I'll just have to wait and see what JKW comes up with. I'm glad I don't
  have to worry about his imp/stones :-)
ROF


mov.i scan2,@1
add.ab #3044+1,#3044+scan2-2
jmz.a @0,<-1
jmp @0,-3
scan2: jmp #0,#1

mov.i scan3,@1
add.ab #2365+1,#2365+scan3
jmz.a @0,<-1
jmp @0,-3
scan3: jmp #0,#1

chg:  mov.f <next,boot
boot: mov.i scan2,4100
FOR 4
      mov.i {boot,<boot
ROF
next: spl @boot,n+1
dj:   djn.b chg,#6
      spl sc,>-500
      jmp cc,>-1000
      dat clr-boot,6200
      dat clr-boot,2200
      dat clr-boot,4200
      dat scan2-boot,6100
n:    dat scan3-boot,2100

FOR ((MAXLENGTH/2)-18)
      dat 0,0
ROF

sc: mov.i scan,@1
add.ab #3044+1,#3044+scan-1
jmz.a @0,<-1
jmp @0,-3
scan: jmp #0,#1

FOR ((MAXLENGTH/2)-29)
    dat 0,0
ROF

dat 0,10
dat 0,0
dat 0,0
dat 0,0
cc: mov.i 4,>-4
djn.b -1,>-5
spl #0,#1
jmp @0,-3
clr: dat 0,10

FOR 8
      dat 0,0
ROF

END boot


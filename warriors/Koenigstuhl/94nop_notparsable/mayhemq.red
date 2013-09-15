;redcode
;name mayhem.q
;author harleyQ2
;strategy Q^2 -> mayhem
;assert 1


;...Q^2.................................

QBASE equ   (tab+100)
QS1   equ   (100)
QS2   equ   (3*QS1)
QS3   equ   (6*QS2)

QP01  equ   (0*QS2)
QP02  equ   (1*QS2)
QP03  equ   (2*QS2)
QP04  equ   (3*QS2)
QP05  equ   (4*QS2)
QP06  equ   (5*QS2)

HOP01 equ   jmp
SIG01 equ   a01
HOP02 equ   jmp
SIG02 equ   {a01
HOP03 equ   jmp
SIG03 equ   }a01
HOP04 equ   jmp
SIG04 equ   >a01
HOP05 equ   jmp
SIG05 equ   <a01
HOP06 equ   djn.f
SIG06 equ   a01

  org   qq

qq
j     for   3
i     for   6
      sne   QBASE+QP&i+0*QS3+(j-1)*QS1,   QBASE+QP&i+1*QS3+(j-1)*QS1
      seq   QBASE+QP&i+2*QS3+(j-1)*QS1,   QBASE+QP&i+3*QS3+(j-1)*QS1
      HOP&i a&j,  SIG&i
      rof
      rof
      jmp.x cccsbt, <-99

      dat   1*QS2,   4*QS2+QBASE-found
tab   dat   0*QS2,   0*QS2+QBASE-found
      dat   2*QS2,   3*QS2+QBASE-found

a03   add   #QS1, @a01
a02   add   #QS1, @a01
a01   add.ab   tab,  tab
found mov.b @a01, #0
      add.ba   found,   test1
test1 sne   QS3+found,@found
      add   #QS3*2,  found
      sne   -100, @found
      add   #QS3, found

;qattack................................

qhnum equ 33

      mov.b found, qhp
qhit  mov.i bomb, >found
      mov.i bomb, <qhp
      mov.i bomb, >found
      mov.i bomb, <qhp
      mov.i bomb, >found
      mov.i bomb, <qhp
      djn.b qhit, #qhnum
qhp   jmp.x cccsbt, #0
bomb  spl.x #0, {0


;boot mayhem............................

g       equ ccsp-11
last    equ 8
off     equ 2513

cccsbt  mov.i }p, >p
        mov.i }p, >p
        mov.i }p, >p
        djn.b cccsbt, #5
        jmp.x scan+off, >p
p       spl.x #inc, #inc+off

inc     spl.x #20, #20
        add.f inc, scan
scan    sne.x train+10, train+20
        djn.x -2, <g
        mov.ab scan, ccsp
        jmp.x cccs, <g

ccsp    spl.x #cccs, #last
sb      spl.x #2, #last
sd      dat.x #3, #last
cccs    spl.x #1, #last
ccs     mov.i *ccsp, >ccsp
        mov.i *ccsp, >ccsp
        mov.i *ccsp, >ccsp
train   djn.x ccs, <g

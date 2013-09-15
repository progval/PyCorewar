;redcode-b
;author Franz
;name Neverending Brutality 7
;strategy Quickscan/Brainwasher/Pittrapper/Coreclear/IMPgate:
;strategy ----------------------------------------------------------------
;strategy 1) Quickscan (new in v7)
;strategy 2) boots up to 5 different locations in core, 2 data 1 coreclear
;strategy    1 trapper, 1 pit
;strategy 3) starts trapper (modulo 5, nonsplitting)
;strategy 4) when done calls coreclear routine to kill the enemy
;strategy 5) converts to 150% c IMP gate
;strategy ----------------------------------------------------------------
;strategy the pit is a SPL only pit that tries to cripple the enemy asap
;strategy in spare time the pit brainwashes pspace type enemies
;url http://www.azstarnet.com/~franz
;assert CORESIZE==8000

opt EQU 2365
pit EQU trapper

INSTALLT EQU 2000
INSTALLC EQU -3000
INSTALLP EQU -2700
INSTALLB EQU 1500

;
;Q^2 type quickscan
;

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
j  for   3
i  for   6
      sne   QBASE+QP&i+0*QS3+(j-1)*QS1,   QBASE+QP&i+1*QS3+(j-1)*QS1
      seq   QBASE+QP&i+2*QS3+(j-1)*QS1,   QBASE+QP&i+3*QS3+(j-1)*QS1
      HOP&i a&j,  SIG&i
   rof
   rof
      jmp   boot     ;nothing found
 
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


;boot pit
boot		MOV coreclr,pit+INSTALLP        ;boot
		MOV p2,pit+1+INSTALLP           ;tried to compress
		MOV p3,pit+2+INSTALLP           ;it as much as I
		MOV p4,pit+3+INSTALLP           ;could

;boot trapper
		MOV trapper,trapper+INSTALLT
		MOV tr2,tr2+INSTALLT
		MOV tr3,tr3+INSTALLT
		MOV tr4,tr4+INSTALLT

;boot coreclear
		MOV coreclr,coreclr+INSTALLC
		MOV cc2,cc2+INSTALLC
		MOV cc3,cc2+1+INSTALLC
		MOV bombstart,cc2+2+INSTALLC

;boot the bomb
		MOV bomb,bomb+INSTALLB

;jump to trapper and lets begin
		JMP trapper+INSTALLT

;this is the actual code being booted ...
bomb DJN.F bombstart-INSTALLT+pit-opt+INSTALLP,<bombstart-INSTALLB+INSTALLT+opt
bombstart	DAT <-1-80,<-(opt+1)


;this is where the trapping takes place (33% c)

trapper		MOV bomb-INSTALLT+INSTALLB,@bomb-INSTALLT+INSTALLB
tr2		SUB coreclr-INSTALLT+INSTALLC,bomb-INSTALLT+INSTALLB
tr3		JMZ trapper,bombstart
tr4		DJN coreclr-INSTALLT+INSTALLC,<trapper-81

;the source for pit and coreclr ... kindda squished together ... see
;the boot routine to see how they go together ...

p4		JMP -3,>-1

coreclr		SPL #opt,<-opt
cc2		MOV 2,<coreclr-5
p2		SPL -1,{1
p3		STP.AB #-66,#0

cc3		DJN.F -1,<-83

bottom		END


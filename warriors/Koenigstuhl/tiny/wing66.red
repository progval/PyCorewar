;redcode-94
;name WingShot 0.66
;author Ben Ford
;strategy 0.66c BiShot-style oneshot
;assert !(CORESIZE%10) && (MAXLENGTH>=20)

start equ oscn

oinc equ 10
oset equ (10*((MAXLENGTH+MINDISTANCE)/10)+1)
odif equ (10*(CORESIZE/20))
otic equ (CORESIZE/10)

ofnd add.f oadd, optr
oscn sne.i *optr, @optr
     djn   ofnd, #otic
     djn.f ospl, @oscn
oadd dat   #oinc, #oinc

for 10*((MAXLENGTH-20)/10)
     dat   0, 0
rof

     dat   0, 0  ; scanned hi
     dat   0, 0
     dat   0, 0
optr spl   {oset, >odif+oset-4
     dat   0, 0  ; scanned lo

     dat   {10, >odif
ospl spl   #10, <-MINDISTANCE
oclr mov   ospl, }optr
     mov   ospl, >optr
obmb djn.a oclr, <ospl

     end   start

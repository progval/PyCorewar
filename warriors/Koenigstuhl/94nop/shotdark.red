;redcode-94m
;name Shot in the dark
;author Brian Haskin
;strategy clear with all our might
;assert 1

 org bt

BDIST equ -300

bt mov lst, BDIST
for 5
 mov {bt, <bt
rof
 jmp BDIST+bt-2


 spl #1, #5
ptr dat -1,-BDIST
 dat 1, 5
clr mov.i *ptr, >ptr
 mov.i *ptr, >ptr
lst jmp clr, >ptr-2
 end

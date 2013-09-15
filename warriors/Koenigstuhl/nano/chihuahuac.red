;redcode-imt2
;name Chihuahua Chalupa
;author David Moore
;assert 1
;CORESIZE==80 && MAXLENGTH==4 && MINDISTANCE==4 && MAXPROCESSES==80

aaa equ ((CORESIZE/3)+1)

spl #0, 0
spl @0, >(aaa+1)
mov.i }-1, >-1
mov.i #1, aaa


;redcode-94
;name OK
;author Simon Glanville
;strategy Simple Bomber/Imp V1
;assert CORESIZE % 80 == 0

	spl	x
clearc	djn	0,<-4
imp	mov.i	0, +1
x	JMZ	imp,data
data	JMP	x


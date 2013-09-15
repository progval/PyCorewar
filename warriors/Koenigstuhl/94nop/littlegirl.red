;redcode-94
;name Little Girl
;author Sheep
;strategy Some Kind of paper.
;assert 1

OFF1	equ	4912
OFF2	equ	-2212
DIFF	equ	100
BMB	equ	-450
GRAP	equ	-1020

start	spl	1, <-1000
	mov	-1, 0
	mov	-1, 0

	spl	silk2
	
silk1	spl	@0, OFF1
	mov.i	}silk1, >silk1
	mov.i	{BMB, }(BMB-45)	
	add.ab	#DIFF, silk1	
	jmp	silk1, {silk1	

silk2	spl	@0, OFF2
	mov.i	}silk2, >silk2
	mov.i	{BMB, }(BMB-45)
	add.ab	#-DIFF, silk2
	jmp	silk2, {silk2

	end start
		

	
	
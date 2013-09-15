;redcode
;name Splice 2000
;author Morton
;strategy My first half-decent warrior.
;assert   CORESIZE == 8000 && MAXLENGTH >= 100

 	spl 0
xm1  	add 3, #20
 	mov xm1, #20
 	mov xm2, #10
 	mov xm3, #25
 	jmp -3

xm2 	add 2, #3
 	mov xm3,#2
 	mov xm3,#-2
 	jmp -2

xm3 	dat #1,#1
 	dat #1,#1
 	dat #1,#1

	end


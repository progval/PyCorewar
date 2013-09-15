;redcode-94b
;name 1,000lb weight
;author Ross Morgan-Linial
;assert CORESIZE==8000
;strategy Simple bomber -> coreclear -> imp gate

start	mov 	b+1, 		@1
	add.ab 	#2364, 		#3
	mov 	b, 		>-1
	jmp 	start
clear	mov.i 	cbom, 		<-5
	jmp   	clear, 		<-32
cbom	dat   	<-31, 		<-31
b	spl   	0, 		<-30
	jmp  	-1, 		<-31

end	start


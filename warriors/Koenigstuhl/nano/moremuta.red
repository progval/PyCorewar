;redcode-nano
;name More mutated beast
;author Neo
;assert CORESIZE==80
;strategy 5-line evolved-style clearing paper

	dest equ 24

start:	spl #0,<-5
	spl dest,<-1
	mov.i }-2,}-1 ;>-2
	mov.i }-3,}-2
	djn.f -2,<-15

	end start

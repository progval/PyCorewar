;redcode-nano
;name Nanoni
;author Neo
;assert CORESIZE==80
;strategy dwarf

start:	spl #-6,<-6
	mov <5,8
	sub.f start,-1
	djn.f -2,<-9
	mov.i #1,1

	end start

;redcode-nano
;name Nano-sniper
;author Neo
;assert CORESIZE==80
;strategy one-shot

bmb:	spl #5,7
ptr:	add.ab -1,#10
scan:	jmz.f ptr,@ptr
	mov *ptr,>ptr
	djn.f -1,{ptr-8

end scan

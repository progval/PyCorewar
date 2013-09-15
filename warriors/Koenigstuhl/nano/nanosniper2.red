;redcode-nano
;name Nano-sniper II
;author Neo
;assert CORESIZE==80
;strategy SD-oneshot scanner

bmb:	spl #6,7	;5,7
ptr:	add.ab -1,#10
scan:	jmz.f ptr,@ptr
	mov *ptr,>ptr
	djn.f -1,{ptr-8

end scan


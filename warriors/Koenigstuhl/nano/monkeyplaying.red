;redcode-nano
;name Monkey playing in a crane cab
;author G.Labarga
;assert CORESIZE==80
;strategy scanner

sta:	add #4,#10
	jmz.f -1,>sta
	mov bm,<sta
	jmp -2,<sta
bm:	mov >3,1
end sta+1


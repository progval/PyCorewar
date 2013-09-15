;redcode-nano
;name Afterburner
;author Neo
;assert CORESIZE==80
;strategy DAT incendiary bomber

loop:	mov bm,@ref
ref:	mov bm,*8	;@13
	add #10,ref
	jmp loop,<-7
bm:	mov {5,}-10	;mov.i #5,1	;1,}-5	;mov >0,-5 ;mov }-5,*-5


end loop

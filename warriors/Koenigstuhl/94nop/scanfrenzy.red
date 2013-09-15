;redcode-94nop
;name scan frenzy
;strategy test pvk's b-scanning hypothesis
;author Lukasz Grabun, MJP
;assert 1

gate	equ	(top-4)
step	equ	2936

top	add	#2*step,ptr
	mov	stun,@ptr
ptr	mov	stun,*1
	jmz.b	top,{bmb
stun	spl	#step,0
	mov	bmb,>gate
	djn.f	-1,>gate
bmb	dat	499,2-gate

z for MAXLENGTH-CURLINE-9
  dat 0,0
rof
go	mov	bmb,top+2000+8
z for 7
	mov	{go,<go
rof
	jmp	@go
	end	go


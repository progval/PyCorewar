;redcode-94nop
;name airbag frenzy
;author Lukasz Grabun, MJP
;strategy testing the airbag hypothesis (mjp)
;assert 1

gate	equ	(top-4)
step	equ	2936 ; 2930

top
	add	#2*step,ptr
	mov	stun,@ptr
ptr	mov	}ck,@ck-1
	jmz.a	top,{ck
ck stun	spl	#0,step
	mov	bmb,>gate
	djn.f	-1,>gate
bmb	dat	<-5,2-gate


z for MAXLENGTH-CURLINE-7
  dat 0,0
rof
go	spl	2
psrc	spl	2,top+10
pdest	spl	1,top+10+2000
	mov	<psrc, <pdest
	mov	<psrc, <pdest
	djn	>pdest,#5
	jmp	top+2001
	end	go


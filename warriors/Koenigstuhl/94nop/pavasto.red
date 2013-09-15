;redcode
;name PaVaSto
; (paper/vampire/stone)
;author Lukasz Adamowski
; <adamow@if.pw.edu.pl>
;assert 1

X	for	MAXLENGTH-10
	jmp	$(X-MAXLENGTH+9)*5+3,	$0
	rof
	dat	$0,	$0
start	add	#5,	$0
	mov	<-1,	{3
	jmn	$-1,	$-2
	spl	{-1,	{-2
	jmp	$1033,	>-4
	dat	$0,	$0
	mov	$-6,	<-7
	spl	$0,	$0
	end	start

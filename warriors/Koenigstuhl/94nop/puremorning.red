;redcode
;name Pure Morning
;author Lukasz Adamowski
;assert CORESIZE==8000

start	spl	#30,	#-30
	add.f	$-1,	$1
	sne	$1,	$6
	dat	$0,	$0
	mov.f	$-2,	$-1
	sub.f	$-5,	$-2
	mov	$-3,	{-3
	mov	$-4,	<-4
	end	start


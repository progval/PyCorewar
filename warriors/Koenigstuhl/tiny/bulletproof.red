;redcode
;name Bulletproof
;author Lukasz Adamowski
;assert 1

STEP	equ	12

trg	dat	$0,	$0
	FOR	11
	dat	$0,	$0
	ROF
start	spl	#0,	<trg
	add	#STEP+2,	$trg
	mov	$bmb,	<trg
	add	#STEP+2,	$trg
	mov	$bmb,	<trg
	djn	$-2,	<trg
bmb	dat	}3,	<267
	end	start




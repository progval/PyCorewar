;redcode
;name Entry Two
;author Lukasz Adamowski
;assert 1

x	FOR	8
	mov	<20+x*80,	<60+x*80
	mov	<x*80,	<40+x*80
	ROF
	spl	#0,	{-40
	mov	$3,	{-41
	mov	$-2,	{-42
	djn	$-2,	{-43


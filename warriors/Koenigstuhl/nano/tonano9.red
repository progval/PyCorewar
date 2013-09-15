;redcode-nano
;name Taking Over Nano IX
;author Jens Gutzeit
;strategy Taking over the nano hill
;assert CORESIZE == 80

	ORG	go

	dat.f  < 76,	< 60
go      spl.x  #  0,	{ 51
        mov.i  @  0,	{ 78
        mov.i  > 53,	{ 49
        djn.f  $ 78,	< 31

	END


;redcode-94b
;assert 1
;name MegaBunnies
;author WolfWings
;strategy Timescape-based, a little re-arranged. }:>

	ORG	start
start:	spl.b	1,	<-200
	spl.b	1,	<-300
	spl.b	1,	<-400
	spl.b	@0,	}1800
	mov.i	}-1,	>-1
	spl.b	@0,	}3740
	mov.i	}-1,	>-1
	mov.i	>2000,	}4000
	mov.i	{6000,	<4000
	mov.i	{-3,	<1
	jmp.b	@0,	>-1922
	END

;redcode
;name trident
;author Anders Ivner
;strategy Three imps are better than one :-)
;assert CORESIZE==8000
start	mov	imp,		imp-2667
	spl	imp-2667
	spl	imp+2667
imp	mov	0,		2667
	end	start

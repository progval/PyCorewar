;redcode-94x
;name Venom
;author Ben Ford
;assert 1
;strategy paper

start	equ	paper

paper	spl	    2,	< 200
	spl	    1,	< 400
	spl	    1,	< 600

pap0	spl.b	@   0,	< 102
	mov.i	}pap0,	>pap0
	mov.i	}pap0,	>pap0
pap1	spl.b	@   0,	< 305
	mov.i	}pap1,	>pap1
	mov.i	 pbmb,	} 468
	mov.i	{pap1,	{pap2
pap2	jmz.a	  350,	*   0
pbmb	dat.f	<   1,	{   1

end	start

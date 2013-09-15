;redcode
;name Mimp
;author Ben Ford
;assert MAXPROCESSES==8
;strategy lets see if I can surprise anyone with imps,
;strategy mirrored imps, that is
;strategy
;strategy throw in a q-scan for fun

half	equ	(CORESIZE/2)
imp2	equ	((CORESIZE/2)+mimp)
minc	equ	((CORESIZE/2)+1)

morg	mov	 mimp,	 imp2
	spl	    1,	$   0
	spl	    1,	$   0
	spl	    2,	$   0
	jmp	@mvec,	{   0
	jmp	*mvec,	{   0

	jmp	 imp2+minc*mvec,  mimp+minc*mvec
	jmp	 imp2+minc*mvec,  mimp+minc*mvec
	jmp	 imp2+minc*mvec,  mimp+minc*mvec
mvec	jmp	 imp2,	 mimp
;mimp	mov.i	 half,	 minc
mimp	mov.i	#  11,	 minc
;mimp	mov.i	#minc,	}   0

	for 54
	dat	0		, 0
	rof

qf  equ  qKil
qs  equ  240
qd  equ  half
qi  equ  7
qr  equ  8

qGo   seq    qd+qf+qs    	, qf+qs           ; 1
      djn.f  qSki        	, {qd+qf+qs+qi+2
      sne    qd+qf+5*qs  	, qf+5*qs         ; B+1
      seq    qf+4*qs     	, <qTab           ; B
      jmp    qFas        	, >qTab
      sne    qd+qf+8*qs  	, qf+8*qs         ; A
      seq    qf+7*qs     	, <qTab-1         ; A-1
      jmp    qFas        	, {qFas
      sne    qd+qf+10*qs 	, qf+10*qs        ; C
      seq    qf+9*qs     	, <qTab+1         ; C-1
      jmp    qFas        	, }qFas
      seq    qd+qf+2*qs  	, qf+2*qs         ; B-2
      jmp    qFas        	, <qTab
      seq    qd+qf+6*qs  	, qf+6*qs         ; A-2
      djn.b  qFas        	, {qFas
      sne    qd+qf+3*qs  	, qf+3*qs         ; B-1
      jmz.f  morg         	, qd+qf+12*qs-qi  ; Free Scan ;-)

qFas  mul.b  qTab        	, qKil
qSki  sne    <1000       	, @qKil
      add    #qd         	, qKil
qLoo  mov.i  qBmb        	, @qKil
qKil  mov.i  qBmb        	, *qs
      sub.ab #qi         	, qKil
      djn    qLoo        	, #qr
dDest djn.f  morg        	, #7708  ; A*qs =  8*qs
qTab  dat    {qi*qr-10   	, 7704   ; B*qs =  4*qs
qBmb  dat    {qi*qr-10   	, 7710   ; C*qs = 10*qs


end qGo


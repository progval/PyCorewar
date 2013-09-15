;redcode-94
;name Stunner
;author Sascha Zapf
;assert CORESIZE==800
;strategy Fast Incendiary Bomber, Twopass Coreclear
;strategy Two Bombing steps, Bootstrapping

	backstart	EQU	adder+1
	forestart	EQU	adder+1+5
	splpos		EQU	movb+199+100
	movpos		EQU	movb+198+100

movb	mov.i	-1,		}-1
splb	spl	#2,		#loop+100	; Erste hälfte der SPL-Bomb
	spl	#-1,		-7
	mov.i	*ccb+1,		<ccb+1
	mov.i	*ccb+1,		<ccb+1
ccb	dat	-1,		-7
	dat	-4,		-7		; Incendiary Stone starten, Quellzeiger Bootstrapping
bloop	mov.i	>oldblop,	>oldccb
	mov.i	}bclear,	>splb
	djn.b	bloop, 		#8
oldccb	jmp	loop+100,	#movpos
bclear  dat	loop, 0				; B-Feld leer
loop	mov.i	splpos-100, 	*posmov		; Erste splb A-Indirekt ( Backcarpet )
	mov.i	}posmov, 	>posmov		; splb kopieren ( Forewardcarpet )
	mov.i	movpos-100,	*posmov		; erste movb A-Indirekt ( Backcarpet )
posmov	mov.i	backstart,	forestart	; movb kopieren ( Forewardcarpet )
	add.f	adder,		posmov
	djn.b   loop,		#78
oldblop	jmp.i	splpos-100,	#movb		; weggebootet CC starten.
adder	dat.f	#310-1,		#10-1		; Stepsize

	end	bloop


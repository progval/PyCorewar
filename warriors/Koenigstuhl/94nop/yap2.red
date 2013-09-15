;redcode-94nop verbose
;name Yet Another Paper II
;author Jens Gutzeit
;strategy q^2 -> paper
;strategy Better quickscan and bombing engine
;assert CORESIZE == 8000

	ORG	qGo

	pStep1	EQU	3913
	pStep2	EQU	3035

boot	spl	1
	spl	1

silk1	spl	@ silk1,	< pStep1
	mov.i	} silk1,	> silk1

	mov.i	{ silk1,	< silk2
silk2	djn.f	@ silk2,	< pStep2

;;
;; quickscanner
;;

	start	EQU	boot	      ; first instruction of warrior
	qStart	EQU	(start + 200) ; first scanned position
	qSpace	EQU	7700	      ; space to cover with quickscan
	qNum	EQU	18	      ; number of scans
	qStep	EQU	(qSpace/qNum) ; distance between two scans
	qHop	EQU	(qStep/2)     ; distance between two scan positions

for 47
	dat.f	0,		0
rof

qGo	sne.i	qStart+0*qStep+0*qHop,	qStart+0*qStep+1*qHop
	seq.i	qStart+0*qStep+2*qHop,	qStart+0*qStep+3*qHop
	jmp	attack1,		0

	sne.i	qStart+2*qStep+0*qHop,	qStart+2*qStep+1*qHop
	seq.i	qStart+2*qStep+2*qHop,	qStart+2*qStep+3*qHop
	jmp	attack1,		{ attack1
	
	sne.i	qStart+4*qStep+0*qHop,	qStart+4*qStep+1*qHop
	seq.i	qStart+4*qStep+2*qHop,	qStart+4*qStep+3*qHop
	jmp	attack1,		} attack1

	sne.i	qStart+6*qStep+0*qHop,	qStart+6*qStep+1*qHop
	seq.i	qStart+6*qStep+2*qHop,	qStart+6*qStep+3*qHop
	jmp	attack1,		> attack1
	
	sne.i	qStart+8*qStep+0*qHop,	qStart+8*qStep+1*qHop
	seq.i	qStart+8*qStep+2*qHop,	qStart+8*qStep+3*qHop
	jmp	attack1,		< attack1

	sne.i	qStart+10*qStep+0*qHop,	qStart+10*qStep+1*qHop
	seq.i	qStart+10*qStep+2*qHop,	qStart+10*qStep+3*qHop
	djn.f	attack1,		attack1

	sne.i	qStart+12*qStep+0*qHop,	qStart+12*qStep+1*qHop
	seq.i	qStart+12*qStep+2*qHop,	qStart+12*qStep+3*qHop
	jmp	attack2,		0

	sne.i	qStart+14*qStep+0*qHop,	qStart+14*qStep+1*qHop
	seq.i	qStart+14*qStep+2*qHop,	qStart+14*qStep+3*qHop
	jmp	attack2,		{ attack1

	sne.i	qStart+16*qStep+0*qHop,	qStart+16*qStep+1*qHop
	seq.i	qStart+16*qStep+2*qHop,	qStart+16*qStep+3*qHop
	jmp	attack2,		} attack1

	jmp	boot

;; choose target

	dat.f	2*qStep,	qStart+8*qStep-found
qTab	dat.f	0*qStep,	qStart+0*qStep-found
	dat.f	4*qStep,	qStart+6*qStep-found

attack2 add.ab	# 12*qStep,	found
attack1	add.ab	qTab,		qTab
	add.b	@ attack1,	found

;; choose between the four possible positions

find	seq.i	(start - 1),	@ found
	jmp	adjust
	add.ab	# qHop,		found
	djn	find,		# 4

;; bombing engine IV

	qTimes	EQU	20		   ; number of bombs to throw
	qStep2	EQU	4

adjust	add.ba	found,		found

throw	mov.i	qBomb,		@ found
	mov.i	qBomb,		* found
found	mov.i	-qStep2,	@ found
	add.f	incr,		found
	djn.b	throw,		# 20

	jmp	boot

qBomb	dat.f	# 0,		# qStep2
incr	dat.f	# -qStep2,	# 2*qStep2

	END


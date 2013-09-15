;redcode-94
;name Yet Another Paper
;version 1.0.0
;author Jens Gutzeit
;strategy quickscan -> paper
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
;; quickscan
;;

	start	EQU	boot		; first instruction of this warrior
	qStart	EQU	(start + 230)	; first scaned position
	qSpace	EQU	7700		; space to cover with quickscan
	qNum	EQU	10		; number of scans
	qStep	EQU	(qSpace/(2*qNum)); distance between two scans
	qHop	EQU	(qStep/2)	; distance betweens two scan positions

;; put as much space between the paper and the quickscan as possible

for (81 - 3 * qNum)
	dat.f	0,		0
rof

qGo

i for 2
	sne.i	qStart+(2*i-2)*qStep,qStart+(2*i-2)*qStep+qHop
	seq.i	qStart+(2*i-2)*qStep+2*qHop,qStart+(2*i-2)*qStep+3*qHop
	mov.ab	# qStart+(2*i-2)*qStep-found,	found
rof

	jmn	find,		found	; early attack

i for 3
	sne.i	qStart+(2*i+2)*qStep,qStart+(2*i+2)*qStep+qHop
	seq.i	qStart+(2*i+2)*qStep+2*qHop,qStart+(2*i+2)*qStep+3*qHop
	mov.ab	# qStart+(2*i+2)*qStep-found,	found
rof

	jmn	find,		found	; early attack

i for (qNum - 5)
	sne.i	qStart+(2*i+8)*qStep,qStart+(2*i+8)*qStep+qHop
	seq.i	qStart+(2*i+8)*qStep+2*qHop,qStart+(2*i+8)*qStep+3*qHop
	mov.ab	# qStart+(2*i+8)*qStep-found,	found
rof

found	jmz	boot,		# 0	; B-Field not 0 -> quickscan found sth.

	qTimes	EQU	20		; number of bombs to throw
	bDist	EQU	80		; target range
	qStep2	EQU	(bDist/qTimes + 1)

;; select between the four scan positions

find	seq.i	(start - 1),	@ found
	jmp	adjust
	add.ab	# qHop,		found
	djn	find,		# 4

adjust	add.ab	# (bDist/2),	found	; start with bombing from above

;; bomb target

attack	mov.i	qBomb,		@ found
	sub.ab	# qStep2,	found
	djn	attack,		# qTimes
	jmp	boot

qBomb	dat.f	# 1,		# 1

	END


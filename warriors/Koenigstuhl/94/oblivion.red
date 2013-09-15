;redcode-94 verbose
;name Oblivion
;author Ian Sutton
;strategy pspacer with 2 components:
;strategy
;strategy 1. Carbonite, a mod-2 super dwarf with suicidal coreclear
;strategy 2. Pluto, a one shot with anti imp coreclear
;strategy
;strategy Muhahahahahahahahahahaha! :)
;assert	CORESIZE==8000

OFFSET	equ	94

_result	equ	0
_strategy	equ	1
_status	equ	2

tolerance	equ	4	; just how many losses are we going to allow?


bootdist	equ	-300	; trust me, it's unchanged

STEP	equ 12
ST 	equ (scan+8-STEP*2*300)

	ORG	start

;;;;;;;;;;;;;
;           ;
; Pluto	    ;
;           ;
;;;;;;;;;;;;;

ptr	dat.f   3, 20
b2	dat.f   <2667, <2667*2
	spl     #1,<10
cclear 	spl     #2,<10
	mov.i   *ptr,>ptr
	mov.i   *ptr,>ptr
dj	djn	-2, <-100

	for	13
	dat	0, 0
	rof

incr	dat	#STEP*2, #STEP*2
	jmp	cclear, }dj
seeker	add	incr, scan
scan	sne	ST+STEP, ST
	jmp	-2, <-30
	mov.ab	scan, ptr
	jmp	cclear

plboot
i	for     7
	mov	}sptr2, }dptr2
	rof
	for     7
	mov	>sptr2, >dptr2
	rof

	spl	dptr2+bootdist+seeker-ptr, <-400

	mov	dbomb, dptr2

dptr2	dat	bootdist, bootdist+incr-ptr
sptr2	dat	ptr, incr

psres	dat	0,0

start
	ldp.a	#_strategy, go
	ldp	#_result, psres
	sne	#0, psres
	jmp	lost
	seq	#1, psres
	ldp.a	#_status, stat		; if tied, status is unchanged
	jmp	stat

; OK, at this point we lost the last match
; check to see just how badly we are getting our butt kicked
lost
	ldp.a	#_status, stat
	add.a	#1, stat
	slt.a	#tolerance-1, stat
	jmp	stat
; We are losing BADLY!!!
; switch strategy and reset status
	add.a	#1, go
	mov.a	#0, stat

stat	stp	#0, #_status

	stp.ab	go, #_strategy
	mod.a	#2, go

go	jmp	@0, boot
	dat	0, plboot

;;;;;;;;;;;;;
;           ;
; Carbonite ;
;           ;
;;;;;;;;;;;;;

boot
	mov	}sptr, }dptr
	mov	}sptr, }dptr
	mov	}sptr, }dptr
	mov	}sptr, }dptr

	mov	>sptr, >dptr

	spl	dptr+bootdist, <-400

	mov	dbomb, dptr

dptr	dat	bootdist, bootdist+dbomb-scopy
sptr	dat	scopy, dbomb

dbomb	dat	>-1, >1

	for	14
	dat	0,0
	rof

scopy
	spl	#0, <-100
	mov	dbomb, tar-197*3500
tar	add	#197, -1		; gets bombed to start coreclear
	djn.f	-2, <-1151
ecopy

	end

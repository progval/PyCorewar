;redcode-94
;name The Bloodhound
;author Ian Sutton
;strategy A one shot.  No Pspace this time, but assorted other sneaky tricks.
;strategy v1.0
;strategy v1.1 Same as v1.0 but commented
;assert CORESIZE == 8000

stscan	equ	(hit1-step*500)
step	equ     15	;\ these MUST be the same or the one shot will be out
qbstep	equ	15      ;/ of sync and we will scan ourself too quickly after
			;  booting.

startq	equ	(ptr+step*20)
qstep	equ	(7*step)	; multiple of step to keep spacing right

	org	qscan

; ----------one shot-----------
; We put this before the slow scan code, otherwise we fall easy prey
; to some other scanners like The Machine

ptr	dat	stscan+step, stscan
	dat	0,0
hit1	dat	0,0
	dat     #-85, 16
	dat     #-85, 16
bombs	spl     #-85, 16
	dat	0,0
nxt	add	incr, ptr
scanner sne     *ptr, @ptr
	jmp	nxt
	sub	#14, ptr
incr    spl	#step*2, >step*2
cc      mov   	@dj, >ptr
	mov   	@dj, >ptr
dj	djn.b	cc, {bombs
	dat	0,0
	dat	0,0
hit2	dat	0,0

	for	44
	dat	0,0
	rof

hit3	dat	0, 0

; ----------"quick" (slow) scan--------------
; scan core mod qstep at 0.8c
; could trim a few instructions here, for additional anti Q resistance

qbomb	dat	#1, 1
qptr	dat	startq, startq+qstep
qbinc	dat	qbstep, -qbstep
qinc	dat	qstep*2, qstep*2
qnxt	add	qinc, qptr
qscan	sne	*qptr, @qptr
	add	qinc, qptr
	sne	*qptr, @qptr
qdj	djn	qnxt, #12
	jmz.b	scanner, -1	; if couldn't find anything, straight to scan
	jmz.f	qok, *qptr
	mov.ab	qptr, qptr
	jmp	qok+1

	dat	0, 0
hit4	dat	0, 0

; bomb 4 times each way mod 15
; similarly to probe's Q scan.
; Maybe worthwhile skipping bombing code if it took us a long time to
; find the enemy. (Save about 20 cycles, less vulnerable to other Qs)
qok	mov.ba	qptr, qptr
	mov	qbomb, @qptr
qbloop	add	qbinc, qptr
	mov	qbomb, @qptr
	mov	qbomb, *qptr
	djn	qbloop, #4
	add	qinc, qptr	; move boot ptr after found code
	jmn.f	scanner, @qptr	; make sure there is nothing there,
				; otherwise we might end up in the
				; middle of replicator imps!

; slow boot takes 20 cycles instead of ~15, but
; is worth it for brevity.
cnxt	mov	>pcopy, >qptr
	mov	>pcopy, >qptr
	mov	>pcopy, >qptr
	djn	cnxt, #5
	sub	#7, qptr
pcopy	jmp	@qptr, ptr

hit5	dat	0, 0

for MAXLENGTH-CURLINE
	dat     0, 0
rof

	end

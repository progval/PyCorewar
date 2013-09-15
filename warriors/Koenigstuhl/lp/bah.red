;redcode-94lp
;name Bah
;author Planar
;assert CORESIZE==8000 && MAXPROCESSES==8
;strategy Does it really eliminate imps ?

step	equ	2667
point	equ	(start+1000)

start	mov	imp, point

	spl	r,            <-50
l	spl	lr,           <-100
ll	spl	llr,          <-150
lll	jmp	point+0*step, <-200
llr	jmp	point+1*step, <-250
lr	spl	lrr,          <-300
lrl	jmp	point+2*step, <-350
lrr	jmp	point+3*step, <-400
r	spl	rr,           <-450
rl	spl	rlr,          <-500
rll	jmp	point+4*step, <-550
rlr	jmp	point+5*step, <-600
rr	spl	rrr,          <-650
rrl	jmp	point+6*step, <-700
rrr	jmp	point+7*step, <-750

imp	mov.i	#-3, imp+step

i FOR MAXLENGTH-CURLINE
	spl	#42, i
ROF; i

	end


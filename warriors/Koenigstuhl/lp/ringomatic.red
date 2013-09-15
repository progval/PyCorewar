;redcode-lp
;name The Ring'o matic
;author G.Labarga
;assert MAXPROCESSES==8
;strategy	Only imp warrior
;
; Partial b-imp spiral protected by three one-point imps against B-gates
; A-fields were chosen to improve the score against Revenge of the 
; Silklander

imp3:	mov.i #-581,2667

boot:	mov imp1,*mgo
	mov imp1,@mgo-1
	mov imp1,{mgo
	mov imp1,<mgo-1
	spl 1,1
	spl 1,1
	spl 2,1		;vector launch, ("vortex"?)
	jmp @mgo,{0
	jmp *mgo,{0

vector:	dat }imp3+2668,}imp3+1
	dat }imp3+5334,}imp3+2667
	dat }imp3,}imp1+5334+1
mgo:	dat }imp1+2667+1,}imp1
for 10
	dat 0,0
rof
imp1:	mov.i #-581,2
	mov.i #-581,2
for 40 				;decoy
	dat }-581,{1100
rof
for (MAXLENGTH-CURLINE)
	dat 0,0
rof
	end boot


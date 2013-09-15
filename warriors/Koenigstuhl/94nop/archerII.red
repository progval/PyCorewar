;redcode-94
;name Archer II
;author Franz
;strategy 66% f.scan oneshot ... with some instant damage ... mod-4 now
;strategy using add/sub/jmz scan and d-clear
;assert CORESIZE==8000

sstep	equ 2936
stscn	equ (step+sstep) 

	org scan

step	dat.f sstep,sstep  ;this will be found

ptr	dat stscn+4,stscn  ;dclear is here to kill some imps
	dat 0,0
	dat 0,0

	dat 0,0

loop	add.f step, @scan+1  ;slight decrement protection
scan	sub.f *ptr,@ptr
	jmz.f loop,@ptr

wipe	spl #0,<0            ;invisible (will have decrement on -1 line
			     ;will it help???? )
	mov bomb,>ptr
	djn.f wipe+1,>ptr
bomb	dat >5334,20

	end


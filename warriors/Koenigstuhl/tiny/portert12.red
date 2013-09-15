;redcode-94x
;name Tiny Porter (+12)
;author Franz
;strategy 66% ASJ scan oneshot ... with some instant damage ... mod-4 now
;strategy using (ASJ)add/sub/jmz scan and d-clear
;assert CORESIZE==800

sstep   equ 312
stscn   equ (step+sstep) 

	org scan

step    dat.f sstep,sstep  ;this will be found

ptr     dat 0,0            ;dclear is here to kill some imps
	dat 0,0
	dat 0,0

	dat 0,0

loop    add.f step, 1
scan    sub.f stscn+12,stscn
	jmz.f loop,@scan

wipe    spl #0,<0            ;invisible (will have decrement on -1 line
			     ;will it help???? )
	mov wipe,>scan
	mov bomb,>ptr
	djn.f wipe+2,>ptr
	
	dat 0,0

bomb    dat >534,20

	end

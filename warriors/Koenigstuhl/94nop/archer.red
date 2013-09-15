;redcode-94
;name Archer
;author Franz
;strategy 66% ab scanner ... with some instant damage
;assert CORESIZE==8000

sstep	equ 3510
stscn	equ (scan-1+sstep) 

	org scan

loop	add.f step, scan 
scan	add.f stscn,stscn+6
	jmz.f loop,@scan
step	spl #sstep,sstep
	mov bomb,}scan
	djn.f step+1,}scan
	dat 0,0
bomb	dat 10,10

	end


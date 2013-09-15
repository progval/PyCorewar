;redcode
;name Nimbus 1.2
;author Alex MacAulay
;strategy Create a 63-point 2-process ring, wait, then clear core.
;strategy 1.2 - Core-clear unaffected by djn streams.
;assert 1
step	  equ 127

start	  spl wait
	  spl 1
	  spl 1
	  spl 1
	  spl 1
	  spl 1
	  mov -1,0
	  spl 1
	  spl inc
spread	  jmp @spread,#imp
inc	  add #step,spread ; need a dat after this instruction
bomb	  dat <-5,<-6

wait	  djn 0,#step-35
cc	  mov bomb,<ptr
	  spl cc,<wait
ptr	  jmp cc,<cc

imp	  mov 0,step

	  end start

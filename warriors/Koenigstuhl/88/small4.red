;redcode verbose
;name Small 4
;author Andy Pierce
;(ajpierce@med.unc.edu)
;strategy small bomber/clearer
;strategy v2:  fix kill routine
;strategy v3:  marginally more robust
;strategy v4:  give bombs non-zero B-fields, start bombs away from self
;assert 1

start	add #15,1
	mov hit,751
	jmp start,0
hit	spl 0,-1
	mov 4,<-1
	jmp -1,0

	end start

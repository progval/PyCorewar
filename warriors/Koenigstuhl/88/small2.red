;redcode verbose
;name Small 2
;author Andy Pierce
;(ajpierce@med.unc.edu)
;strategy small bomber/clearer
;strategy v2:  fix kill routine
;assert 1

start	add #15,1
	mov hit,1
	jmp start,0
hit	spl 0,0
	mov -6,<-6
	jmp -1,0

	end start

;redcode-94x
;name D-Clear
;author Franz
;strategy dclear
;assert CORESIZE==800


ptr     equ (start-5)


	org start
	
start

dclr    spl #0,}ptr
	mov.i bmb,>ptr
	djn.f dclr+1,>ptr
bmb     dat >534,bmb+10-ptr     
	end

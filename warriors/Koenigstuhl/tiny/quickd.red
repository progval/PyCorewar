;redcode-94x
;name QuickD
;author Franz
;strategy qscan+dclear
;strategy qscan for tinyhill (no not Q^2)
;assert CORESIZE==800

QB	equ 100
QS	equ 30

ptr	equ (start-5)

	org start
	
start
x for 5
	sne.i QB+(QS*(x*4-3)),QB+(QS*(x*4-2))
	seq.i QB+(QS*(x*4-1)),QB+(QS*(x*4))
	mov.ab #QB+(QS*(x*4-3))-ptr,ptr
rof

dclr	spl #0,}ptr
	mov.i bmb,>ptr
	djn.f dclr+1,>ptr
bmb	dat >534,bmb+10-ptr	
	end


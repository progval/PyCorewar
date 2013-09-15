;redcode-94
;name think twice v.2
; (optiMAXed)
;author el kauka
;strategy decoy - twoshot
;assert 1

step	equ	816
start	equ	5080
hop	equ	7
stream	equ	1773
gap1	equ	19
gap2	equ	25
ldec	equ	5  ;length of decoymaker
sDEC	equ	5751

;if a decoymaker exists - start there
for (ldec > 0)
org s
rof

for (ldec == 0)
org loop
rof

clr	jmp	bomb1,	#0
	mov.i	inc,	>clr
loop	add.f	inc,	ptr
	seq.i	}ptr,	>ptr
ptr	sne.i	start,	start+hop
back	djn.f	loop,	<stream
	mov.ab	ptr,	clr
	jmp	{back

for gap1
	dat 	0,	0
rof

inc	spl	 #step,	#step
bomb3	dat.f   <2667,<(2*2667)
bomb2	spl.a   #(bomb3-clr),{58
bomb1	spl.a   #(bomb2-clr),58
clear   mov.i   *clr,	>clr
        mov.i   *clr,	>clr
last    djn.f   clear,	<(ptr-412)

for gap2
	dat 	0,	0
rof

s
i	for ldec
	mov.i	{sDEC+(i*2),	<sDEC+2+((t=i)*2)
	rof

	for (ldec > 0)
	jmp	loop+1,	{sDEC+(t*2)+3 
	rof

end


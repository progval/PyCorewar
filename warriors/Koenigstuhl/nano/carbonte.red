;redcode-nano
;name Carbon tetrachloride
;author Neo
;assert CORESIZE==80
;strategy paper
;(optimized)

        step equ -34 ;28

start:	spl 1
pap:	spl @0,<step
	mov }-1,>-1
	mov }-2,>-2
	djn.f -2,{-1 ;>pap

end start

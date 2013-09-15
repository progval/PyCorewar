;redcode-nano
;name Humans counter-attack!
;author Neo
;assert 1
;strategy Fast clear

        x0 equ -7
        d0 equ 38
        d1 equ 33
        d2 equ -2
        d3 equ -36

start:	spl #x0,<d0
	mov {d1,<d2
	mov <d2,{d1
	mov d3,{d3
	djn.f -3,{d3

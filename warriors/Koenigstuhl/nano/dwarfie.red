;redcode-nano
;name Dwarfie
;author Neo
;assert 1
;strategy stone

	ptr equ start-2
        step1 equ (-8)
        step2 equ (-30)
        src1 equ  (17)
        src2 equ  (-2)
        trail equ (10)

start:	spl #step1,<step2
	add.f start,ptr
	mov {src1,>ptr
	mov >src2,}ptr
	djn.f -3,{trail

end start

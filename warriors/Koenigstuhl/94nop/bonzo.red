;redcode
;name Bonzo
;author Sascha Zapf
;assert CORESIZE == 8000
;strategy Quickbomber => Imp-throwing Paper
silk1step EQU 3620
silk2step EQU 1471

bombdist1 EQU  305
bombdist2 EQU 1709

qbomb   mov.i   datb, @qbomb+4
	mov.i	datb, @qbomb+44
	nop	>-2,>-1
	djn.b   qbomb,#39
qloop   FOR 79
         mov.i  datb, @(imp+30)+(qloop*98)
	ROF
launch  spl     1
        mov     -1,0
        mov     -1,0
	spl     1

silk    spl     silk1step, 0
        mov.i   >-1,       }-1
	spl	silk2step, 0
	mov.i   >-1,       }-1

bl      mov.i   bomb,   >bombdist1
        mov.i   bomb,   }bombdist2

	mov.i   imp,    }imp
	spl	{imp
	jmp bl

bomb    dat.f   >2667,  >5334
datb	dat     >150, >50
imp	mov.i	0,9

	end 


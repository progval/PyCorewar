;redcode
;name Earnest
;author P.Kline
;strategy dwarf/ring combo
;assert CORESIZE==8000
spacing equ 1143
start   spl 1
	spl 1
	spl 1
	spl a2
a1      spl a1b2
a1b1    spl a1b1c2
a1b1c1  mov imp1,imp1+(spacing*1)
	jmp @-1
a1b1c2  mov imp1,imp1+(spacing*2)
	jmp @-1
a1b2    spl a1b2c2
a1b2c1  mov imp1,imp1+(spacing*3)
	jmp @-1
a1b2c2  mov imp1,imp1+(spacing*4)
	jmp @-1
a2      spl a2b2
a2b1    spl a2b1c2
a2b1c1  mov imp1,imp1+(spacing*5)
	jmp @-1
a2b1c2  mov imp1,imp1+(spacing*6)
	jmp @-1
a2b2    spl a2b2c2
a2b2c1  mov imp1,imp1+(spacing*0)
	jmp @-1
a2b2c2  spl 0
	mov bomb,<bomb
bomb    dat #-50

imp1    mov     0,1143
	end start

;redcode
;name Imperor III
;strategy I:	terror of imps (not!).
;strategy II:	smaller.
;strategy III:	splat bomb.
;assert CORESIZE==8000
top	mov bomb,sleep
reset	add #5,count
search	sub #2365,ptr
ptr	jmz search,0	; every 5 instr. must be zero.
	add #5,ptr
kill	mov sleep,<ptr
count	djn kill,#5
	djn reset,#500
	jmp top,0
bomb	dat #0,#0
sleep	spl <0,<6
		
	end search

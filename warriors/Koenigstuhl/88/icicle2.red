;redcode-b
;name IcicleV2 1.14
;author Ansel Greenwood
;strategy Saturation bombing with SPL 1, JMP -1, and cleaning up with DAT
;assert CORESIZE == 8000

;1   3039    3359
;2   2234    3094
;4   3044    3364
;5   2365    3315
;8   2376    2936

tmp     dat #1000

lookat  dat #1,     #1
bnew    spl 1,  #1
bnew2   jmp -1, #1

bloop1  mov     bomb,     @lookat
mute1   add     #1,        lookat
mute2   mov     bomb2,     @lookat
		add     #2375,      lookat
		djn     bloop1,     tmp
bjump2  jmp     bloop2, #1
		

bomb    spl 1, $0
bomb2   jmp -1, $0

bloop2  sub     #3039,     lookat
		cmp     bomb,     @lookat
		jmp     bloop2, #1
		mov     lookat,  @lookat
		jmp     bloop2, #1
		
		end     bloop1


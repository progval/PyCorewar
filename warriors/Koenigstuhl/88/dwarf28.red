;redcode verbose
;name 28dwarf
;author Pete
;assert 1
;
start	add	#28,	dest
	mov	bomb,	@dest
dest	jmp	start,	#3201
	
bomb	dat	#0,	#0
	end	start

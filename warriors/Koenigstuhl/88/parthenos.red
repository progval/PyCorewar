;redcode
;name Parthenos
;author Pierre Dak Baillargeon
;strategy v1.0:	auto-splitting splitter, splits itself when
;strategy	it doesn't want to split anymore...
;assert 1

start	spl 0,      0
search	mov -1,     @x
	sub #132,   x
	jmp search, 0
clear	mov bomb,   <x
	jmp clear,  0
bomb	dat #0,     #-4
x	dat #0,     #0

        end	start

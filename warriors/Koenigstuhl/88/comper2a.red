;redcode verbose
;name Comper-2a
;author Andy Pierce
;(ajpierce@med.unc.edu)
;strategy  as all the others which bomb with jmp's to a spl routine
;strategy  except scans using cmp instead of jmz
;strategy  scans 50% faster (2 in 3  vs  1 in 2), not fooled by "stealth"
;strategy  v2:  off-axis compare  -- cannot "hide in own reflection"
;strategy  v2:  unroll killing loop
;strategy  v2a: marginally more robust
;strategy  March 8th, 1992
;assert 1
find	cmp 299,4250
	jmp kill,0
back	add offset,find
	djn find,#4001			;iterations
dest	cmp 0,0
shuff	slt #-1,0
blitz	mov -7,<0
	djn -1,#7997
	jmp 0,0
grind	spl 0,0
index	jmp -1,0
hit1	dat #0,#0
hit2	dat #0,#0

kill	mov #2,index			;find is x,y
	mov mod1,hit1
	mov mod2,hit2
rekill	sub find,@index
	sub dest,dest
	sub @index,dest
	slt #40,dest
	jmp back,0
	sub #5,dest
	mov @index,<dest
	mov shuff,<dest
	mov shuff,<dest
	mov shuff,<dest
	mov shuff,<dest
kloop	djn rekill,index
	jmp back,0

mod1	jmp 6,3946			;  +6,-5  of  0,3951
mod2	jmp -3945,-5			;  +6,-5  of  -3951,0
offset	dat #49,#49

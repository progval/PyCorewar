;redcode verbose
;name Synch 4
;author Andy Pierce  (ajpierce@med.unc.edu)
;strategy  cmp scan, spl bomb, clear core
;strategy  v2:  reduce footprint, convert losses to ties, better tactics
;strategy  v2a: convert ties to wins, marginally better strategy
;strategy  v3:  reduce footprint again, more extensive smear routine
;strategy  v4:  move scan off axis, minor tactics fix
;assert 1
start	cmp 2939,6988
	jmp hit,0
back	sub offset,start
	jmp start,0
hit	cmp @start,start-1
	jmp 2,0
	add flip,start
	slt #30,start
	jmp back,0
	mov bomb,@start
	cmp <start,start-1
	jmp smear,0
trans	add #5,start
	mov @push,<start
	djn -1,push
	jmp @start,0
smear	add #100,start
	mov bomb,<start
push	jmn -1,5
bomb	spl 0,0
	mov 2,<-1
	jmp -1,0
flip	dat #3951,#3951
offset	dat #49,#49

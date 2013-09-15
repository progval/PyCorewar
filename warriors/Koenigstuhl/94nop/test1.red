;redcode-b
;name Test1
;author B. Cook
;strategy drop imps at increasingly large distances
;assert 1
data	dat	#1,	#imp+1
start	mov.i	imp,	@data
	spl	@data,	>data
	add.b	data,	data
	spl	start,	<data
imp	mov.i	#1,	1
	end	start


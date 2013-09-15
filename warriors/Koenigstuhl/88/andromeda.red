;redcode
;name Andromeda Strain v0.5
;author Sean Gallaty
;strategy	Trying to design the perfect 'voracious self replicator.'
;strategy	Designed to be resistant to dat bomb damage.
;assert 1
		dat	#0
start:		jmp	2	
source:		dat	#0
		mov	#2		,	countdown
restart: 	mov	#fini-source	,	source
copyloop: 	mov	<source		,	<dest
		jmn	copyloop	,	source
		add	#1		,	dest
dest:		spl	@dest		,	#920
		add	#320		,	dest
		djn	restart		,	countdown
blast:		mov	#601		,	source
wipe:		mov	source		,	@source
		sub	#4		,	source
		jmp	wipe
countdown:	dat	#0
fini            dat     #0
                end     start

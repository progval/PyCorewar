;redcode-94
;name Deep Green Sea
;author Pierre Baillargeon
;strategy  v1.00:  Very fast spl bombing, core clearing.
;strategy  v1.10:  Added some decoys.
;strategy  v1.11:  Found a bug in decoys...
;strategy  v1.20:  No more decoys !!!
;strategy  v1.30:  About twice faster.
;strategy  v1.41:  Back to 1.20.
;assert 1

len	equ 12
dist	equ 254
first	equ 126
delta	equ 126
amount	equ 118

shore	mov #len,#len		; init copy source
count	mov #amount,#amount	; init bombing count
	mov #first,bank		; init bomb-start location
sea	mov #dist,#dist		; init copy destination
green	mov algae,<bank		; two mov making double indirect
bank	mov shark,<first
	djn green,count
copy	mov <shore,<sea		; copy ourself
	jmn copy,shore
	jmp @sea,0
shark	dat 0,#delta		; distance between bombing
algae	spl 1,#delta

	end green

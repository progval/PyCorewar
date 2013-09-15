;redcode-x verbose
;name Bridge
;author Scott Adkins
;assert 1
;strategy Copies itself forward in memory, starts the copy, and then spends
;strategy part of its lifetime bombing the 200 or so locations behind it.
;strategy The bombing routine continues for 20 times, at which time it copies
;strategy itself again and then falls back into the bombing routine again.
;
length	equ	(dst-start+1)
source	equ	(dst-src+1)
output	equ	238
write	equ	43
road	equ	(start-bomb-1)
life	equ	20

start	mov	#length,  count
	mov	#source,  src
	mov	#output,  dst
copy	mov	<src,	  <dst
count	djn	copy,	  #length
src	spl	@dst,	  #source

bridge	mov	bomb,	  <bomb
	mov	bomb,	  <bomb
	mov	bomb,	  <bomb
	mov	bomb,	  <bomb
	mov	bomb,	  <bomb
loop	djn	bridge,	  #write
	mov	#write,	  loop
	mov	#road,	  bomb
	djn	bridge,	  #life
	jmp	start

bomb	dat	#0,	  #road
dst	dat	#0,	  #output

	end	start

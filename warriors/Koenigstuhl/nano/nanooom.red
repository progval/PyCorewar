;redcode-nano
;name Nanooom
;author neo
;assert 1
;strategy nano version of Zooom

loop2:	mov -1,<setp
loop1:	add #5,#10
scan:	jmz.b *mdfy,@loop1
setp:	mov.b loop1,#0
mdfy:	djn.a loop1,>0

end scan


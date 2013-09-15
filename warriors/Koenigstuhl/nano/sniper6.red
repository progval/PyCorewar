;redcode-nano
;name Sniper VI
;author G.Labarga
;assert CORESIZE==80
;strategy Oneshot

ptr:	sub.ab #6,#-6
scan:	jmz.f ptr,>ptr
	spl #0,<40
	mov {35,<ptr
	djn.f -1,{-1
end scan


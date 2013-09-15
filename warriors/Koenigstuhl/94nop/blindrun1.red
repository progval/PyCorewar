;REDCODE-94
;NAME 	Blind Runner I
;AUTHOR Neogryzor
; <neogryzormail@mixmail.com>
;ASSERT 1
;STRATEGY	Self-moving bomber
;STRATEGY	0.5c moving, 0.8 bombing, (0.4c bomb + 0.4c dec)
INI:	SPL CO2
AT:	NOP AT,AT+8         ;-> can be mov.i #0,8 too or any other
	MOV.I {800,1601
	MOV.I {1802,2603
	MOV.I {2803,3604
CO2:	MOV.I }AT,>AT
	MOV.I }AT,>AT
	MOV.I }AT,>AT
	MOV.I }AT,>AT

	END INI


;redcode-x verbose
;name Eru (The Chosen)
;author Rob Shultz
;strategy  copys imps every 175 bytes and releases an imp that
;strategy  goes the other way in the core.
;assert 1
	SPL	start
kill	MOV	kill,kill-3
	JMP	kill
start	MOV	#10,size
		ADD	#175,@target
copy 	MOV	<size,<target
		DJN	copy,size
		SPL	@target
		JMP	start
target	DAT	#0
size	DAT	#0
gun		SPL	imp
		SPL	imp
		SPL	imp
		SPL	bomber
		JMP	gun
bomber	MOV	bomber,bomber+33
imp		MOV	imp,imp+2
		END	start

;redcode
;name Rush (11,1)
;author System 4
;System 4 warrior
;assert 1

L0	ADD.F	> L3,	# L7
L1	MOV.X	$ L14,	> L0
L2	CMP.BA	$ L5,	$ L6
L3	SUB.F	$ L17,	@ L7
L4	JMN.BA	$ L11,	* L19
L5	MUL.X	$ L4,	{ L6
L6	CMP.AB	* L16,	# L2
L7	DJN.AB	* 1177,	@ L12
L8	ADD.B	< 6494,	$ L8
L9	MOD.F	@ L0,	> L5
L10	MUL.AB	@ L15,	* L18
L11	DIV.B	{ L5,	$ L15
L12	ADD.A	> L14,	$ 5083
L13	DJN.F	# 5066,	< 6240
L14	MOV.B	$ L15,	$ 3341
L15	SUB.BA	> L4,	$ L2
L16	SPL.X	# L11,	< 4315
L17	DIV.X	< L14,	# L19
L18	DJN.BA	< 7279,	$ L10
L19	DJN.B	* L15,	< 7073

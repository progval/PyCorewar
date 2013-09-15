;redcode
;name Gulliver
;author john wetmiller
;<jpwetmil@descartes.waterloo.edu>
;after April 16 <esutherl@descartes.waterloo.edu>
;strategy -to throw imps all around the core and start them going...
;assert 1

start	MOV	imp,	@target
	SPL	target
	ADD	#91,	target  ;hopefully the #91 offset will place 90 imps
target	JMP	-3,	#91	;around the core the last one disabling this
imp	MOV	0,	1	;code...
	END	start

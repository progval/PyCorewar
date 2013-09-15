;redcode
;name MaxProcessTest
;author Jens Gutzeit
;assert 1

START	SPL    $     0, <     4
	SPL    $     3, $     0
        JMP    $    -2, $     0
        DAT    #     0, #     0
        MOV    $     0, $   -10
	DAT    #     0, #     0

	END START

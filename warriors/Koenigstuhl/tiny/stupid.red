;redcode
;name Stupid
;author nobody
; <nobody@home.com>
;assert 1
        DAT.F  #     0, #     1     
        DAT.F  #     0, #     1     
        DAT.F  #     0, #     1     
START   MOV.AB #     9, $    -3     
        MOV.AB #    28, $    -3     
        MOV.AB #     9, $    -3     
        MOV.I  <    -6, <    -5     
        DJN.B  $    -1, $    -5     
        JMP.B  $    15, $     0     
	end START

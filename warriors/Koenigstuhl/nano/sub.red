;redcode-nano quiet
;name Sub
;author Zul Nadzri
;assert 1
;note - among the first nano entry

SPL.B #0, >-20
MOV.I $3, >-8
MOV.I $2, >-9
DJN.F $-1, >-10
DAT.F <27, $14
END 0

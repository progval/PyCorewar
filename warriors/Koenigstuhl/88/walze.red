;redcode
;name Walze
;author Stefan Strack
;(stst@vuse.vanderbilt.edu)
;strategy Submitted: @date@
;assert 1
impstop EQU     (start-14)
bomb    EQU     (impstop+1)

start   SPL     imp
        SPL     bomber
bomber  MOV     bomb,   <impstop
        JMP     bomber, <impstop
        DAT     #0
        DAT     #0
        DAT     #0
        DAT     #0
        DAT     #0
        DAT     #0
        DAT     #0
        DAT     #0
        DAT     #0
        DAT     #0
        DAT     #0
        DAT     #0
        DAT     #0
        DAT     #0
        DAT     #0
        DAT     #0
        DAT     #0
        DAT     #0
        DAT     #0
        DAT     #0
        DAT     #0
        DAT     #0
        DAT     #0
        DAT     #0
        DAT     #0
        DAT     #0
        DAT     #0
        DAT     #0
        DAT     #0
        DAT     #0
        DAT     #0
        DAT     #0
        DAT     #0
        DAT     #0
        DAT     #0
        DAT     #0
        DAT     #0
        DAT     #0
        DAT     #0
        DAT     #0
        DAT     #0
        DAT     #0
        DAT     #0
        DAT     #0
        DAT     #0
        DAT     #0
        DAT     #0
        DAT     #0
        DAT     #0
        DAT     #0
        DAT     #0
        DAT     #0
        DAT     #0
        DAT     #0
        DAT     #0
        DAT     #0
        DAT     #0
        DAT     #0
        DAT     #0
        DAT     #0
        DAT     #0
        DAT     #0
        DAT     #0
        DAT     #0
        DAT     #0
        DAT     #0
        DAT     #0
        DAT     #0
        DAT     #0
        DAT     #0
        DAT     #0
        DAT     #0
        DAT     #0
        DAT     #0
        DAT     #0
        DAT     #0
        DAT     #0
        DAT     #0
        DAT     #0
        DAT     #0
        DAT     #0
        DAT     #0
        DAT     #0
        DAT     #0
        DAT     #0
        DAT     #0
        DAT     #0
        DAT     #0
        DAT     #0
        DAT     #0
        DAT     #0
        DAT     #0
        DAT     #0
imp     MOV     imp,    imp+1

        END     start

;redcode
;name Linalg
;author George Eadon
;strategy 7 Process paper w/ anti-imp bombs
;strategy Named in honor of the Linear Algebra test I should've been studying 
;strategy for. There's still room for improvement in the constants.
;assert CORESIZE==8000

        spl     1, <300
        spl     1, <500
        mov     -1, 0           ; 7 parallel processes
        
pos     spl     987, 0          ; split to first copy
        mov     >pos, }pos      ; Make 1st copy
        mov     bomb, >1806
        mov     bomb, }6034
        mov     <pos, {pos2     ; Make 2nd copy
pos2    spl     333, <1401      ; split to second copy
bomb    dat     <2667, <(2667*2)

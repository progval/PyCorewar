;redcode verbose
;name Armadillo
;author Stefan Strack
;strategy Not very deadly, but tough to kill: a mod-3.2 SPL-bomber
;strategy Submitted: @date@
;assert 1
;2891 2947

bomb    spl 0
loop    add #3039,ptr
ptr     mov bomb,81
        jmp loop
        mov 1, <-1

        end bomb

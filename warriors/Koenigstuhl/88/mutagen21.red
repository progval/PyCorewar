;redcode verbose
;name Mutagen 2.1
;author Stefan Strack
;strategy backwards bomber that also decrements B-fields
;strategy 2.0: more robust
;strategy 2.1: smaller, starts bombing away from self
;strategy Submitted: @date@
;assert 1
DIST    equ     442
OFFSET  equ     -49

split   spl     0
start   mov     <OFFSET, <OFFSET
        add     #DIST,  loc
loc     djn     start,  <0

        end     split

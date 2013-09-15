;redcode verbose
;name Pesticide
;author Stefan Strack
;strategy Get rid of 'em damn locusts!
;strategy Bomb mod-4 with SPL 0, then zero core. Difficult to detect by
;strategy scanners, because only 3 instructions have a non-zero B-field.
;strategy Submitted: @date@
;assert 1
DIST    EQU  212

scan    ADD  #DIST, scanptr
scanptr MOV  slow,  scanptr
        JMN  scan,  scanptr
bloop   MOV  slow+1,  <bloop
        JMP  bloop
slow    SPL  0

        END  scan

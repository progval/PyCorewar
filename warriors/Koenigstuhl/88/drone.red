;redcode verbose
;name Drone 1.1
;author Stefan Strack
;<stst@vuse.vanderbilt.edu>
;strategy B-field scanning vampire
;strategy 1.1: move slave-pit away from working code
;strategy Submitted: @date@
;assert 1

scan    ADD     dist,   scanptr
        JMZ     scan,   @scanptr
        MOV     scanptr,@scanptr
        JMP     scan

        DAT     #0      ;1
        DAT     #0
        DAT     #0
        DAT     #0

        DAT     #0      ;2
        DAT     #0
        DAT     #0
        DAT     #0

        DAT     #0      ;3
        DAT     #0
        DAT     #0
        DAT     #0

        DAT     #0      ;4
        DAT     #0
        DAT     #0
        DAT     #0

        DAT     #0      ;5
        DAT     #0
        DAT     #0
        DAT     #0

        DAT     #0      ;6
        DAT     #0
        DAT     #0
        DAT     #0

        DAT     #0      ;7
        DAT     #0
        DAT     #0
        DAT     #0

        DAT     #0      ;8
        DAT     #0
        DAT     #0
        DAT     #0

        DAT     #0      ;9
        DAT     #0
        DAT     #0
        DAT     #0

        DAT     #0      ;10
        DAT     #0
        DAT     #0
        DAT     #0

        DAT     #0      ;11
        DAT     #0
        DAT     #0
        DAT     #0

        DAT     #0      ;12
        DAT     #0
        DAT     #0
        DAT     #0

        DAT     #0      ;13
        DAT     #0
        DAT     #0
mark    DAT     #0

scanptr JMP     slow,   mark
trap    MOV     dist+1, <scan-2
slow    SPL     slow
        JMP     trap

dist    DAT     #-212,  #212

        END     scan

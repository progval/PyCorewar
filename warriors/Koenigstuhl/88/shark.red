;redcode
;Valentine Tournament 2/12/92
;name Shark 1.0
;author Nandor Sieben
;from:         nandor sieben <ASMQK@ASUVM.INRE.ASU.EDU>
;asmqk@asuacad.bitnet
;strategy mod 2 scan and single bomb
;assert 1
start   add    #77*2     ,   point
point   jmz    -1        ,   -2
        mov    start-1   ,   @point
        jmp    start     ,   #0
        end    start

;redcode-x
;name Freeze-x!
;author Stefan Strack
;strategy Bomb with JMP 0, then with DAT 0
;strategy Submitted: @date@
;assert 1

dist    equ     211
scanptr equ     (scan-3)

scan    add     #dist+1,scanptr    ; simple imptrap
        jmz     scan,   <scanptr
        slt     #bomb-scanptr,scanptr
        jmp     scan
        slt     #1,     @scanptr   ; is this a bomb?
        mov     bomb+1, bomb
        mov     bomb,   @scanptr
        jmp     scan
bomb    jmp     bomb,   #1

        end     scan

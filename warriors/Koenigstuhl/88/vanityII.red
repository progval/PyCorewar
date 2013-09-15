;redcode
;name Vanity II
;author Stefan Strack
;strategy spl/jmp bombing B-scanner with single core-clear
;strategy Submitted: @date@
;assert 1

INCR    equ 754 ;34
decptr  equ scan-2

scan    add #INCR,@pptr
start   jmz scan,@ptr
pptr    mov jump,@ptr
ptr     mov split,<split+INCR
        jmn scan,@scan
split   spl 0,<decptr
move    mov clear,<scan-4
jump    jmp -1,0
clear   dat <decptr-move-2668,<decptr-move

        end start

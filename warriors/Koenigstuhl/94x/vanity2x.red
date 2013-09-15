;redcode-94x
;name Vanity IIx
;author Stefan Strack
;strategy spl/jmp bombing B-scanner with single core-clear
;strategy Submitted: @date@
;assert CORESIZE==55440

INCR    equ 4766 ;4766 ;5146; 6422; 2554 ;34
;best so far: 4766 (55,000 cycles)
decptr  equ scan-2

scan    add #INCR,@pptr
start   jmz scan,@ptr
pptr    mov jump,@ptr
ptr     mov split,<split+INCR
        jmn scan,@scan
split   spl 0,<decptr
move    mov clear,<scan-4
jump    jmp -1,0
clear   dat <decptr-move-34118,<decptr-move

        end start


;redcode-b  
;name Mr Hospitable
;author Derek Ross
;strategy .75c scan, bomb, coreclear ...
;strategy Written in '94 code
;assert 1

offset  equ -100
gap     equ 11

        for 29
        dat 0, 0
        rof

split   dat <gap, <gap*2
scan    add shift, target
start   mov split, @target
target  sne *offset, @offset
        djn scan, #(CORESIZE-offset)/(gap*4)
        mov.a clear3, target
shift   spl #-gap*4, <-gap*4
part2   mov *target, >target  
        djn part2, <-gap*4-shift

clear3  dat clear1-target, finish-target
clear2  spl #clear3-target, finish-target
clear1  spl #clear2-target, finish-target

finish  dat 0, 0
        end start

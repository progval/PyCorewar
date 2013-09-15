;redcode-94lp
;name Mr A Speculative
;author Derek Ross
;strategy Decreasing Core Clearer...
;assert CORESIZE > 1

offset  equ 6000

begin   dat 0, 0
        dat 0, 0

start   
clear1  spl #clear2-aim, begin-aim
loop    mov *aim, <aim
        jmp loop, <begin
clear3  dat aim-aim, begin-aim
clear2  spl #clear3-aim, begin-aim
aim     dat clear1-aim, begin-aim-offset

        end start


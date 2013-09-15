;redcode-94x
;name phantom clear
;author Brian Haskin
;strategy boot a d-clear
;assert CORESIZE==800

BOOT equ 300
CONST1 equ 53
CONST2 equ 187

        org start

start   mov lst,BOOT
for 3
        mov {start,<start
rof
        spl @start,{BOOT+CONST2
for 3
        mov {start,<start
rof
        mov 100,start
a
for 20-7-6-3
        mov {a*CONST1,<a*CONST2
rof

ptr     dat clr,8
        dat 1,7
        spl 1,7
clr     spl #2,8
        mov *ptr,>ptr
        mov *ptr,>ptr
lst     djn -2,>ptr
        end

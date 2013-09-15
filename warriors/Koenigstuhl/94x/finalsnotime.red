;redcode-94x
;name finals: no time
;author M R Bremer
;nsfcwt round 8 
;contact <bremermr@ecn.purdue.edu>
;assert 1

org boot+1

BOOTPTR EQU 13500

ptrs    dat sp1, 0
        add.f step, scan
scan    sne.i }108-3, >100-3
        djn.f -2, <-1664
sp1     spl #9, #14
        mov.i *ptrs, >scan
        mov.i *ptrs, >scan
        djn.f -2, <-40
step    dat 16, 16
        spl #8, #14
for 73
        dat last+10, last+11  
rof
boot    dat BOOTPTR, 12
        mov ptrs, }boot
        mov ptrs+1, }boot 
        mov ptrs+2, }boot
        mov ptrs+3, }boot
        mov ptrs+4, }boot
        mov ptrs+5, }boot
        mov ptrs+6, }boot
        mov ptrs+7, }boot
        mov ptrs+8, }boot
        mov ptrs+9, }boot
        mov 10, step-2
last    jmp  BOOTPTR-10
for 90
	dat 1, 1
rof

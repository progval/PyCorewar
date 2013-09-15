;redcode
;name Scoop v2.3
;author Matthew K. Gray
;koth rating    61
;assert 1

ptr1    dat     #0,     #-5000
ptr2    dat     #0,     #-4500
ptr3    dat     #0,     #-500
ptr4    dat     #0,     #-10
split   spl     -1,     #0
main    mov     split,  <ptr1
        mov     ptr3,   <ptr2
        mov     split,  <ptr3
        mov     ptr3,   <ptr4
lline   jmp     main
end main

;redcode
;name Scoop v1.1
;author Matthew K. Gray
;koth rating    61
;assert 1

ptr1    dat     #0,     #-4000
ptr2    dat     #0,     #-900
ptr3    dat     #0,     #-5
split   spl     -1,     #0
main    mov     split,  <ptr1
        mov     ptr3,   <ptr2
        mov     split,  <ptr3
        jmp     main
end main

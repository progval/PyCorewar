;redcode
;name FastVamp v3.1
;author Matthew K. Gray
;strategy - troll
;assert 1

start   spl     ccl
search  add     #257,   ptr
ptr     spl     @ptr,   #-200
cclp    jmp     search, #-10
ccl     jmz     ccl,    <cclp
        mov     cclp,   <cclp
        jmp     ccl

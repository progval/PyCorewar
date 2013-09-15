;redcode
;name LP-Paper 4
;author George Eadon
;strategy Limited Process Paper
;assert 1

; Performs better than any of the linalg X variations...
        spl     body2
        spl     1, <300
        spl     1, <500         ; 4 parallel processes
        
pos     spl     2000, 0         ; split to first copy
        mov     >pos, }pos      ; Make 1st copy
        mov     bomb, }bomb
        jmp     pos, <pos

bomb    dat     <2667, <(2*2667)

for     71
        dat     0, 0
rof



body2   spl     1, <-300
        spl     1, <-500        ; 4 parallel processes
        nop     <700, <-700

pos2    spl     6000, 0         ; split to first copy
        mov     >pos2, }pos2    ; Make 1st copy
        mov     bomb2, >bomb2
        jmp     pos2, <pos2

bomb2   dat     <(2*2667), <2667



;redcode
;name strange rings
;author Planar
;types imp
;hills 88 94 lp big tiny nop
;assert CORESIZE % 2 == 0

;;  a   MOV b, d+1
;;  b   MOV a, c+1
;;  c   MOV d, b+1
;;  d   MOV c, a+1

;; constraints:   b-a = d-c
;;                a-b = c-d
;;                d-a = b-c
;;                c-b = a-d

;; these constraints are equivalent to:
;;     a-c = b-d = CORESIZE/2   or    a-c = b-d = 0

a       equ     1234            ;; change these
b       equ     5678            ;; as you like
c       equ     a+CORESIZE/2
d       equ     b+CORESIZE/2

z:      mov     imp1, z+a
        mov     imp1, z+c
        mov     imp2, z+b
        mov     imp2, z+d

        spl     l2
l1:     spl     l12
l11:    jmp     z+a
l12:    jmp     z+b

l2:     spl     l22
l21:    jmp     z+c
l22:    jmp     z+d

imp1:   mov     b-a, d+1-a
imp2:   mov     a-b, c+1-b

end

-- 
Planar                                    Remove ".gov" from my address.


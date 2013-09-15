;redcode
;name Lichen 1988
;author Scott Nelson
;assert 1
start   spl 1                   ; make 3 tasks
        mov -1,     0
; the real code
source  mov #3,     0		; init.
        mov <source, <dest	; copy.
dest    jmp @dest,  #-100       ; leap.
 
        end start

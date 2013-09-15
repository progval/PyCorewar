;redcode
;name 17
;author Corrado Giustozzi
;assert 1

; bombe paralizzanti sul codice
;
start   cmp     @ptr1,@(start-1)
        mov     bomb,@ptr1
        sub     #4,ptr1
        cmp     @ptr2,@(start-1)
        mov     bomb,@ptr2
        add     #4,ptr2
        djn     start,ctr
;
; bombardamento dirompente a tappeto
;
bomber  mov     #4086,ctr
        mov     #(ctr-ptr1+1),ptr1
        mov     #(start-ptr2-1),ptr2
loop    mov     ctr,@ptr1
        add     #2,ptr1
        mov     ctr,@ptr2
        sub     #2,ptr2
        djn     loop,ctr
        jmp     bomber
;
; polveriera
;
bomb    spl     0
;
; puntatori
;
ptr1    dat     #(start+4104)
ptr2    dat     #(start+4108)
;
; variabili
;
ctr     dat     #1020
        end     start


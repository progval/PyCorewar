;redcode
;name Sucker 5
;author Stefan Strack
;strategy Self-splitting, pattern-bombing vampire
;strategy 2: with confusion
;strategy 3: much denser, mod-2 bomb-pattern; no spacer
;strategy 3.1: avoids prematurely dropping into clear-mode
;strategy 4: spacer/bootstrap; changed bomb increment; tracer-proof
;strategy 5: imp-defense
;strategy Submitted: @date@
;assert CORESIZE==8000

AWAY    equ     4000         ;mirrors boot template
mark    equ     (start+39)
decloc  equ     (start-9)

;------ bootstrap main bombing loop and slave pit without spacers
boot    mov     bomb,clear+37+AWAY
        mov     loop+2,@ptr1
        mov     loop+1,<ptr1
        mov     loop,<ptr1
        mov     start,<ptr1
        mov     jump,@ptr2
        mov     clear+2,<ptr2
        mov     clear+1,<ptr2
        mov     clear,<ptr2
        jmp     @ptr1
bomb    dat     <decloc-clear,#0

;------ boot copy pointers
ptr1    dat     #loop+2+AWAY
ptr2    dat     #jump+AWAY

;------ main bombing loop
start   spl     0,<decloc
loop    mov     jump,@jump
        sub     clear,jump
        djn     loop,<3203

;------ spacer
        dat     #1
        dat     #1
        dat     #1
        dat     #1

;------ core-clearing slave pit
clear   mov     37,<-37
        spl     clear,<decloc
        jmp     clear,<decloc
jump    jmp     clear-mark,<mark

;------ decoy
        dat     #1
        dat     #1
        dat     #1
        dat     #1
        dat     #1
        dat     #1
        dat     #1
        dat     #1
        dat     #1
        dat     #1
        dat     #1
        dat     #1
        dat     #1
        dat     #1
        dat     #1
        dat     #1
        dat     #1
        dat     #1
        dat     #1
        dat     #1
        dat     #1
        dat     #1
        dat     #1
        dat     #1
        dat     #1
        dat     #1
        dat     #1
        dat     #1
        dat     #1
        dat     #1
        dat     #1
        dat     #1
        dat     #1
        dat     #1
        dat     #1
        dat     #1
        dat     #1
        dat     #1
        dat     #1
        dat     #1
        dat     #1
        dat     #1
        dat     #1
        dat     #1
        dat     #1
        dat     #1
        dat     #1
        dat     #1
        dat     #1
        dat     #1
        dat     #1
        dat     #1
        dat     #1
        dat     #1
        dat     #1
        dat     #1
        dat     #1
        dat     #1
        dat     #1
        dat     #1
        dat     #1
        dat     #1
        dat     #1
        dat     #1
        dat     #1
        dat     #1
        dat     #1
        dat     #1
        dat     #1
        dat     #1
        dat     #1
        dat     #1
        dat     #1
        dat     #1
        dat     #1

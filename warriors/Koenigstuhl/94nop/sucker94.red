;redcode-94
;assert CORESIZE==8000 && MAXPROCESSES==8000 && MAXCYCLES==80000
;assert MAXLENGTH==100 && MINDISTANCE==100
;name Sucker'94
;author Stefan Strack
;strategy self-splitting vampire
;strategy Submitted: @date@

INCR    equ 17
DJNOFF  equ -1001
mark    equ start+17
decloc  equ start-7

	org start
start   spl   0,<decloc
loop    mov   jump,@jump
        sub   clear,jump
        djn.f loop,<DJNOFF

;macro
        for 5
        dat 0,0
        rof

jump    jmp     clear-mark,<mark
clear   mov     INCR,<-INCR
        spl     clear
        jmp     clear


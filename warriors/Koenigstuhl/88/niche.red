;redcode
;name Niche 1.0
;author Bill Shubert
;assert 1
 
target  dat     #0,#0
spl_i   spl     0,#2            ;The W.W. uses this as bombs.
search  cmp     spl_i,<target   ;Have I found a bomb?
        jmp     search          ;No, look at a now location.
        add     #2,target       ;The jmp instr. is 2 after the bomb.
trace   sub     #3044,target    ;Back up one bomb.
        cmp     jmp_i,@target   ;Have I found the main program yet?
        jmp     trace           ;No, back up another bomb.
kill    mov     target,<target  ;Wipe out an instruction.
jmp_i   jmp     kill,<-7        ;This matches the W.W.'s jmp.
        end     search

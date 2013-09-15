;redcode-94x
;name Freeze 2
;author David Houston
;assert CORESIZE==800 

first equ 3 + inc 
inc equ 65 
gate equ -10 

	org start 

splb:   spl #1, <gate 
jmpb:   jmp -1, -1 + gate 
ptr:    mov jmpb, *first 
       add.ab #inc, ptr 
start:  mov splb, @ptr 
       jmp -3, gate 
       mov *wipe, <wipe 
       jmp -1, <-2 + gate 
       dat -4, -12 
       spl #-4, -12 
       dat 0 
       dat 0 
wipe:   dat -3, splb - 20 


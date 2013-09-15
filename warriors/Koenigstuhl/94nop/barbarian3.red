;redcode
;name Barbarian 3
;author Franz
;strategy qscan->stone/imp (continuous launching imp with kill fuse)
;assert CORESIZE==8000

; imp constants
impstep equ 2667
fuselen equ 8

; bomber constants
step equ -4
gate equ incr-1000
stbm equ (1-80)

        org     start

; here was the qscan from Probe (Core Warrior 40) almost without
; change

start   ; Probe's Qscan code here

boot    spl     fuse,   <-3000

incr    spl     #step*3,  <step*3
stone   add.f   incr,     where
where   mov.i   stbm,     @stbm+step
        mov.i   bomb,     @where
        mov.i   bomb,     *where
        jmp     stone,    >gate
bomb    dat     <step,    <step

fuse    spl     launch
        djn.b   0,#fuselen
        mov     bomb,launch
launch  spl     launch
iA      spl     iC, }iD
iB      spl     iE, }iE
iD      jmp     imp-2, }iD
iE      jmp     imp+impstep-1, }iE
iC      nop     }iF
iF      jmp     imp+2*impstep-1, }iF
imp     mov.i   #impstep, *0

datz    end


;redcode-94x
;name Tiny Barbarian 3
;author Franz
;strategy stone/imp (continuous launching imp with kill fuse)
;assert CORESIZE==800

; imp constants
impstep equ 267
fuselen equ 8

; bomber constants
step equ 236
gate equ incr-100
stbm equ (1)

	org     boot

boot    spl     fuse,   <-300

incr    spl     #step*3,  <step*3
stone   add.f   incr,     where
where   mov.i   stbm,     @stbm+step
	mov.i   bomb,     @where
	mov.i   bomb,     *where
	jmp     stone,    >gate
bomb    dat     >267,     }step         

fuse    spl     launch
	djn.b   #0,#fuselen 
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

;redcode-94b
;name WannaChatInWarriorNames?
;author John Metcalf
;strategy .66c cmp scanner -> spl/dat clear
;strategy retired from '94b hill age 101, August 1998
;assert CORESIZE==8000
        step    equ     3364
offset: dat     step*2, step*2
chat:   add     offset, @g
wanna:  sne     step*3-1,step*2-1
        djn.f   chat,   @wanna
gate:   slt     #12,    wanna
        jmp     chat,   wanna
        mov     jump,   @wanna
g:      mov     sp,     <wanna
        mov     sp,     <wanna
        add     newo,   @g
        jmz     wanna,  chat-2
sp:     spl     #d-gate,<14
        mov     *gate,  >gate
        mov     *gate,  >gate
jump:   jmp     -2
newo:   dat     step,   step+2
d:      dat     sp-gate,14
        end     wanna

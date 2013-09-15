;redcode-94
;assert CORESIZE == 8000
;author Kurt Franke
;name Imp Hunter

;strategy spl clear -> find and stun remaining imps -> dat clear

NLOOP   equ     6

istep   dat     0,0
        dat     0,0
        dat     0,0
        dat     0,0

find    sub.a   #20, $ptr               ;; one-shot scan
        jmz.f   -1, *ptr
        add.a   #10, $ptr

clear   mov     $sbomb, {ptr            ;; clear the core
        mov     $sbomb, {ptr
        mov     $sbomb, {ptr
        mov     $sbomb, {ptr
        djn     clear, #0
        mov.a   #istep-ptr-1, $ptr

locate  sne.i   $sbomb, {ptr            ;; look for survivors of core clear
jbomb   jmp     locate, <istep          ;; why not gate as well?

        jmn.a   decode, $ptr
        mov     $last, $sbomb           ;; change clear to dats and run it
        jmp     clear, }ptr

decode  mov     }ptr, $istep            ;; get imp step size
        jmn.b   double, $istep
        mov.x   $istep, $istep
double  mov.ba  $istep, $istep

        add.f   $incr, $ptr
destroy mov     $sbomb, *ptr            ;; destroy imp ring
        add.f   $istep, $ptr
loop    jmn.b   destroy, $ptr
        jmp     locate, }ptr

incr    dat     -NLOOP/2, -NLOOP
last    dat     #clear-ptr-1, #0
sbomb   spl     #clear-ptr-1, #0
ptr     sne     #clear-ptr-1, #0

end     find

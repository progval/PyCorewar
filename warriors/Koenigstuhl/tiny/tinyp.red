;redcode-94x
;name Tiny-P
;author harleyQ2
;stategy jackbrained p-warrior
;assert 1

        _RES    equ 0           ;here pmars loads results
        _STR    equ 1           ;here I store my strategy 

res     ldp.ab  _RES,   #0      ;load result last match
str     ldp.a   _STR,   str1    ;load strategy in use
        sne.ab  #0,     res     ;check result, win or tie OK
lost    add.a   #1,     str1    ;lost change
        mod.a   #2,     str1    ;secure jump     
win     stp.ab  str1,   _STR    ;save strategy
str1    jmp     @0,     imp
        dat     0,      stream

imp     mov imp, imp+1

stream  djn.f #100, <-11
        end


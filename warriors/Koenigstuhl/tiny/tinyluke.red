;redcode-94t
;name TinyLuke
;author Philip Thorne
;strategy 15Feb02 MUL.AB Driven One-Shot scanner with S/S/D clear
;strategy         Tiny hill verison of LuckyLuke. Less/diff decoy
;assert (CORESIZE==800)

ptr     EQU (sptr-(MAXLENGTH+1))

;clean like Geist
bptr:   dat     1,              2+7+(bptr-ptr)
dptr:   spl     #ptr+45,        2+7+(bptr-ptr)
        dat     0,              0
clr:    spl     #125,           }ptr
        mov     *bptr,          >ptr
        mov     *bptr,          >ptr
        djn.f   -2,             }dptr 

    for MAXLENGTH-CURLINE-6-1-1-0
        dat     0,              0
    rof

;find like Quincy
MA      EQU     581
MB      EQU     73

start:  mov.i   >sptr+MB,       #0

scan:   mul.ab  #MA,            sptr
        jmz.f   scan,           @sptr    ;>sptr is nice with diff contants
sptr:   spl     clr,            MB
        mov.b   sptr,           ptr
        mov.i   <jbmb+1,        @sptr    ;<new, adds to decoy

    for 1
        dat     0,              0
    rof

jbmb:   jmp     #0,             0

    end start


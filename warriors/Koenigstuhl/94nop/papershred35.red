;redcode-94b
;name Paper Shredder 3500
;author Justin Kao
;assert 1

        org     start

clrptr  dat     4000,   200     ;pointers------------\.
djnptr  dat     4000,   200     ;                    |
        dat     {20,    <2667   ;clear bombs---------<
clear   spl     #25,    1       ;                    |
        mov     clear,  }clrptr ;clear---------------<
        mov     clear,  }clrptr ;                    |
        djn.a   -2,     >djnptr ;                    |
step    dat     3510,   3510    ;scan step-----------<
loop    add     step,   scan    ;scan----------------<
scan    sne.f   {-10,   <0      ;                    |
        jmp     loop            ;                    |
        mov.a   scan,   clrptr  ;found something-----<
        djn     loop,   #10     ;10 hits             |
        jmp     clear           ;end scan------------/.

        for     60
        dat     0,      0
        rof

start   spl     loop            ;start scan
        jmp     clear+1         ;start clear


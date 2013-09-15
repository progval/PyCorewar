;redcode verbose
;name           BANZAI TOO
;author         Kenneth D. Miller III
;strategy       I think this one's technically a "slaver".  It turns out that
;strategy       it bears a frightening semblance to Scissors88.  Go figure.
;assert 1
start   add      inc,    a
        jmz      start, @a
        slt      #-12,   a
        mov      a,     @a
hit     jmp      start, #start-1
zot     mov      inc,   <hit
        spl      -1
        spl      -1	; << OOH, big difference, huh?
        spl      -1	;    This one sucks up the opponent's processes
        spl      -1	;    MUCH MUCH MUCH better, though.  Ha!
        jmp      zot
inc     dat     #2946,  #-2946
a       jmp     zot,     0

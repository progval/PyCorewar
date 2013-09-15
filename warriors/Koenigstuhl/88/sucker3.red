;redcode verbose
;name Sucker 3
;author Stefan Strack
;strategy Self-splitting, pattern-bombing vampire
;strategy 2: with confusion
;strategy 3: merger of Union and Sucker: much denser, mod-2 bomb-pattern
;strategy Submitted: @date@
;assert 1

mark    equ (start-1-4+10+44+350+44)   ;development history mess

jump    jmp clear-mark,mark

start   spl 0
loop    sub clear,jump           ;'jump' will land here after 12,000 cycles
        mov jump,@jump
        djn loop,<4003           ;mutagenize core/confuse scanners

clear   mov 34,<-34              ;entry for captured processes
        spl clear
        jmp clear

        end start

;redcode verbose
;name ProtonDance-X
;author J.Cisek
;date 4/13/92
;strategy  Tiny disruptor.  Messes up programs.
;assert 1

dance   mov <-1, <-1            ; do the proton dance
        jmp dance, <-2          ; b-field pre-decrement is the key here

        end dance

; This does work under ICWS'88 and KotH.  Try and find me!

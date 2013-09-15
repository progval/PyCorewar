;redcode verbose
;name Bubble-scrape
;author Joshua Houk
;strategy  
;strategy       Bombs entire core with SPL+DAT-bombs, then hits a spl 0
;strategy       to tie...
;strategy  
;assert 1

datbomb dat     #0              ;regular ol' DAT bomb

splbomb spl     @-1             ;hopefully this will cause the other
                                ;program to split into a neverending
                                ;loop...

bomber  add     #3759,datbomb
        mov     datbomb,<datbomb        ;lethal bomber

        add     #415,splbomb
        mov     splbomb,<splbomb        ;stun bomber

        jmp     bomber
        end     bomber

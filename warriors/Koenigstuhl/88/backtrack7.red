;redcode
;name BackTrack 7
;author Stefan Strack
;assert 1 

INTERVAL equ 3044
 
scan    jmz scan,<hit          ;linear scan for bomb
        add #INTERVAL-1,hit    ;reset scan pointer
btrack  sub #INTERVAL,hit      ;trace bombs back to source
hit     jmz btrack,-1000
        mov @ptr,<hit          ;and bomb it
        mov @ptr,<hit
        spl 0,0
        mov @ptr2,<-1          ;back-up core clear
ptr     jmp -1,1
ptr2    dat #1
        dat #1
 
        end scan

;redcode
;name WORM
;assert 1
;
;       The WORM is a lovely little program that is very difficult to 
;       destroy. It is not very aggressive, and could be hopped over 
;       pretty easily.
;       
;       Create the creeping unstoppable worm.
;
;       The worm is a consecutive array of imps. Each imp is a separate
;       process, and they are running in consecutive locations.
;
;       No frontal assault of any kind can destroy a worm. It is self 
;       repairing. The only effective attack against a worm is to destroy
;       it from left to right.
;
length  dat #5
start   spl extrude
        djn 0,length
        mov 0,extrude   ; stop making the worm
;
extrude spl 0           ; spin here and make a worm
        mov 0,1         ; of imps

        end start
